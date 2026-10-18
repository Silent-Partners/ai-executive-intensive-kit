---
name: onboarding
description: Builds the AI Executive Intensive workspace folder on this Mac (~/Documents/AI-Executive-Intensive/) and writes the participant's five-line USER.md with them. Run on Day 1 at 2:30 by typing /onboarding. Also use when the participant asks to set up, build, or rebuild their workspace folder.
allowed-tools:
  - Bash(${CLAUDE_SKILL_DIR}/build.sh)
  - Bash(${CLAUDE_SKILL_DIR}/build.sh *)
  - Bash("${CLAUDE_SKILL_DIR}/build.sh")
  - Bash("${CLAUDE_SKILL_DIR}/build.sh" *)
---

# /onboarding

You are sitting with an executive on Day 1 of the AI Executive Intensive, at their Mac Mini. This skill builds their workspace folder, `~/Documents/AI-Executive-Intensive/`, and writes the five lines of their `USER.md` with them. It takes about three minutes. The interview at 3:30 fills the folder in; this skill only builds it.

The build itself is a script, `build.sh`, in the same folder as this file. It copies the starter files from the kit's `workspace/` folder, so every file lands exactly as the kit has it. Run the script; do not rebuild the folder by hand, and do not change what the script writes.

## Rules

- **Everything stays on this Mac.** Never email, upload, paste, or sync anything from the workspace. Never send anything anywhere.
- **Do not read the participant's files.** Do not open, quote, summarize, or describe the contents of any file in the workspace. File names are fine to show; contents are not. The interview reads them later, with the participant.
- **Never overwrite or delete.** The script skips any file that already exists and deletes nothing. Write `USER.md` only if the script printed `USER_MD: missing`.
- **Do not create `.claude/agents/` or `.claude/settings.json`.** Builders add those on Day 2. The script does not create them; neither do you.
- **Writing samples are not part of this step.** They come in at interview section 6. If the participant asks, say so.
- Plain words. The participant is an executive, not a developer. Say "folder" and "file", not "directory" and "path". Do not explain the script.

## Steps

### 1. Say what is about to happen

Say, in your own words but no longer than this:

> I am going to build your workspace folder in Documents, called AI-Executive-Intensive, and then we will write five short lines about you. Nothing leaves this Mac. If Claude Code asks for permission, choose Yes.

### 2. Run the script

Run exactly this, once, as written (no `bash` in front, no `cd` first):

```bash
${CLAUDE_SKILL_DIR}/build.sh
```

It creates the tree, opens the folder in Finder (the Mac's file browser), and prints status lines and a checklist.

| Line | Meaning |
|---|---|
| `TREE: N file(s) created, M already there` | The folder is built. M is above zero only on a second run. |
| `USER_MD: missing` | No `USER.md` yet. Go to step 3. |
| `USER_MD: present` | A real `USER.md` is already there, from an earlier run. Skip step 3. |

If the script stops with `KIT: not found`, the kit folder is incomplete or this skill was copied out of it. Tell the participant to wave a coach over; do not try to build the folder another way.

### 3. Write USER.md together

Only when the script printed `USER_MD: missing`. Say:

> Now five short lines about you. This is the first thing your AI will know about you, and the interview at 3:30 checks it.

Then ask for these, one at a time, waiting for each answer:

1. Your name.
2. Your role.
3. Your company.
4. This year's three priorities.
5. Three working preferences: how you like to work.

Then write `~/Documents/AI-Executive-Intensive/USER.md` from the answers, in exactly this shape:

```
# USER.md

Who Claude works for. Written at Day 1 setup, checked in interview section 1.

Name: <answer 1>
Role: <answer 2>
Company: <answer 3>
This year's three priorities: 1. <...> 2. <...> 3. <...>
Three working preferences: 1. <...> 2. <...> 3. <...>

Private. This file stays on this machine.
```

Use the participant's words as given. Do not polish them. Then print the checklist again:

```bash
${CLAUDE_SKILL_DIR}/build.sh --check
```

### 4. Show the checklist

Paste the checklist the script printed into your reply, unchanged. It lists each file and folder with `ok` or `MISSING`.

If anything shows `MISSING`, say which line, and tell the participant to wave a coach over. Do not try to repair it by writing files yourself.

### 5. Close

End with one line:

> Your workspace is built. The interview at 3:30 starts filling it in.

Then stop. Do not open the interview, do not read any file aloud, and do not suggest next steps.
