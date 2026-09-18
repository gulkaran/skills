---
name: design
description: Turn a chosen approach into an approved implementation contract - feasibility proven, acceptance criteria set, PR stack planned. Formal human approval gate; writes design.md and stamps the approval. Use after investigate, or directly on a well-specified small task.
disable-model-invocation: true
---

# Design

Turn the chosen approach into an implementation contract the human formally
approves: what will be built, how we'll know it works, and in what PR-sized
slices. Execution refuses to start without this approval.

Read first: `~/.agents/skills/_shared/config.md`,
`~/.agents/skills/_shared/topic.md`, `~/.agents/skills/_shared/style.md`.
No production code changes — the only code written here is a throwaway spike.

## Process

### 1. Resolve the topic

Follow the topic protocol. Expect phase `designing` with `research.md`
present. If there's no research (a small, well-specified task), say so and ask
whether to proceed directly — the human's call, recorded in the log.

### 2. Prove feasibility

Identify the **riskiest assumption** of the chosen approach — the thing that,
if false, invalidates the design. Prove or disprove it with the cheapest
possible spike (a scratch script, an API call, a 20-line prototype). The spike
is **throwaway**: discard the code, keep the evidence in the design's
appendix. If nothing is genuinely risky, say so explicitly — don't perform
feasibility theatre. If the assumption is disproven, stop and return to the
approach conversation.

### 3. Draft the design

- **Behavior contract:** acceptance criteria per slice — observable behavior,
  not implementation steps. These later become the tests execute writes first.
- **PR stack:** tracer-bullet vertical slices in dependency order, each
  demoable alone and sized for one focused session. Note which slices are
  mechanical enough to delegate to faster models.
- **Test plan:** core behaviors to cover — major coverage of the concepts that
  matter, explicitly not exhaustive micro-testing.
- **Deliberate deviations:** anything knowingly outside standard practice,
  called out here and appended to `decisions.md` so review phases have the
  context.
- No file-by-file pseudo-code walkthroughs; the contract is behavior and
  slicing, not an implementation transcript.

### 4. The gate

Present the full design in chat (style contract): feasibility evidence,
acceptance criteria, the stack, trade-offs. Iterate until the human says
**"approved"** — explicitly. Denied or redirected means revise or return to
investigate; never proceed on silence.

### 5. Record

On approval:

- Write `design.md` (design + feasibility evidence appendix).
- Update `_state.md`: `design_approved: <date>`, phase → `design-approved`,
  branch name if agreed; log line.
- If the human wants the stack on the tracker, publish it via the `to-tickets`
  skill (it reads the same tracker recipes) rather than reimplementing.
- Tell the human the topic is ready for `execute`.
