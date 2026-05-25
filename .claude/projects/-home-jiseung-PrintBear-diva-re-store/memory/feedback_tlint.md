---
name: feedback_tlint
description: Always run tlint after modifying translation files
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 8783f5e5-5e75-4053-ad8e-a83d62ebc477
---

After every change to translation files (e.g. `frontend/i18n/translations/en.json`), run `tlint` from the repo root (`/home/jiseung/PrintBear/diva`).

**Why:** tlint validates and auto-fixes translation key formatting; untested translation changes can silently break i18n.
**How to apply:** Run it yourself as part of the task — never tell the user to run it.

`tlint` is a shell alias:
```
re-store eslint --config=./.i18n.eslintrc.js --no-eslintrc --ext=json islands/social/frontend/i18n/translations --fix
```

Must be run from `/home/jiseung/PrintBear/diva` (where `.i18n.eslintrc.js` lives).
