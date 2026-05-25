---
name: feedback_file_and_component_conventions
description: Frontend file/folder structure and code style conventions for this project
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 8783f5e5-5e75-4053-ad8e-a83d62ebc477
---

Three rules:

1. **Helper functions go at the bottom of the file** — below the exported component, not above it.
   **Why:** Keeps the component (the important part) visible at the top without scrolling past implementation details.
   **How to apply:** Any private helper defined in a component file must be placed after the last export.

2. **No nested ternaries** (ESLint rule) — use if/else chains instead.
   **Why:** ESLint enforces this; nested ternaries fail the linter.
   **How to apply:** Replace `a ? x : b ? y : z` with an `if/else if/else` block assigning to a `let`.

3. **Single-file components stay as files, not folders** — if a component folder has only one `.tsx` file (plus an `index.ts` re-export), collapse it to a single `.tsx` file at the parent level and delete the folder.
   **Why:** Avoids unnecessary folder + index.ts boilerplate for simple components.
   **How to apply:** When a folder contains only `ComponentName.tsx` + `index.ts` (re-export only), move to `ComponentName.tsx` one level up and delete the folder. Existing `@alias/components/ComponentName` imports continue to resolve correctly via TypeScript module resolution.
