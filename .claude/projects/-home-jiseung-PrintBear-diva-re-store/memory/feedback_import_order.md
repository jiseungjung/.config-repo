---
name: Alphabetical import ordering within groups
description: Within each import group (as defined by ESLint import/order), sort imports alphabetically by path
type: feedback
---

Within each import section (separated by blank lines per the import/order ESLint rule), sort imports alphabetically by the full module path.

**Why:** User explicitly asked for this convention to be followed consistently.

**How to apply:** The ESLint config defines these groups (each separated by a blank line):
1. `builtin` — node built-ins (fs, path)
2. `external` — node_modules packages AND unrecognized aliases like `@backend/**`, `@internal/**` (not in pathGroups)
3. `internal` — `@shared/**`, `@frontend/**`, `@pages/**`, `@assets/**` (defined in pathGroups)
4. `parent` — `../` imports
5. `sibling` — `./` imports

Within each group, sort alphabetically by the full path string. Non-scoped packages (e.g. `express`) come before scoped (`@backend`, `@internal`) within the external group.
