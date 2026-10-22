#!/usr/bin/env bash
# Link noggin into ~/.claude so edits here (and `git pull`) take effect everywhere.
set -euo pipefail
src="$(cd "$(dirname "$0")" && pwd)"
dst="$HOME/.claude"
mkdir -p "$dst/agents" "$dst/skills"

link() { # link <source> <target>; backs up a real file instead of clobbering it
  if [ -e "$2" ] && [ ! -L "$2" ]; then mv "$2" "$2.bak.$(date +%s)"; echo "backed up $2"; fi
  ln -sfn "$1" "$2" && echo "linked $2"
}

link "$src/CLAUDE.md" "$dst/CLAUDE.md"
# Per-item links so app-managed entries (e.g. skills/synced) stay untouched.
for f in "$src"/agents/*.md; do [ -e "$f" ] && link "$f" "$dst/agents/$(basename "$f")"; done
for d in "$src"/skills/*/; do [ -d "$d" ] && link "${d%/}" "$dst/skills/$(basename "$d")"; done
true
