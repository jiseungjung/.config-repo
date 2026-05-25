---
name: feedback_import_paths_absolute
description: Always use absolute @frontend/ imports; only use ./ for same-folder imports
metadata: 
  node_type: memory
  type: feedback
  originSessionId: cf53df9f-6967-4381-a196-86f6051ef411
---

Always use absolute `@frontend/` paths for imports. Only use relative `./` when the imported file is in the exact same folder as the importing file. Never use `../` or any multi-level relative path.

**Why:** User explicitly enforced this rule during the HireRequest → HireMeRequest rename (2026-05-22).

**How to apply:** When writing or updating imports in any frontend file, check if the target is in the same folder. If yes, use `./filename`. Otherwise, use the full `@frontend/components/...` absolute path.
