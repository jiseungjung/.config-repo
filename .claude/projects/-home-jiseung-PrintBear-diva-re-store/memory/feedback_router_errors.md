---
name: Use shared error classes in router files
description: Router handlers must import error classes from @shared/backend/lib/api/error/errors, not @backend/utils/errors
type: feedback
---

In router files (`backend/src/router/**`), always import error classes from `@shared/backend/lib/api/error/errors`, not from `@backend/utils/errors`.

**Why:** User explicitly specified this convention for the router layer.

**How to apply:** Any time writing or editing a file under `router/`, use:
`import { NotFoundError, BadRequestError, ... } from '@shared/backend/lib/api/error/errors'`
