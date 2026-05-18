---
name: readability-over-dry
description: "Prefer explicit, readable code over DRY abstractions when the abstraction hurts clarity"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: ba940e0a-3344-4736-becc-5fbfb4e53d1e
---

Don't sacrifice readability to eliminate repetition. Explicit, parallel lists (even with repeated key names) are preferred over map/index tricks or clever abstractions when the repeated form is easier to scan.

**Why:** User reverted a `getBenefits` refactor in ServiceCard.tsx that used `icons.map((_, index) => ...)` to auto-generate perk texts — it was less readable than the explicit `{ Icon: X, text: getText('perk1') }` list even though it removed the perk1/2/3 repetition.

**How to apply:** When refactoring to reduce duplication, check whether the result is genuinely easier to read or just shorter. If a reader has to mentally simulate an index to understand what each item does, the repetition was better.
