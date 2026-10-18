# Workspace kit: the files behind the Cincinnati folder

This folder is what the Silent Partners public kit repo holds, file for file. On Day 1 at 2:30 each participant pulls that repo onto their Mac Mini, starts Claude Code in it, and types `/onboarding`, which builds `~/Documents/AI-Executive-Intensive/` from `workspace/`.

Read [../WORKSPACE-KIT.md](../WORKSPACE-KIT.md) first. It explains each file, the options behind it, and what is still provisional.

## Layout, and why

| Path | What it is | Why it sits there |
|---|---|---|
| `CLAUDE.md` | Short instructions for the session the participant starts in this folder: type `/onboarding`, edit nothing here. | A `CLAUDE.md` in the folder Claude Code starts in loads at launch ([memory docs](https://code.claude.com/docs/en/memory.md)), so this is the one file guaranteed to be read first. |
| `.claude/skills/onboarding/` | The onboarding skill (`SKILL.md`) and the script it runs (`build.sh`). | Claude Code finds project skills only at `.claude/skills/<name>/SKILL.md` in the folder it starts in and its parents ([skills docs](https://code.claude.com/docs/en/skills.md)). |
| `workspace/` | Every file the participant's folder starts as, before the interview and Day 2 fill it in. | Kept out of the kit root so its `CLAUDE.md`, `.claude/settings.json`, and `/today` skill do not load into the onboarding session. Files in a subfolder load only when Claude reads them ([memory docs](https://code.claude.com/docs/en/memory.md)). |
| `prompts/` | Text a participant pastes into Claude Code (the distill prompt, the red-team probes). They live in the dashboard blocks, not in the folder. | Reference only. |
| `demo/` | The two `CLAUDE.md` files for the Day 2, 9:15 comparison. They belong to a fictional executive and never go in a participant's folder. | Reference only. |
| `templates/` | The two shapes of the root `CLAUDE.md`. The distill step writes the real one on Day 2. | Reference only. |

`workspace/.claude/agents/` and `workspace/.claude/settings.json` are not copied in by `/onboarding`. A coach adds them with a participant during Day 2 build time, when that participant's build needs them.

Nothing in `USER.md`, `context/`, `lessons.md`, or `outputs/` ever leaves the participant's machine.
