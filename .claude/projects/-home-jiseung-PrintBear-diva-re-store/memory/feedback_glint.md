---
name: Run glint after making changes
description: After code changes, remind user to run glint (ESLint fix on staged files via docker-compose)
type: feedback
originSessionId: 208bfbb7-fef9-42e8-a981-9f8e2ef95a6d
---
Write code that already abides by the project's ESLint rules. After making file changes, stage the changed files and run glint yourself.

**Why:** `glint` is a shell alias: `git diff --cached --name-only | grep .ts | xargs docker compose run --rm re-store-tools eslint --fix --quiet`. It only lints staged files and runs via Docker. User explicitly asked Claude to run it, not just remind them.

**How to apply:** Follow all ESLint rules from `/.eslintrc.js` when writing files. Key rules to internalize:
- Import order: builtin → external (@backend, @internal) → internal (@shared, @frontend) → parent → sibling, alphabetical within groups
- JSDoc `/** ... */` required on all exported functions, classes, arrow functions, methods
- No `console.log` — use logger
- `it()` not `test()` inside describe blocks
- After finishing a task, stage the changed files and run `glint` yourself via Bash
- Run tests with `dtestb` — never ask for permission to run it
