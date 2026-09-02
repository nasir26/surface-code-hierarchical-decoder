# SPDX-FileCopyrightText: Copyright (c) 2026 Nasir Ali, C-DAC Noida
# SPDX-License-Identifier: Apache-2.0
"""Number formatting for the manuscript's generated macros.

These guard a class of bug that is invisible in review: a macro that renders a
wrong-but-plausible number into the paper. Both cases below were real.
"""
import importlib.util
import sys
from pathlib import Path

import pytest

REPO_ROOT = Path(__file__).resolve().parent.parent
spec = importlib.util.spec_from_file_location(
    "make_numbers", REPO_ROOT / "scripts" / "make_numbers.py"
)
make_numbers = importlib.util.module_from_spec(spec)
sys.modules["make_numbers"] = make_numbers
spec.loader.exec_module(make_numbers)

fmt = make_numbers.fmt
pct = make_numbers.pct
Numbers = make_numbers.Numbers


@pytest.mark.parametrize("value,expected", [
    (300.0, "300"),      # regression: .rstrip("0") rendered this as "3"
    (100.0, "100"),
    (225.0, "225"),
    (10.0, "10"),
    (1000.0, "1,000"),
])
def test_trailing_zero_integers_survive(value, expected):
    assert fmt(value) == expected


def test_significant_figures_not_fixed_decimals():
    # regression: a fixed-decimal rule rendered 0.69462 with five digits,
    # claiming precision the confidence interval does not support.
    assert fmt(0.69462) == "0.695"
    assert fmt(1.2149) == "1.21"


def test_small_values_use_scientific_notation():
    out = fmt(0.0000123)
    assert "\\times 10^{" in out
    assert out.startswith("1.23")


def test_pct_scales_and_rounds():
    assert pct(0.0069462) == "0.695"
    assert pct(0.5) == "50"


def test_zero_and_negatives():
    assert fmt(0) == "0"
    assert fmt(-300.0) == "-300"


def test_duplicate_macro_is_rejected():
    """A silently overwritten macro would let two results share one name."""
    n = Numbers()
    n.add("someMacro", "1", "src")
    with pytest.raises(ValueError, match="duplicate macro"):
        n.add("someMacro", "2", "src")


def test_render_emits_newcommands_and_provenance():
    n = Numbers()
    n.add("alpha", "1.23", "results/x.json, T4")
    out = n.render()
    assert "\\newcommand{\\alpha}{1.23}" in out
    assert "results/x.json, T4" in out
