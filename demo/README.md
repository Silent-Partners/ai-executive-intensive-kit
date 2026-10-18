# The 9:15 comparison: 300 lines against 45

Two CLAUDE.md files for the same fictional executive, Jamie Reyes, COO of Cobalt Harbor Logistics. Nothing in them is real.

The task, run once on each file, in a fresh Claude Code session started in a folder holding only that file as CLAUDE.md:

```
A customer just asked for a 45-minute call this Thursday at 2:00. Draft my two-line reply.
```

Both files contain the rule that decides the answer: Thursday afternoons are site visits, decline and offer Friday morning. In the 45-line file (39 lines as written; the agenda calls it the 45-line file) it is the sixth rule. In the 300-line file it is line 195 of 300, and the file says three times that Thursday is "usually open" (lines 51, 147, 251) and twice to "be flexible about customer calls" (lines 37, 200).

What the room should see: the 45-line file declines and offers Friday. The 300-line file hedges, accepts, or asks a question. The line that matters has to be findable, and nothing else in the file can argue with it.

Setup for the facilitator: two folders on the demo machine, `demo-300/` and `demo-45/`, each with its file saved as `CLAUDE.md`. Open two Terminal windows side by side, start `claude` in each, paste the task in both. Rehearse once: the 45-line file points at `context/cadence.md`, which does not exist in the demo folder, and Claude should carry on from the Rules when it finds nothing there.
