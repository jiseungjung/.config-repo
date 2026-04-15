---
name: Merge master commit message convention
description: How to format the commit message when merging master into a branch
type: feedback
---

Use `<islands>/<layers>: Merge master` as the commit message when merging master.

- **Islands**: comma-separated list of island prefixes for islands whose files were changed by the branch (e.g. `social`, `bridge`, `gut`). If only the current island's files changed, use that island name alone.
- **Layers**: `be` if only `backend/` or `internal/` files changed, `fe` if only `frontend/` files changed, `*` if both changed.

Examples:
- `social/be: Merge master` — social island, backend/internal only
- `social/fe: Merge master` — social island, frontend only
- `social/*: Merge master` — social island, both frontend and backend
- `social/be, bridge/be: Merge master` — both social and bridge islands, backend only

**Why:** Project-wide convention for merge commits to make git history scannable by island and layer.

**How to apply:** When running `git merge origin/master`, inspect which island directories and which layers (backend vs frontend) have changed files, then construct the message accordingly.
