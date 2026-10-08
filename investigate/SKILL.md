---
name: investigate
description: Interactive research phase for an idea or issue. Explores the codebase and relevant sources, reports tiered findings with credible approach options, and ends with the human choosing the approach. Writes research.md to the topic folder. Use when starting work on an idea or picking up an issue that isn't yet fully specified.
disable-model-invocation: true
---

# Investigate

Turn an idea or issue into understood territory and a **human-chosen
approach**. This phase is interactive: the human asks questions, redirects,
and makes the approach call. Automate the legwork, never the judgment.

Read first: `~/.agents/skills/_shared/config.md`,
`~/.agents/skills/_shared/topic.md`.
No production code changes in this phase.

## Process

### 1. Resolve the topic

Follow the topic protocol: resolve or create the topic folder, write the
`.topic` marker, set phase `investigating`, log the session. If the input is a
tracker issue, fetch its full body and comments via the tracker recipes and
link it in `_state.md`.

### 2. Frame

Restate the idea in one or two lines: what we're trying to achieve and what
"done" would mean. If the goal itself is ambiguous, ask now — a short,
specific question, not a questionnaire.

### 3. Explore

Investigate the codebase and any relevant docs/sources until you can explain
where this work lives, what it touches, and what constrains it.

- **Stay single-agent by default.** Fan out subagents only when there are
  genuinely independent questions worth delegating (e.g. "how does system A
  handle X" and "what does library B support" have no bearing on each other).
  Delegated legwork can run on faster models; synthesis stays here.
- Ground every claim in the working tree, not memory or a search index.

### 4. Synthesize findings

Identify the main findings, their practical impact, and how they affect the
approach. Preserve constraints, risks, prior art, and supporting evidence for
the artifact; distinguish decision-relevant findings from minor details.

### 5. Approaches

Present **credible alternatives when they exist** — with honest trade-offs
and a recommendation. **Never manufacture options**: if there is one obvious
way to do it, say exactly that and why, and present just it.

### 6. Report and converse

Read `~/.agents/skills/_shared/style.md` now, immediately before reporting.
Explain the main findings, intended features, and recommended approach in
simple terms, with a concrete example where useful. Then converse: answer
questions, dig deeper where asked, revise findings. Reread the style contract
before a revised report after further investigation. **The human picks the
approach.** Do not proceed on a recommendation alone.

### 7. Record

On the human's choice:

- Write `research.md`: the human-facing explanation, complete findings and
  approach reasoning, the chosen approach, plus an appendix (evidence, paths,
  commands run).
- Append the approach choice to `decisions.md` (decision + why).
- Update `_state.md`: phase → `designing`, log line.
- Tell the human the topic is ready for `design`.
