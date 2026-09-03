#!/usr/bin/env python
# SPDX-FileCopyrightText: Copyright (c) 2026 Nasir Ali, C-DAC Noida
# SPDX-License-Identifier: Apache-2.0
"""Pre-submission checks for the manuscript.

Enforces the journal's mechanical requirements and this project's integrity
rule that no numeric result is typed by hand. Exits non-zero on any failure so
CI can gate on it.

The numeric-literal check is the important one. Everything else here is a
formatting rule a copy-editor would catch; a hand-typed number that has since
drifted from the data it claims to report is exactly what nobody catches.
"""
from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path
from typing import List, Tuple

REPO_ROOT = Path(__file__).resolve().parent.parent
PAPER_DIR = REPO_ROOT / "paper"

# Sections whose prose must not contain typed numbers. Background and related
# work legitimately quote figures from other papers, which are not ours to
# generate.
RESULT_SECTIONS = ("Results", "The compute roofline")

# Numbers that are structural rather than results: section/figure references,
# small counts in ordinary English, percentages of the form "50\,\%" used as a
# stated assumption, and the tier labels T1-T4.
ALLOWED_LITERAL = re.compile(
    # Single digits and round counts read as ordinary English rather than as
    # measurements. 95 and 99 are conventional confidence levels: they name a
    # statistical procedure, not a value derived from our data, so requiring
    # them to come from a macro would be noise.
    r"^(?:[0-9]|10|100|1000|95|99)$"
)


class Check:
    def __init__(self) -> None:
        self.failures: List[str] = []
        self.warnings: List[str] = []
        self.passes: List[str] = []

    def ok(self, msg: str) -> None:
        self.passes.append(msg)

    def warn(self, msg: str) -> None:
        self.warnings.append(msg)

    def fail(self, msg: str) -> None:
        self.failures.append(msg)

    def report(self) -> int:
        for m in self.passes:
            print(f"  PASS  {m}")
        for m in self.warnings:
            print(f"  WARN  {m}")
        for m in self.failures:
            print(f"  FAIL  {m}")
        print(f"\n{len(self.passes)} passed, {len(self.warnings)} warnings, "
              f"{len(self.failures)} failures")
        return 1 if self.failures else 0


def strip_comments(tex: str) -> str:
    return re.sub(r"(?<!\\)%.*", "", tex)


def extract_abstract(tex: str) -> str:
    m = re.search(r"\\abstract\{(.*?)\}\s*\n\s*\n", tex, re.S)
    if not m:
        m = re.search(r"\\abstract\{(.*?)\n\n", tex, re.S)
    return m.group(1) if m else ""


def word_count(text: str) -> int:
    t = re.sub(r"\\[a-zA-Z]+\*?", " ", text)
    t = re.sub(r"[{}$\\~^_]", " ", t)
    return len(t.split())


def section_bodies(tex: str) -> List[Tuple[str, str]]:
    """(title, body) for each \\section, body running to the next \\section."""
    parts = re.split(r"\\section\*?\{([^}]*)\}", tex)
    out = []
    for i in range(1, len(parts) - 1, 2):
        out.append((parts[i], parts[i + 1]))
    return out


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--tex", type=Path, default=PAPER_DIR / "main.tex")
    ap.add_argument("--bib", type=Path, default=PAPER_DIR / "references.bib")
    ap.add_argument("--numbers", type=Path, default=PAPER_DIR / "generated_numbers.tex")
    args = ap.parse_args()

    c = Check()
    if not args.tex.exists():
        print(f"FAIL: {args.tex} not found")
        sys.exit(1)

    raw = args.tex.read_text()
    tex = strip_comments(raw)

    # --- abstract length -------------------------------------------------
    abstract = extract_abstract(tex)
    n = word_count(abstract)
    if not abstract:
        c.fail("no \\abstract{} found")
    elif 100 <= n <= 150:
        c.ok(f"abstract is {n} words (required 100-150)")
    else:
        c.fail(f"abstract is {n} words; the journal requires 100-150")

    # --- keywords --------------------------------------------------------
    kw = re.search(r"\\keywords\{(.*?)\}", tex, re.S)
    if not kw:
        c.fail("no \\keywords{} found")
    else:
        k = [x.strip() for x in kw.group(1).split(",") if x.strip()]
        if 4 <= len(k) <= 6:
            c.ok(f"{len(k)} keywords (required 4-6)")
        else:
            c.fail(f"{len(k)} keywords; the journal requires 4-6")

    # --- heading depth ---------------------------------------------------
    if re.search(r"\\subsubsubsection", tex):
        c.fail("heading deeper than three levels")
    else:
        c.ok("heading depth within three levels")

    # --- declarations ----------------------------------------------------
    required = ["Funding", "Competing interests", "Data availability",
                "Code availability", "Author contributions"]
    missing = [r for r in required if r.lower() not in tex.lower()]
    if missing:
        c.fail(f"declarations missing: {', '.join(missing)}")
    else:
        c.ok("declarations section covers all required items")

    # --- citations resolve against the bib -------------------------------
    if args.bib.exists():
        bib_keys = set(re.findall(r"^@[a-zA-Z]+\{([^,]+),", args.bib.read_text(), re.M))
        cited = set()
        for m in re.findall(r"\\cite[a-z]*\{([^}]*)\}", tex):
            cited.update(x.strip() for x in m.split(",") if x.strip())
        undefined = sorted(cited - bib_keys)
        orphans = sorted(bib_keys - cited)
        if undefined:
            c.fail(f"cited but absent from the bibliography: {', '.join(undefined)}")
        else:
            c.ok(f"all {len(cited)} cited keys resolve")
        if orphans:
            c.warn(f"in the bibliography but never cited: {', '.join(orphans)}")
        else:
            c.ok("no orphan bibliography entries")

    # --- figures are cited, and in order ---------------------------------
    included = re.findall(r"\\includegraphics(?:\[[^\]]*\])?\{([^}]+)\}", tex)
    for fig in included:
        stem = Path(fig).stem
        if not (PAPER_DIR / f"{stem}.pdf").exists():
            c.fail(f"figure {stem}.pdf is included but missing from paper/")
    labels = re.findall(r"\\label\{(fig:[^}]+)\}", tex)
    for lab in labels:
        if not re.search(r"\\ref\{" + re.escape(lab) + r"\}", tex):
            c.fail(f"figure label {lab} is never referenced in the text")
    if included and not c.failures:
        c.ok(f"all {len(included)} figures present and referenced")

    # --- the integrity check --------------------------------------------
    if args.numbers.exists():
        macros = set(re.findall(r"\\newcommand\{\\([A-Za-z]+)\}", args.numbers.read_text()))
        c.ok(f"{len(macros)} generated macros available")
    else:
        c.warn(f"{args.numbers} not found; cannot verify generated numbers")

    offenders: List[str] = []
    for title, body in section_bodies(tex):
        if not any(title.startswith(s) for s in RESULT_SECTIONS):
            continue
        # Ignore maths, labels/refs, and figure/table environments.
        prose = re.sub(r"\$[^$]*\$", " ", body)
        prose = re.sub(r"\\(?:label|ref|cite[a-z]*)\{[^}]*\}", " ", prose)
        prose = re.sub(r"\\begin\{figure\}.*?\\end\{figure\}", " ", prose, flags=re.S)
        prose = re.sub(r"\\begin\{table\}.*?\\end\{table\}", " ", prose, flags=re.S)
        prose = re.sub(r"\\includegraphics(?:\[[^\]]*\])?\{[^}]*\}", " ", prose)
        for tok in re.findall(r"(?<![A-Za-z\\])\d+(?:\.\d+)?", prose):
            if not ALLOWED_LITERAL.match(tok):
                offenders.append(f"{title!r}: {tok}")
    if offenders:
        c.fail("numeric literals in results prose (use a generated macro): "
               + "; ".join(offenders[:8])
               + (f" (+{len(offenders) - 8} more)" if len(offenders) > 8 else ""))
    else:
        c.ok("no hand-typed numeric literals in results prose")

    # --- Overleaf contract ----------------------------------------------
    for bad, why in [(r"\\graphicspath", "\\graphicspath breaks a flat submission"),
                     (r"\\write18", "\\write18 requires shell-escape"),
                     (r"minted", "minted requires shell-escape")]:
        if re.search(bad, tex):
            c.fail(f"{why}")
    if re.search(r"\\includegraphics(?:\[[^\]]*\])?\{[^}]*/", tex):
        c.fail("figures referenced by path; the submission must be flat")
    else:
        c.ok("figure references are flat")

    for needed in ["sn-jnl.cls"]:
        if not (PAPER_DIR / needed).exists():
            c.fail(f"{needed} is not vendored into paper/")
    bst = list(PAPER_DIR.glob("*.bst"))
    if not bst:
        c.fail("no .bst vendored into paper/")
    else:
        c.ok(f"template vendored ({', '.join(p.name for p in bst)})")

    print()
    sys.exit(c.report())


if __name__ == "__main__":
    main()
