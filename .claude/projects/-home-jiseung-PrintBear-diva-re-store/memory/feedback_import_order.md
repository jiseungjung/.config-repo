---
name: Alphabetical import ordering within groups
description: Sort imports alphabetically by path within each ESLint group — only for new files, never reorder existing files
type: feedback
originSessionId: 8130d6b4-8d6f-407c-b12d-dfb5d93ad5d4
---
When writing NEW files, sort imports alphabetically by the full module path within each group. Do NOT reorder imports in existing files being edited.

**Why:** Reordering existing imports creates noisy diffs and the user did not ask for it.

**How to apply:** The ESLint config defines these groups (each separated by a blank line):
1. `builtin` — node built-ins (fs, path)
2. `external` — node_modules packages AND unrecognized aliases like `@backend/**`, `@internal/**` (not in pathGroups)
3. `internal` — `@shared/**`, `@frontend/**`, `@pages/**`, `@assets/**` (defined in pathGroups)
4. `parent` — `../` imports
5. `sibling` — `./` imports

Within each group, sort alphabetically by the full path string. Non-scoped packages (e.g. `express`) come before scoped (`@backend`, `@internal`) within the external group. Only apply this when creating a new file from scratch.
