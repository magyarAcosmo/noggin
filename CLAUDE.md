# noggin

Open-source agentic framework for bioinformatics. Skills are the only extension point, LLM-powered dispatch--the noggin works in harmonized synapses!

## Cortex
The `cortex/` directory is an Obsidian vault--persistent memory across sessions for science (what is true) 
- **Read first.** Read cortex files relevant to the scientific topic before reasoning tasks.
- **Write** after incongruencies, discoveries, or notable hypotheses.
- **Structure:** One topic per file. Directories with `[[wikilink]]` indexes — no inlined content.
- **Maintain:** Scientific knowledge aggregates in `cortex/knowledge/`. Tag notes as hypotheses, supported, or refuted with primary literature DOIs.

## Pons
The `pons/` directory is an Obsidian vault--persistent memory across sessions for how to code (how to do it) 
- **Read first.** Read pons files relevant to coding tasks.
- **Docker:** Use `Skill(docker)` to access internal Docker images for consistent versioning.
- **Write** after mistakes, corrections, or notable codebase learnings.
- **Structure:** One topic per file. Directories with `[[wikilink]]` indexes — no inlined content.
- **Maintain:** Delete outdated notes. Clean completed/abandoned plans from `pons/plans/`.

## Workflow
- **User ordering:** Follow bullet/numbered list order. Don't reorder silently.
- **Isolation:** Multiple sessions run concurrently — use `Skill(dispatch)`, `Skill(worktree)`, and `Skill(commit)`.
- **Specialities:** `agents/scientist.md` has access to the `cortex/`, while `agents/engineer.md` has access to `pons/`.

## Coding
- For bioinformatic pipeline work, use Nextflow following nf-core standards.
- Python recommended for miscellaneous code.

## Verification
- For cortex tasks, compare reasoning to objective data and peer-reviewed findings to support hypotheses.
- For pons tasks, use nf-testing or similar verification in `pons/verify/`to ensure that a test input replicates deterministic output after changes made. Explain errors that are insurmountable.
