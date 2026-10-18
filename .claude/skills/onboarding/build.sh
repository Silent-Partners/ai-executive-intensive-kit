#!/bin/bash
# Builds ~/Documents/AI-Executive-Intensive/ from the kit's workspace/ folder.
# Safe to run more than once: it never overwrites a file that is already
# there, and it never deletes anything.
#
#   build.sh          build the folder, open Finder, print the checklist
#   build.sh --check  print the checklist only
#
# Everything stays on this Mac. The script reads no file's contents; the one
# comparison it makes (is USER.md still the blank template?) is byte for byte.

set -eu

WS="$HOME/Documents/AI-Executive-Intensive"
# This script sits at <kit>/.claude/skills/onboarding/build.sh.
KIT="${KIT_ROOT:-$(cd -P "$(dirname "$0")/../../.." && pwd)}"
SRC="$KIT/workspace"

# The files the workspace starts with, copied from workspace/ as they are.
# Not in this list, on purpose: workspace/.claude/agents/ and
# workspace/.claude/settings.json (builders add those on Day 2). USER.md is
# written with the participant by the skill; the blank copy in workspace/ is
# only used to recognise an untouched one.
FILES="
CLAUDE.md
lessons.md
context/cadence.md
context/decision-criteria.md
context/institutional-knowledge.md
context/pain-points.md
context/style-guide.md
context/stakeholders/README.md
context/writing-samples/README.md
outputs/README.md
projects/_template/CLAUDE.md
.claude/skills/today/SKILL.md
"

DIRS="
context
context/stakeholders
context/writing-samples
projects
outputs
.claude/skills/today
"

checklist() {
  echo
  echo "Your workspace: $WS"
  echo
  mark() { if [ -e "$WS/$1" ]; then printf '  ok       %s\n' "$2"; else printf '  MISSING  %s\n' "$2"; fi; }
  mark CLAUDE.md  "CLAUDE.md                     standing instructions, the Day 1 starter"
  mark USER.md    "USER.md                       who Claude works for"
  mark lessons.md "lessons.md                    corrections, one rule each"
  mark context    "context/                      how your work runs, filled by this afternoon's interview"
  for f in cadence.md decision-criteria.md pain-points.md style-guide.md institutional-knowledge.md; do
    mark "context/$f" "  context/$f"
  done
  mark context/stakeholders     "  context/stakeholders/       one file per person, from interview section 3"
  mark context/writing-samples  "  context/writing-samples/    three pieces you sent, added in interview section 6"
  mark projects   "projects/                     one folder per build, from Day 2"
  mark projects/_template/CLAUDE.md "  projects/_template/CLAUDE.md  the shape of a build briefing, used on Day 2"
  mark outputs    "outputs/                      finished work"
  mark .claude/skills/today/SKILL.md "  .claude/skills/today/SKILL.md   the /today brief, run on Day 2"
  echo
}

user_status() {
  if [ -e "$WS/USER.md" ] && ! cmp -s "$WS/USER.md" "$SRC/USER.md"; then
    echo "USER_MD: present"
  else
    echo "USER_MD: missing"
  fi
}

if [ "${1:-}" = "--check" ]; then
  user_status
  checklist
  exit 0
fi

# 1. Make sure the kit is where we expect it, with every file we copy.
if [ ! -f "$SRC/CLAUDE.md" ] || [ ! -f "$SRC/USER.md" ]; then
  echo "KIT: not found at $KIT (expected workspace/ three levels above this script)."
  exit 1
fi
for f in $FILES; do
  if [ ! -f "$SRC/$f" ]; then
    echo "KIT: not found: $SRC/$f (the kit is incomplete; nothing was changed)."
    exit 1
  fi
done
echo "KIT: $KIT"

# 2. Create the tree. Never overwrite.
mkdir -p "$WS"
for d in $DIRS; do mkdir -p "$WS/$d"; done
created=0
kept=0
for f in $FILES; do
  if [ -e "$WS/$f" ]; then
    kept=$((kept + 1))
  else
    mkdir -p "$(dirname "$WS/$f")"
    cp "$SRC/$f" "$WS/$f"
    created=$((created + 1))
  fi
done
echo "TREE: $created file(s) created, $kept already there and left alone."

# 3. Is there a real USER.md yet? The skill writes it with the participant if not.
user_status

# 4. Open the folder in Finder, if this is a Mac.
if [ "$(uname)" = "Darwin" ]; then
  open "$WS" || true
fi

checklist
