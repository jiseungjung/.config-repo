---
name: Ask permission only for file writes; never commit without being asked
description: Always ask permission before writing/editing files; never commit to git unless explicitly asked
type: feedback
originSessionId: c28e4385-5b3b-49b1-bb00-e2eb8dc1c673
---
Always ask for permission before writing or editing files. Do NOT ask for permission for read-only actions (Read, Grep, Glob, Bash reads, etc.).

Never commit to git unless the user explicitly asks. Making changes and committing them are separate steps — stop after making the changes.

**Why:** User explicitly said "don't ask for permission that doesn't write anything" — meaning reads and searches should proceed freely, but file writes still need approval. User also said "don't commit unless I say so" after Claude auto-committed config-repo changes.

**How to apply:** Reads, searches, and bash commands that don't modify files → proceed without asking. File writes and edits → always ask first. Git commits → only when the user explicitly requests it.
