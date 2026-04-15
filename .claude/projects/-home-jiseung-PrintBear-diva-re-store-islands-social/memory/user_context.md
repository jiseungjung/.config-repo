---
name: User working context
description: User primarily works in the social island of the re-store monorepo
type: user
---

User works primarily in the social island (`re-store/islands/social/`). The monorepo (`re-store`) has many islands (xstudio, xnotify, core, tools, blog, ship, support, proofing, stimulus, manufacturing, forms, etc.) with shared patterns and similar names (e.g., `getWriteUrl` exists in nearly every island). When the user references a resolver, component, or utility without specifying an island, assume they mean social unless explicitly stated otherwise.
