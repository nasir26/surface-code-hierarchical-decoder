# Manuscript

Self-contained Springer (Journal of Supercomputing, 11227) submission folder.

## Overleaf

Unzip `overleaf_upload.zip` → New Project → Upload Project → compile with
**pdfLaTeX**. No other setup is needed; the class and bibliography style are
vendored here.

## Local build

```bash
latexmk -C && latexmk -pdf -interaction=nonstopmode main.tex
```

Verified locally with TeX Live 2026 (TinyTeX): 0 undefined citations, 0
undefined references, 0 BibTeX errors.

If your TeX installation is minimal, `grfext` may need installing
(`tlmgr install grfext`); Overleaf's full TeX Live already has it.

## What is generated, and what is not

Nothing quantitative in this folder is hand-typed:

| File | Produced by |
|---|---|
| `generated_numbers.tex` | `scripts/make_numbers.py`, from `results/*.json` |
| `references.bib` | `scripts/fetch_refs.py`, from the arXiv API and DOI content negotiation |
| `Fig*.pdf`, `Fig*.eps` | `scripts/make_figures.py`, from `results/*.json` |

`main.tex` cites `\newcommand` macros rather than numeric literals, so the
prose cannot drift away from the data. Regenerate everything with:

```bash
python scripts/make_numbers.py && python scripts/make_figures.py
```

## Bibliography style

The class option selects the `.bst` BibTeX looks for, and BibTeX honours the
*first* `\bibstyle` in the `.aux` — so the option and the shipped `.bst` must
agree, and `main.tex` must not add its own `\bibliographystyle`. We use
`sn-mathphys-num`, a Springer-provided style rendering the numbered
square-bracket citations this journal requires. `sn-basic.bst` is not
distributed via CTAN or TeX Live; if you prefer it, add the file and change
the class option to match.
