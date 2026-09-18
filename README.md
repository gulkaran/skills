# skills

A human-in-the-loop agentic engineering workflow: fuzzy idea → project plan →
research → design → TDD execution → review, with every artifact saved to an
Obsidian vault and every judgment call made by the human. Automate legwork,
gate judgment.

This repo mimics `~/.agents/skills` — install by symlinking (below).

## The loop

```
fuzzy idea ─ wayfinder ─→ spec ─ to-spec/to-tickets ─→ tracker issues (blocking edges)
issue ─→ investigate ─ 🧑 approach ─→ design ─ 🧑 approve ─→ execute (TDD) ─ 🧑 pre-PR
      ─→ PR ─→ self-review ─ 🧑 ─→ review-fix ─→ threads resolved, trail on the PR
artifacts: <vault>/<project>/topics/<slug>/{_state, research, design, decisions, review}.md
```

Human gates: **approach choice** (investigate), **design approval** (design),
**pre-PR approval** (execute), **fix-plan approval** (review-fix).

## Layout

| Path | What |
|---|---|
| `_shared/config.md` | vault path + active tracker — the one place to change either |
| `_shared/style.md` | communication contract: tiered findings, compress prose not detail |
| `_shared/topic.md` | topic folder, `_state.md` phases, decisions log, drift policy |
| `_shared/pr.md` | PR title/description style |
| `_shared/trackers/` | per-tracker operation recipes (github, linear) |
| `investigate` `design` `execute` `self-review` `review-fix` | authored pipeline skills |
| `wayfinder` + deps, `to-spec`, `to-tickets` | vendored planning layer — see [VENDORED.md](VENDORED.md) |

## Install (per machine)

```sh
./install.sh   # symlinks each top-level entry into ~/.agents/skills
```

If the vault lives elsewhere on this machine, create
`_shared/config.local.md` (gitignored) overriding `vault_path`.

## First run

Work through [SHAKEDOWN.md](SHAKEDOWN.md) with one real topic end to end, and
fix friction in the skill docs as you hit it.
