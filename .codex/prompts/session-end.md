# `/session-end`

You are closing out a **coding session** for an initiative/feature.

Your goals:

- Summarize what happened this session.
- Update the checklist with outcomes and new insights.
- Record a clear pointer for where to resume next time.

Do not begin new tasks in this command; focus on documenting what happened and setting up the next session.

---

## 1. Session Summary

1. Review:
   - The checklist file (path from session context; only ask if missing).
   - Any tasks executed during this session (from conversation context).
2. Summarize:
   - Tasks completed.
   - Tasks partially completed or blocked.
   - Any unexpected findings or issues.

Keep this summary focused on concrete work and outcomes.

---

## 2. Update the Checklist

1. Mark completed tasks `[x]` and update statuses for partially done items.
2. - If you identify any critical Subtasks that should be included on the checklist but are missing, propose the Subtask(s) and specify the related Major Task, Subtask text, and Subtask purpose. Verify your proposal with the user before making any additions.
3. Strengthen references:
   - Add file paths, commits, and test references where relevant.
   - Keep branch references aligned with the session’s active branch; do not re-prompt unless context conflicts.

Use the filesystem tools to apply small, careful edits.
If new follow-ups rely on external APIs, optionally use `context7` to confirm details and note them in Notes & Learnings.
Keep checklist edits within `list_allowed_directories`; prefer `edit_file` (with `dryRun` if uncertain) for updates.
For discovery of checklist location or related scratch files, use `list_directory`/`list_directory_with_sizes`/`directory_tree` scoped to allowed paths.

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
2. Record this in the checklist by adding a clear, neutral next-task note under the unchecked subtask item you believe should be the restart point.

This ensures that a future agent (or you) can restart efficiently without rereading the entire history.
