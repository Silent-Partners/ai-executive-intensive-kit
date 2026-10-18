# The distill prompt (Day 2, 9:25, 10 minutes)

Pasted into Claude Code, from the workspace folder, after the connectors step. Claude reads the interview files, proposes a plan, waits for approval, then writes CLAUDE.md. The 9:35 cut step follows.

Two versions below. Option B is the choice (decided 2026-10-15); Option A is the fallback for anyone running behind the clock. Both end the same way: a CLAUDE.md of 60 lines or fewer, written from the approved plan.

---

## Option A: plan, approve, write

```
Read USER.md, every file in context/ including context/stakeholders/, and lessons.md. Any file or section that still says "Not filled in yet" is empty; ignore it.

Do not write anything yet.

First, show me a plan for my new CLAUDE.md. It has four sections: Who you work for; How my work runs; Rules; Where things are. For each section, list the facts you will put there, one line each, with the file each fact came from in brackets. Keep the whole plan under 40 lines. Put a question mark at the end of any line you are unsure about. Then stop and wait for me.

When I say go, replace CLAUDE.md with the new version, following these rules:
- Those four section headings, in that order, 60 lines or fewer in total.
- My words where you can. Nothing that is not in the files.
- Keep every line of the current Rules section exactly as written, then add rules from the files.
- Name only people who have a file in context/stakeholders/.
- Nothing from context/institutional-knowledge.md unless the plan I approved included it.
- The "Where things are" section tells you which context/ file to read for which kind of task, so this file can stay short.

When you finish, tell me the line count and read me the Rules section out loud.
```

What the executive does with it: read the plan, strike anything wrong, say go. The plan is the approval step; nothing is written until they say so.

Cost: fits ten minutes because Claude asks nothing. If the interview files are thin, the plan is thin, and the 9:35 cut has less to cut. The executive's judgment goes in at the cut.

---

## Option B: three questions, then plan, then write

```
Read USER.md, every file in context/ including context/stakeholders/, and lessons.md. Any file or section that still says "Not filled in yet" is empty; ignore it.

Do not write anything yet.

First, ask me three questions, one at a time, about what you read: the three places where the files disagree with each other, leave a gap, or where a standing instruction would need a fact that is not there. Wait for each answer.

Then show me a plan for my new CLAUDE.md. It has four sections: Who you work for; How my work runs; Rules; Where things are. For each section, list the facts you will put there, one line each, with the file each fact came from in brackets, and mark anything that came from your three questions. Keep the whole plan under 40 lines. Put a question mark at the end of any line you are unsure about. Then stop and wait for me.

When I say go, replace CLAUDE.md with the new version, following these rules:
- Those four section headings, in that order, 60 lines or fewer in total.
- My words where you can. Nothing that is not in the files or in your three answers.
- Keep every line of the current Rules section exactly as written, then add rules from the files.
- Name only people who have a file in context/stakeholders/.
- Nothing from context/institutional-knowledge.md unless the plan I approved included it.
- The "Where things are" section tells you which context/ file to read for which kind of task, so this file can stay short.

When you finish, tell me the line count and read me the Rules section out loud.
```

Cost: a better first draft, because the three gaps get filled before writing. Three answers out loud take four or five of the ten minutes, so the plan and the write are rushed, and a slow answerer runs into the 9:35 cut.

---

## Shared notes

- The section headings in the prompt match the Option A template (templates/CLAUDE.option-A.md). If template Option B is chosen, the headings in the prompt change to Brief, Delegate, Inspect.
- The prompt says "replace CLAUDE.md" because the Day 1 starter is already there. The starter's Rules section carries over whole, by instruction, so the distilled file keeps the privacy rule and the never-send rule the demo file shows.
- "Read me the Rules section out loud" is there so the executive hears the rules before the cut step, where each line meets the question: would removing this cause a mistake?
