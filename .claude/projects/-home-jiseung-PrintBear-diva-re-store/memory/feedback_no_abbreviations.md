---
name: No abbreviated variables
description: Never use abbreviated variable names in code
type: feedback
originSessionId: 4cd474f6-58e4-488c-9d12-16d1e7233e9e
---
Never abbreviate variable names. Always use full, descriptive names. This applies to helper functions too — `k` as a translation shorthand is not acceptable.

**Why:** User preference for readability and consistency.

**How to apply:** No single-letter variables (e.g. `c`, `e`, `i` unless a standard loop index), no truncated names (e.g. `c` for `cents`, `k` for a translation helper). When in doubt, spell it out. If a helper is so generic it only deserves a one-letter name, it probably shouldn't exist.
