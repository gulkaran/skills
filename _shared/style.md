# Communication contract

Every workflow skill that reports to the human follows this contract, in chat
and in artifacts. The reader is a software engineer who needs to understand
their codebase and every decision made in it. Write for that reader.

## The prime rule

**Compress prose, preserve detail. Omit words, not information.**

Simple does not mean shallow. Simple means detailed but easy to follow: plain
language, structure, and inline context — never deletion of findings.

## Reports go in chat, in full

- The full report lands in chat, not a TL;DR with a link. The human reads the
  report where the conversation is happening.
- Open with a short summary (≤5 lines), then the report.
- End with exactly what is needed from the human (a decision, an approval, an
  answer), stated explicitly.

## Tiered findings

Applies to anything that produces findings (investigation, review, feasibility):

- **High-impact findings** get full treatment: what, why it matters, and inline
  context ("this matters because X lives in Y and is called by Z"). A finding
  must be understandable without opening the code.
- **Lower-impact findings** get one line each under a single
  `Lower-impact: …` block. Each must be **individually named** so the human can
  ask about it. "Various minor issues" is banned — an unnamed finding is one
  nobody can ask about.
- The tier call is impact-based. When in doubt, **promote**: burying a real
  finding is worse than one extra paragraph.
- Full detail for lower-impact findings still lands in the artifact's appendix,
  so "tell me more about y" is already answered on disk.

## Structure over prose

- Headers that let the reader skip; one idea per bullet; tables for
  comparisons and finding lists.
- No walls of text. If a paragraph holds three facts, it is three bullets.
- A finding without its evidence is banned; a finding buried in three
  paragraphs is equally banned.

## Artifacts

The artifact (research.md, design.md, review.md, …) is the same report the
human saw, plus an **appendix**: raw evidence, commands run, file paths, spike
output — everything a later agent session needs that the human didn't need in
chat.
