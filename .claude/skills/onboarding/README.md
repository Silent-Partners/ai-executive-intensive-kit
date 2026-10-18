# The onboarding skill

The skill the Day 1, 2:30 block runs to build each participant's workspace folder. A **skill** is a saved set of instructions Claude Code runs when you type its name; it lives in a folder holding a file called `SKILL.md`.

What it does, in order: builds `~/Documents/AI-Executive-Intensive/` from the kit's `workspace/` folder (`CLAUDE.md`, `lessons.md`, the five `context/` stubs, `context/stakeholders/`, an empty `context/writing-samples/`, `projects/`, `outputs/`, and `.claude/skills/today/SKILL.md`), opens the folder in Finder, asks the participant for the five lines of `USER.md` and writes the file, and prints a checklist. The writing samples come in later, at interview section 6. The tree is specified in [../../../../WORKSPACE-KIT.md](../../../../WORKSPACE-KIT.md), section 1.

It does not create `.claude/agents/` or `.claude/settings.json` (builders add those on Day 2), never overwrites a file that is already there, and never reads the participant's files. Everything stays on the Mac Mini.

## Files

| File | What it is |
|---|---|
| `SKILL.md` | The skill: what Claude says, what it runs, and the five USER.md questions. Its `allowed-tools` line is the documented way to run `build.sh` without a permission prompt ([skills docs](https://code.claude.com/docs/en/skills.md)). Not confirmed: in a headless test on Windows (2026-10-18) the prompt still appeared. The Day 1 copy tells participants to choose Yes either way. |
| `build.sh` | The build itself. Copies the `workspace/` files as they are, opens Finder, prints `USER_MD: present` or `missing` and the checklist. Safe to run twice. `--check` prints the status and checklist only. |

The script finds the kit by its own location (three folders up), so this folder has to stay at `.claude/skills/onboarding/` inside the kit. A copy placed anywhere else must set `KIT_ROOT` to the kit's path before running it.

## How it is invoked

1. The 2:30 block clones the Silent Partners public kit repo into `~/Documents/silent-partners-kit` and starts Claude Code there.
2. The participant types `/onboarding`. Claude Code finds it because it sits at `.claude/skills/onboarding/` in the folder it was started in.
3. About three minutes later the folder is open in Finder, `USER.md` is written, and the checklist is on screen.

If the slash command does not appear, the participant can type this instead, from the kit folder, and get the same result: `Read .claude/skills/onboarding/SKILL.md and do what it says.`

## Testing it without a Mac Mini

Point `HOME` at an empty folder and run `build.sh`. Every file it creates is a byte-for-byte copy of its `workspace/` file, and it prints `USER_MD: missing`. Run it again to see `TREE: 0 file(s) created`. The Finder step only runs on a Mac.

## Open questions

1. `projects/_template/CLAUDE.md` is copied in. Section 1's tree does not show it. Keep it, or hand the briefing template out at 11:30 on Day 2.
2. `.claude/skills/today/SKILL.md` is in place from Day 1. Does the Day 2, 9:40 "first skill" step still write it, as the agenda says, or read and run the copy already there?
