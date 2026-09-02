#!/usr/bin/env python
# SPDX-FileCopyrightText: Copyright (c) 2026 Nasir Ali, C-DAC Noida
# SPDX-License-Identifier: Apache-2.0
"""Build paper/references.bib by fetching every entry from a real source.

No entry in this file is hand-authored. Each is retrieved from the arXiv API
or from DOI content negotiation against Crossref/DataCite, and anything that
cannot be resolved is written to paper/UNVERIFIED_REFS.md and left out of the
bibliography rather than invented. That is a hard requirement: a fabricated
citation is worse than a missing one.

Where a preprint has since been published, the published version is preferred
and the arXiv id is retained in the entry's eprint field.
"""
from __future__ import annotations

import argparse
import json
import re
import sys
import time
import urllib.error
import urllib.parse
import urllib.request
import xml.etree.ElementTree as ET
from pathlib import Path
from typing import Dict, List, Optional, Tuple

REPO_ROOT = Path(__file__).resolve().parent.parent
PAPER_DIR = REPO_ROOT / "paper"
USER_AGENT = "surface-code-hierarchical-decoder/0.1 (research; mailto:nasirali2607@gmail.com)"

# key -> ("doi", value) or ("arxiv", value). Keys are what main.tex cites.
SOURCES: Dict[str, Tuple[str, str]] = {
    # Core tools and decoders
    "gidney2021stim":         ("doi", "10.22331/q-2021-07-06-497"),
    "higgott2025sparseblossom": ("doi", "10.22331/q-2025-01-20-1600"),
    "higgott2022pymatching":  ("arxiv", "2105.13082"),
    # The two 2026 works this study builds on and measures against
    "chamberland2026fast":    ("arxiv", "2604.12841"),
    "yang2026realtime":       ("arxiv", "2605.04892"),
    # Surface code foundations
    "fowler2012surface":      ("doi", "10.1103/PhysRevA.86.032324"),
    "dennis2002topological":  ("doi", "10.1063/1.1499754"),
    "kitaev2003fault":        ("doi", "10.1016/S0003-4916(02)00018-0"),
    # Below-threshold experiment
    "google2025belowthreshold": ("doi", "10.1038/s41586-024-08449-y"),
    # Neural / ML decoders
    "bausch2024alphaqubit":   ("doi", "10.1038/s41586-024-08148-8"),
    "torlai2017neural":       ("doi", "10.1103/PhysRevLett.119.030501"),
    "varsamopoulos2017decoding": ("doi", "10.1088/2058-9565/aa955a"),
    # Union-find and fast decoders
    "delfosse2021almost":     ("doi", "10.22331/q-2021-12-02-595"),
    # Backlog / windowed decoding
    "skoric2023parallel":     ("doi", "10.1038/s41467-023-42482-1"),
    "terhal2015quantum":      ("doi", "10.1103/RevModPhys.87.307"),
    # Hardware decoders
    "das2022lilliput":        ("arxiv", "2108.06569"),
    "das2022afs":             ("arxiv", "2301.03107"),
    "ueno2021qecool":         ("arxiv", "2103.07526"),
    "ueno2022qulatis":        ("arxiv", "2204.07561"),
    # Barber et al: the DOI first used here (10.22331/q-2025-04-24-1712) does
    # not exist in Crossref -- it was wrong, not merely unreachable. The real
    # record is Nature Electronics 8, 84 (2025).
    "barber2025realtime":     ("doi", "10.1038/s41928-024-01319-5"),
    "alavisamani2024promatch": ("arxiv", "2404.03136"),
    "battistel2023realtime":  ("doi", "10.1088/2399-1984/aceba6"),
    # Quantisation / efficient inference
    "jacob2018quantization":  ("arxiv", "1712.05877"),
    "hubara2017quantized":    ("arxiv", "1609.07061"),
    "umuroglu2017finn":       ("arxiv", "1612.07119"),
    "duarte2018hls4ml":       ("doi", "10.1088/1748-0221/13/07/P07027"),
    # Calibration
    "guo2017calibration":     ("arxiv", "1706.04599"),
    "niculescu2005predicting": ("doi", "10.1145/1102351.1102430"),
}


def _get(url: str, accept: Optional[str] = None, timeout: int = 30) -> str:
    req = urllib.request.Request(url)
    req.add_header("User-Agent", USER_AGENT)
    if accept:
        req.add_header("Accept", accept)
    with urllib.request.urlopen(req, timeout=timeout) as resp:
        return resp.read().decode("utf-8", errors="replace")


def fetch_doi_bibtex(doi: str) -> Optional[str]:
    """DOI content negotiation; works for Crossref and DataCite registrants."""
    try:
        return _get(f"https://doi.org/{urllib.parse.quote(doi)}",
                    accept="application/x-bibtex")
    except (urllib.error.HTTPError, urllib.error.URLError, TimeoutError):
        return None


def fetch_arxiv_bibtex(arxiv_id: str) -> Optional[str]:
    """Build a BibTeX entry from the arXiv API's own metadata.

    The fields come verbatim from the API response, so this is still a
    fetched record rather than a hand-written one; arXiv exposes no BibTeX
    endpoint of its own. If the entry carries a DOI, the caller is expected
    to have preferred that route already.
    """
    try:
        xml = _get(f"https://export.arxiv.org/api/query?id_list={urllib.parse.quote(arxiv_id)}")
    except (urllib.error.HTTPError, urllib.error.URLError, TimeoutError):
        return None

    ns = {"a": "http://www.w3.org/2005/Atom"}
    root = ET.fromstring(xml)
    entry = root.find("a:entry", ns)
    if entry is None:
        return None
    title_el = entry.find("a:title", ns)
    if title_el is None or title_el.text is None:
        return None

    # Detect an API error by the entry's id, which arXiv sets to a URL under
    # /api/errors. An earlier version of this tested whether the *title*
    # contained the substring "Error", which silently rejected every
    # legitimately-titled quantum-error-correction paper in the bibliography
    # -- including "Real-time Surface-Code Error Correction ...". Do not
    # reintroduce a substring test here.
    id_el = entry.find("a:id", ns)
    if id_el is not None and id_el.text and "/api/errors" in id_el.text:
        return None

    title = " ".join(title_el.text.split())
    authors = [
        " ".join(a.find("a:name", ns).text.split())
        for a in entry.findall("a:author", ns)
        if a.find("a:name", ns) is not None
    ]
    published = entry.find("a:published", ns)
    year = published.text[:4] if published is not None and published.text else ""
    summary_doi = entry.find("a:doi", {"a": "http://arxiv.org/schemas/atom"})

    fields = [
        f"  title = {{{title}}}",
        f"  author = {{{' and '.join(authors)}}}",
        f"  year = {{{year}}}",
        f"  eprint = {{{arxiv_id}}}",
        "  archivePrefix = {arXiv}",
        f"  url = {{https://arxiv.org/abs/{arxiv_id}}}",
    ]
    if summary_doi is not None and summary_doi.text:
        fields.append(f"  doi = {{{summary_doi.text}}}")
    return "@misc{KEY,\n" + ",\n".join(fields) + "\n}\n"


def rekey(entry: str, key: str) -> str:
    """Replace whatever key the source used with ours, so \\cite keys are stable."""
    return re.sub(r"^(\s*@\w+\s*\{)[^,]*,", rf"\g<1>{key},", entry.strip(), count=1, flags=re.M)


def strip_month(entry: str) -> str:
    """Remove month fields.

    Crossref emits `month=Jan` unbraced, and the Springer .bst files do not
    define those three-letter month macros, so BibTeX warns "string name
    'jan' is undefined" on every such entry. Month is optional for all entry
    types used here, so dropping it is cleaner than guessing a quoting form
    that suits every style.
    """
    return re.sub(r",\s*month\s*=\s*[^,}]+(?=[,}])", "", entry, flags=re.IGNORECASE)


def normalise_doi_url(entry: str) -> str:
    """The journal wants DOIs as full https://doi.org/ links.

    Crossref emits `DOI={10....}` (upper case, no spaces) while arXiv-derived
    entries use `doi = {10....}`, so the match must be case-insensitive and
    tolerate either spacing; an earlier lower-case-only pattern silently left
    every Crossref DOI unconverted.
    """
    return re.sub(r"(doi\s*=\s*\{)(?!https://doi\.org/)(10\.[^}]+?)(\})",
                  r"\1https://doi.org/\2\3", entry, flags=re.IGNORECASE)


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--out", type=Path, default=PAPER_DIR / "references.bib")
    ap.add_argument("--sleep", type=float, default=0.4, help="politeness delay between requests")
    args = ap.parse_args()

    PAPER_DIR.mkdir(parents=True, exist_ok=True)
    entries: List[str] = []
    unverified: List[Tuple[str, str, str]] = []

    for key, (kind, value) in SOURCES.items():
        raw = None
        if kind == "doi":
            raw = fetch_doi_bibtex(value)
            if raw is None:
                # A DOI that will not negotiate is worth one arXiv retry only
                # if we were given an arXiv id; we were not, so record it.
                unverified.append((key, kind, value))
                print(f"  UNRESOLVED  {key:26s} doi:{value}")
                time.sleep(args.sleep)
                continue
        else:
            raw = fetch_arxiv_bibtex(value)
            if raw is None:
                unverified.append((key, kind, value))
                print(f"  UNRESOLVED  {key:26s} arXiv:{value}")
                time.sleep(args.sleep)
                continue

        entry = strip_month(normalise_doi_url(rekey(raw, key)))
        entries.append(entry)
        print(f"  ok          {key:26s} {kind}:{value}")
        time.sleep(args.sleep)

    header = (
        "% Generated by scripts/fetch_refs.py -- do not edit by hand.\n"
        "% Every entry was fetched from the arXiv API or DOI content negotiation.\n"
        f"% Regenerate with: python scripts/fetch_refs.py\n"
        f"% Entries: {len(entries)}\n\n"
    )
    args.out.write_text(header + "\n".join(entries) + "\n")
    print(f"\nwrote {args.out} with {len(entries)} entries")

    unver_path = PAPER_DIR / "UNVERIFIED_REFS.md"
    if unverified:
        lines = ["# Unresolved references", "",
                 "These could not be fetched from a real source and are therefore "
                 "**excluded from references.bib** and must not be cited until resolved.", ""]
        for key, kind, value in unverified:
            lines.append(f"- `{key}` — {kind}: `{value}`")
        unver_path.write_text("\n".join(lines) + "\n")
        print(f"WARNING: {len(unverified)} unresolved; see {unver_path}")
    else:
        unver_path.write_text("# Unresolved references\n\nNone: every citation resolved.\n")
        print("all references resolved")


if __name__ == "__main__":
    main()
