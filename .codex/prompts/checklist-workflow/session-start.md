ABOUTME: Start a coding session for an initiative.
ABOUTME: Summarize status and propose top tasks.

# `checklist-workflow/session-start`

You are starting a **new coding session** on an existing initiative/feature.

Your goals:

- Rehydrate your context.
- Summarize current initiative and checklist state.
- Discern and propose the single best next task (and optionally a small set of backup candidates).

---

## 1. Rehydrate Context

Inputs for this command:
- `$CHECKLIST_PATH` — authoritative checklist file for this initiative.
- `$FEATURE_BRANCH` — current working branch.

1. Read the checklist at `$CHECKLIST_PATH` and:
   - Summarize Major Tasks and their statuses.
   - Note any `blocked` items and their reasons.
2. Validate that `$FEATURE_BRANCH` matches any referenced branch context; if conflicting signals appear, ask before proceeding.

If anything about branch or checklist state is unclear (or inputs conflict), ask before proposing work.
Use `filesystem` to read/update the checklist. If upcoming tasks depend on external APIs, plan a `context7` lookup and capture findings in Notes & Learnings.
Ensure checklist paths are within `list_allowed_directories`; use `edit_file` (with `dryRun` if uncertain) for updates.

---

## 2. Summarize Current Status

Produce a concise summary that includes:

- Initiative goal and key success criteria (from the checklist).
- Current branch and any notable commits or PRs (if known).
- A snapshot of:
  - Completed Major Tasks.
  - In-progress and blocked items.

Keep this summary focused but precise.

---

## 3. Discern the Single Best Next Task

1. Identify 3–5 candidate tasks from the checklist:
   - At least one `[IMPLEMENT]` or `[VALIDATE]` item that will change code/tests.
   - Include any `[PLAN]/[RESEARCH]` items needed to unblock execution.
2. For each candidate, include:
   - Task ID and description.
   - Why it is a good fit (leverage, dependencies, alignment with goals).
3. Using the candidates and existing planning signals, choose the single best next task:
   - Prefer, in order:
     - Any explicit user instructions.
     - The most recent `NEXT_SESSION_FOCUS` recorded in the checklist.
     - The latest `RECOMMENDED_NEXT_TASK` from prior commands (if present).
     - Otherwise, the highest-priority unblocked task that best advances the North Star / Goals.
4. Clearly label this choice in your response as:

`RECOMMENDED_NEXT_TASK: <task ID or description> — <two-sentence rationale>`

Ask the user to confirm or adjust this recommendation if there is any doubt.

---

## 4. Update Next-Task Note in Checklist

If you have permission to write the checklist file:

1. Update the neutral next-task note in the checklist (for example, a small “Next Task / Next Session Focus” note near the top):
   - Set it to the chosen single best next task and a brief rationale.
   - If you are overriding a previous `NEXT_SESSION_FOCUS`, note that and why.
2. Under Notes & Learnings:
   - Add a dated entry summarizing how you selected this next task and any tradeoffs or risks you considered.

End with a short, explicit statement of the single next task you are ready to execute, suitable for feeding into `execute-next-task`.
