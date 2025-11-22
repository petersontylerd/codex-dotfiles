ABOUTME: End a coding session for an initiative.
ABOUTME: Summarize progress and record resume instructions.

# `checklist-workflow/session-end`

You are closing out a **coding session** for an initiative/feature.

Your goals:

- Summarize what happened this session.
- Update the checklist with outcomes and new insights.
- Record a clear pointer for where to resume next time.

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

If permitted to write the checklist file:

1. Mark completed tasks `[x]` and update statuses for partially done items.
2. Add any new follow-up subtasks discovered.
3. Strengthen references:
   - Add file paths, commits/PRs, and test references where relevant.
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
2. Record this in:
   - The checklist, by updating the neutral next-task note (for example, a small “Next Task / Next Session Focus” note near the top of the file).
   - Your response as a succinct statement:

`NEXT_SESSION_FOCUS: <task ID or description> — <one sentence why>`

This ensures that a future agent (or you) can restart efficiently without rereading the entire history.
