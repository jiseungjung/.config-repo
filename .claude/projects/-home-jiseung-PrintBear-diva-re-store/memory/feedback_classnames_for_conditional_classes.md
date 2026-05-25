---
name: Use classnames module for conditional classes
description: Always use the classnames module (imported as classNames) for conditional className logic, never ternaries or template literals
type: feedback
originSessionId: 078b28af-c254-41ea-9c1b-dd7ff69da739
---
Always use the `classnames` module for conditional classes.

**Why:** User preference for consistency; ternaries like `condition ? 'class' : undefined` should be replaced with `classNames({ class: condition })`.

**How to apply:** Import `classNames from 'classnames'` and use object syntax for any conditional className. Applies to all frontend components in this codebase.
