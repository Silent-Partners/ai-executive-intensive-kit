---
name: today
description: My morning brief. Reads context/cadence.md and today's calendar, then tells me what matters today in under 150 words. Run it by typing /today.
---

# /today

When I run this, do the following, in order.

1. Read `context/cadence.md` and the Rules section of `CLAUDE.md`. If `lessons.md` has a rule that applies to the brief, follow it.

2. Get today's calendar.
   - If a calendar connector is available, pull today's events and the first event tomorrow.
   - If no calendar connector answers, say so in one line ("No calendar connected; this brief is from your cadence alone.") and go on. Do not guess at events. If I paste my calendar in reply, redo the brief with it.

3. Write the brief in this shape, under 150 words:

   **Today, <weekday, date>.**
   **Top three:** the three things that matter most today, each one line, from the calendar and from what cadence.md says about this day of the week.
   **Calendar:** how many events, the one that matters most, and any prep cadence.md says it needs. With no connector: the recurring meetings cadence.md lists for this weekday.
   **Watch:** one thing cadence.md warns about for today (energy, a meeting I stopped questioning, a protected block).
   **Ask:** one question for me, only if something is unclear. Otherwise leave this line out.

4. Do not send, schedule, move, or delete anything. Do not read email unless I ask. Do not repeat anything from `USER.md` or `context/` beyond what the brief needs.
