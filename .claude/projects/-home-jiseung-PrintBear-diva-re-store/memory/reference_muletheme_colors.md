---
name: reference-muletheme-colors
description: Where muleTheme color tokens are defined and how to look up colors
metadata: 
  node_type: memory
  type: reference
  originSessionId: 9d2e9f8f-a634-4151-adb7-a39c50570fe9
---

muleTheme color tokens are defined in:
- `shared/frontend/newThemes/tokens/colors/light.ts` — `lightColors` (the active set for muleTheme)
- `shared/frontend/newThemes/tokens/colors/common.ts` — common color groups (success, danger, neutral, info, warning, etc.)
- `shared/frontend/newThemes/tokens/colors/overrides/stickermule.ts` — stickermule-specific overrides (primary, primaryAlt, utility)

`muleTheme.colors` uses `mapColorsToCSSVars(lightColors)`, so `lightColors` is the source of truth for available color values and token names.
