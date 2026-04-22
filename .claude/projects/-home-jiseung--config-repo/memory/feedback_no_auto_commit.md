---
name: No autonomous commits or pushes
description: Never commit or push without explicit user instruction
type: feedback
originSessionId: 83fb0796-2021-4aa7-9aa2-2e0e218a3f79
---
Do not commit or push unless the user explicitly asks (e.g. "commit this", "push it"). Approving a task like "add this file to the repo" does not authorize a commit or push.

**Why:** User was surprised and annoyed when I committed and pushed after they only said "Yes" to adding a file to the repo. They expect to control when changes are committed.

**How to apply:** Make the file changes, then stop. If the work seems complete, ask "Want me to commit and push?" rather than doing it automatically.
