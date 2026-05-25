---
name: feedback-icon-color-prop
description: How to set colors on SVG icon components using muleTheme token keys
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 9d2e9f8f-a634-4151-adb7-a39c50570fe9
---

Icons accept a `color` prop with a dot-notation muleTheme token key string — not `style={{ color: ... }}` or a raw hex value.

**Why:** This is the established pattern in this codebase for icon coloring.

**How to apply:** Pass the token path as a string, e.g.:
```tsx
<CircleCheckIcon color="success.standalone.resting" />
<FileLinesIcon color="neutral.fgDisabled" />
<TriangleExclamationIcon color="danger.fg" />
```

The `color` prop type only accepts fg and standalone token paths — **not** `bg`/`bgHover`/`border` etc. Valid paths are things like `fg`, `fgMuted`, `fgDisabled`, `fgHard`, `standalone.resting`, `standalone.hover`, `standalone.active`, `standalone.disabled`, and their weaker variants. Passing a `bg` token (e.g. `"success.bg"`) will cause a TypeScript error.

The dot-notation maps into `lightColors`. See [[reference-muletheme-colors]] for where to find token values.
