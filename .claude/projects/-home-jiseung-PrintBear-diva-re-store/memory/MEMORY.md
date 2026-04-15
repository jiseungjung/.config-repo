# Memory Index

- [iPhone local dev setup](project_iphone_dev_setup.md) — dnsmasq config + iPhone DNS/Safari settings to access dev.stickermule.com from phone
- [Ask permission only for file writes](feedback_write_directly.md) — reads/searches proceed freely; always ask before writing or editing files
- [REST API architecture guide](reference_rest_architecture.md) — canonical REST conventions: GET/POST only, *Dependencies pattern, thin handlers, blog/write island is key reference
- [Alphabetical import ordering within groups](feedback_import_order.md) — sort imports alphabetically by path within each ESLint import/order group
- [Use shared error classes in router files](feedback_router_errors.md) — router handlers import errors from @shared/backend/lib/api/error/errors, not @backend/utils/errors
- [Run glint after changes](feedback_glint.md) — glint runs ESLint fix on staged files via docker-compose; remind user to run it, don't run it yourself
- [OOM crashes when running dtestb](project_oom_crashes.md) — Chrome+Next.js+Docker exhausts 32GB RAM; Memory Saver enabled 2026-04-08, Options A/B/C available if it recurs
- [Merge master commit message convention](feedback_merge_master_commit_message.md) — `<islands>/<layers>: Merge master`; be=backend/internal, fe=frontend, *=both
- [No abbreviated variables](feedback_no_abbreviations.md) — always use full descriptive names, never single-letter or truncated (e.g. `c` for `cents`)
