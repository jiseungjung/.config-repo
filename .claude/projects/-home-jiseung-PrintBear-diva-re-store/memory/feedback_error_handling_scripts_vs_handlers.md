---
name: Error handling in scripts vs request handlers
description: Scripts should log+return on missing data; request handlers should throw
type: feedback
originSessionId: b9a0eaf9-5dfe-4005-b3e0-504aa561d06f
---
In script contexts (e.g. auto-cancel-requests.ts), handle missing data with logger.error + return so one failed item doesn't abort the whole batch. Reserve throwing errors for request handlers and lib functions.

**Why:** A script processes many items in parallel; throwing on one team lookup would stop all email sends. Graceful degradation is correct here.

**How to apply:** When writing or editing scripts that loop over records, use log+return for recoverable failures. Only throw in resolvers, lib functions, and API handlers where the caller needs to handle the error.
