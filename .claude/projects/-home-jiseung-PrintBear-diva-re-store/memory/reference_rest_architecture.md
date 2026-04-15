---
name: REST API architecture guide
description: Canonical guidelines for REST router setup, dependencies, errors, frontend clients, hooks, and testing across all islands
type: reference
---

Located at: /home/jiseung/PrintBear/kbase/architecture/rest.md

Key conventions:
- Only GET and POST methods (no PUT/PATCH/DELETE)
- Routes: create=POST /, read=GET /:id, update=POST /:id, delete=POST /:id/delete
- Dependencies declared as static class properties in `*Dependencies.ts` files — always instantiate with `new`, never use singletons from other modules
- Handlers are thin orchestrators: validate → query → format → return
- Domain logic goes in `lib/` functions, not in handlers
- Domain errors should be plain Error subclasses; translate to API errors (BadRequestError etc.) in the handler layer
- Error classes from `@shared/backend/lib/api/error/errors`
- Blog/write island is the key reference for conventions
- Frontend: use `useFetch` for data fetching on mount, `useAction` for mutations
- Any route added must include tests
