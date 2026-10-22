---
name: dispatch
description: Dispatch sub-agents in the noggin. Read every skill's `schedule:` line, decide which are due, hand them to sub-agents, verify their work, and report. Use when asked to "dispatch" or from a agentic loop.
disable-model-invocation: true
---

# Dispatch (the expediter)

One pass, then stop. Repeat it with `/loop` or a scheduled routine, never by looping yourself.

## 1. Schedule
- Find scheduled skills: `grep -l '^schedule:' .claude/skills/*/SKILL.md ~/.claude/skills/*/SKILL.md`. The `schedule:` line is prose saying *when* the skill should run.
- Read `noggin/log.md` (create it if missing) for what ran recently and what is waiting at the pass.
- Read `noggin/backlog.md` if it exists: tasks Jordan queued by hand.
- Check `git status` and open branches so you don't redo work in flight.

## 2. Write the tickets
For each scheduled skill and backlog item, decide: **due**, **not due**, or **needs Jordan**.
- Due only if its condition is clearly met by evidence you can name (a file, a date, a log entry). When unsure, it is not due.
- At most 3 tickets per service. Skip a ticket already in the log as in progress.

## 3. Dispatch
One sub-agent per ticket (Agent tool). Dispatch a from `agents/engineer.md` or `agents/scientist.md` depending on if it is a `cortex/` or `pons/` task. Each brief states:
- the skill to follow, the objective, the exact inputs,
- what "done" looks like and how to prove it,
- what it must not touch.

Read-only tickets may run in parallel. Tickets that write run in their own worktree (`isolation: "worktree"`), one writer per file or dataset, and end on a branch, never main.

## 4. Verify
Check each result yourself before accepting it: run nf-test or verification in `pons/verify/`, or if a `cortex/` task, find peer-reviewed findings/data to corroborate. A sub-agent's "done" is a claim, not proof.

## 5. Record
Sub-agents propose notes, and you append one entry per ticket to `noggin/log.md`:

```
## <YYYY-MM-DD HH:MM> <skill>: <done | failed | needs Jordan>
- what: <one line>
- proof: <the check you ran and its result>
- where: <branch / file>
```

Then report to Jordan, leading with what needs them.
