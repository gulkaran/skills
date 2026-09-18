---
name: self-review
description: Analysis-only review of the topic's changes for merge-blockers, cross-checked against the topic's recorded decisions so deliberate deviations are never flagged. Verifies tests weren't quietly weakened after the red commit. Writes review.md; changes no code. Use after execute has opened the PR (or pre-PR on request).
disable-model-invocation: true
---

# Self-review

Find what would genuinely block a merge — with the topic's context in hand, so
conscious choices don't get flagged as mistakes. Analysis only: this skill
never edits code.

Read first: `~/.agents/skills/_shared/config.md`,
`~/.agents/skills/_shared/topic.md`, `~/.agents/skills/_shared/style.md`.

## Preconditions

Resolve the topic. Load `design.md` and `decisions.md` **before reading any
code** — they are the lens for every judgment below.

## Process

### 1. Three passes

- **Diff pass:** the changes themselves — correctness, edge cases, error
  handling, security, things the diff breaks.
- **Contract pass:** the changes against `design.md` — does the behavior match
  the acceptance criteria? Anything promised but missing, or built but never
  promised?
- **Test-integrity pass:** diff every test file against its slice's red
  commit. A post-red test change without a matching justification in
  `decisions.md` is an automatic finding. Also judge whether the tests still
  test the *wanted* behavior rather than the implementation that happens to
  exist.

### 2. Context check — before anything becomes a finding

Cross-check every candidate finding against `decisions.md`. If it's a recorded
deliberate deviation, it is **not a finding**; list it once under "Verified
deliberate" so the human sees the check happened. Only unexplained departures
survive as findings.

### 3. Report

Tiered per the style contract:

- **Merge-blockers** in full: what, why it blocks, inline context, where it
  lives.
- **Lower-impact** findings as individually named one-liners.
- **Verified deliberate** deviations, one line each.

Deliver the full report in chat. Write `review.md` (report + appendix with
evidence and locations). Log line in `_state.md`. Recommend `review-fix` if
anything needs fixing; changes remain untouched.
