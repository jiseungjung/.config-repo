---
name: feedback_jsdoc_exports
description: All exported functions/constants must have a JSDoc comment; file-level JSDoc required too
metadata: 
  node_type: memory
  type: feedback
  originSessionId: dcccc0d1-b1ee-42fa-afca-ef973c7aa70c
---

Every exported symbol must have a JSDoc comment, as enforced by an ESLint rule. Files also get a file-level JSDoc comment.

Format:
- File level: `/** File contains ... */` — must start with "File contains"
- Export level: `/** Get the service type from URL slug. */`

**Why:** ESLint rule requires JSDoc on exports; user explicitly said to remember this.

**How to apply:** Whenever writing or editing a file with exports, ensure every `export const`, `export function`, etc. has a `/** ... */` doc comment above it. Also add a file-level `/** ... */` at the top.
