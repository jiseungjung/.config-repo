---
name: Ask permission only for file writes
description: Always ask permission before writing/editing files, but never for reads or other non-destructive actions
type: feedback
---

Always ask for permission before writing or editing files. Do NOT ask for permission for read-only actions (Read, Grep, Glob, Bash reads, etc.).

**Why:** User explicitly said "don't ask for permission that doesn't write anything" — meaning reads and searches should proceed freely, but file writes still need approval.

**How to apply:** Reads, searches, and bash commands that don't modify files → proceed without asking. File writes and edits → always ask first.
