---
name: execute
description: Implement an approved design in TDD slices - behavior tests committed red first, then implementation to green. Ends with a pre-PR report the human approves before the PR is created. Use only on a topic with a recorded design approval.
disable-model-invocation: true
---

# Execute

Implement the approved design, slice by slice, tests first. Git history is the
evidence that tests came before implementation. Ends at a human gate before
any PR exists.

Read first: `~/.agents/skills/_shared/config.md`,
`~/.agents/skills/_shared/topic.md`,
`~/.agents/skills/_shared/pr.md`.

## Preconditions

Resolve the topic. **Refuse to run without `design_approved` in `_state.md`**
— point the human at `design` instead. Work on the branch recorded in
`_state.md` (create it if needed). Set phase `executing`.

## Per slice, in the design's stack order

### 1. Tests first (red)

- Derive behavior tests from the slice's **acceptance criteria in
  `design.md`** — the behavior we want, not the implementation that will
  exist. Core coverage of the concepts that matter; not exhaustive
  micro-testing.
- The test author must not see implementation-in-progress. Either write tests
  before any implementation exists, or delegate test authoring to a subagent
  given only `design.md`.
- **Commit the failing tests**: `test(<slice>): red — <behavior>`. This commit
  is the evidence trail; never rewrite it away before the PR exists.

### 2. Implement (green)

- Implement until the red tests pass. Mechanical slices may be delegated to
  faster models; the design contract travels with the delegation.
- **Never weaken a test to make it pass.** Any test edit after the red commit
  requires a one-line justification appended to `decisions.md`. Silent test
  mutations become automatic self-review findings.

### 3. Drift

Apply the topic protocol's drift policy: minor → record in `decisions.md` and
continue; medium+ (acceptance criteria, public interfaces, dependencies,
security) → **stop, raise in chat with options, wait**.

## The pre-PR gate

When the stack (or the agreed set of slices) is green:

1. Read `~/.agents/skills/_shared/style.md` immediately before reporting.
   Explain the features delivered and verification results in simple terms.
   Call out deviations and post-red test changes with their importance and
   justification. Save detailed test output and diffstats in an execution appendix to
   `design.md`.
   Reread the style contract before a revised report after further work.
2. **Wait for approval.** The human may request changes first.
3. On approval: record `pre_pr_approved: <date>` in `_state.md`, push, and
   open PRs per the PR style doc and the approved design's PR grouping.
   Multiple implementation slices may share a PR; do not create a PR per
   session or test step. Record the PR URL(s) in `_state.md`, phase →
   `in-review`, log line. Tell the human the topic is ready for `self-review`.
