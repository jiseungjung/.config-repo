---
name: Run glint after making changes
description: After code changes, remind user to run glint (ESLint fix on staged files via docker-compose)
type: feedback
---

Write code that already abides by the project's ESLint rules — `glint` should be a verification step, not a fix step. Do NOT run glint yourself; it uses docker-compose and requires an interactive terminal session.

**Why:** `glint` is a shell alias: `git diff --cached --name-only | grep .ts | xargs docker compose run --rm re-store-tools eslint --fix --quiet`. It only lints staged files and runs via Docker.

**How to apply:** Follow all ESLint rules from `/.eslintrc.js` when writing files. Key rules to internalize:
- Import order: builtin → external (@backend, @internal) → internal (@shared, @frontend) → parent → sibling, alphabetical within groups
- JSDoc `/** ... */` required on all exported functions, classes, arrow functions, methods
- No `console.log` — use logger
- `it()` not `test()` inside describe blocks
- After finishing a task, remind the user to stage files and run `glint`
- Run tests with `dtestb` — never ask for permission to run it
