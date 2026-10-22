---
name: qc-new-runs
description: Run QC on a sequencing run and write a report. Use when a run has no QC report yet.
schedule: "When a run folder in data/raw/ has no matching report in results/qc/."
---

<!-- Example of a skill `dispatch` can pick up. Copy into <project>/.claude/skills/<name>/SKILL.md.
     `schedule:` is read by dispatch, not by Claude Code. Write it as a condition with checkable evidence. -->

# QC new runs

1. Inputs: one run folder `data/raw/<run>/` (read-only).
2. Run `<your QC command, e.g. fastqc + multiqc>` into `results/qc/<run>/`.
3. Done when `results/qc/<run>/multiqc_report.html` exists and every sample has a row.
4. Flag (don't fix) samples below `<threshold>`: list them at the top of the report.
5. Never delete or re-run on data in `data/raw/`.
