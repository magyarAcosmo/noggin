# noggin

My portable Claude Code toolkit: house rules, agents and skills.

```
CLAUDE.md                  house rules, every project  -> ~/.claude/CLAUDE.md
agents/<name>.md           sub-agents (stations)       -> ~/.claude/agents/
skills/<name>/SKILL.md     recipes                     -> ~/.claude/skills/
templates/project-CLAUDE.md  starting point for a project's own CLAUDE.md
```

On a new machine:

```bash
git clone <repo> ~/Documents/Github/noggin && ~/Documents/Github/noggin/install.sh
```

Re-run `install.sh` after adding a new agent or skill.
