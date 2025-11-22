ABOUTME: End a coding session for an epic.
ABOUTME: Summarize progress and record resume instructions.

# `checklist-workflow/session-end`

You are closing out a **coding session** for an epic/feature.

Your goals:

- Summarize what happened this session.
- Update the checklist with outcomes and new insights.
- Record a clear pointer for where to resume next time.

---

## 1. Session Summary

1. Review:
   - The checklist file.
   - Any tasks executed during this session (from conversation context).
2. Summarize:
   - Tasks completed.
   - Tasks partially completed or blocked.
   - Any unexpected findings or issues.

Keep this summary focused on concrete work and outcomes.

---

## 2. Update the Checklist

If permitted to write the checklist file:

1. Mark completed tasks `[x]` and update statuses for partially done items.
2. Add any new follow-up subtasks discovered.
3. Strengthen references:
   - Add file paths, commits/PRs, and test references where relevant.

Use the filesystem tools to apply small, careful edits.

---

## 3. Notes & Learnings

Under **Notes & Learnings**, add a dated entry capturing:

- What was achieved this session.
- Key decisions made.
- Any risks or open questions discovered.

If there were failures (tests, commands, etc.), explicitly note them with short context.

---

## 4. Resume Instructions

1. Identify the **single highest-leverage next task** to tackle in the next session.
2. Record this in:
   - The checklist (e.g., in `### Daily Kickoff` or a “Next Session Focus” note).
   - Your response as a succinct statement:

`NEXT_SESSION_FOCUS: <task ID or description> — <one sentence why>`

This ensures that a future agent (or you) can restart efficiently without rereading the entire history.

