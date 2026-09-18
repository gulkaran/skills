# Pull request style

Every PR created by the workflow uses this shape. One PR per slice of the
design's PR stack; a PR covers only its own branch's changes.

## Title

- Imperative mood, ≤72 characters: "Add inbox collapse for stacked PRs".
- Optional scope prefix when the repo already uses one (`auth:`, `fix:`).

## Description

```markdown
## TL;DR

2–3 lines: what this PR does and why, readable without context.

## What changed

- One bullet per meaningful change, behavior-first (what it does, not which
  files moved).

## How to test

- Concrete steps or the test command(s) that prove the behavior.

## Why

Link the design and the issue: `Closes #<n>`. One or two lines of context —
what decision or acceptance criteria this slice delivers. Link the topic
folder.

## Deviations from design

Only if any. One line each, matching entries in `decisions.md`. Omit the
section when empty.
```

## Rules

- Tests-first evidence stays visible: don't squash away the red commit locally
  before the PR is opened (squash-on-merge is fine).
- No generated noise, no credentials, no unrelated changes in the diff.
