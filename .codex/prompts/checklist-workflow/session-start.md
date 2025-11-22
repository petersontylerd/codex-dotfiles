ABOUTME: Start a coding session for an epic.
ABOUTME: Summarize status and propose top tasks.

# `checklist-workflow/session-start`

You are starting a **new coding session** on an existing epic/feature.

Your goals:

- Rehydrate your context.
- Summarize current epic and checklist state.
- Propose the top next tasks for this session.

---

## 1. Rehydrate Context

1. Ask for:
   - The epic’s checklist file path.
   - The current feature branch name.
2. Read the checklist and:
   - Summarize Major Tasks and their statuses.
   - Note any `blocked` items and their reasons.

If anything about branch or checklist state is unclear, ask before proposing work.

---

## 2. Summarize Current Status

Produce a concise summary that includes:

- Epic goal and key success criteria (from the checklist).
- Current branch and any notable commits or PRs (if known).
- A snapshot of:
  - Completed Major Tasks.
  - In-progress and blocked items.

Keep this summary focused but precise.

---

## 3. Propose Top Tasks for This Session

1. Identify 3–5 candidate tasks from the checklist:
   - At least one `[IMPLEMENT]` or `[VALIDATE]` item that will change code/tests.
   - Include any `[PLAN]/[RESEARCH]` items needed to unblock execution.
2. For each candidate, include:
   - Task ID and description.
   - Why it is a good fit for this session (leverage, dependencies).

Ask the user to confirm which tasks to prioritize if there is any doubt.

---

## 4. Daily Kickoff Update

If you have permission to write the checklist file:

1. Update or create a `### Daily Kickoff` section:
   - List the agreed top tasks for this session in order.
   - Include a brief sentence on why each is ordered as it is.
2. Under Notes & Learnings:
   - Add a dated entry summarizing the session’s kickoff plan.

End with a short, explicit list of the next 1–3 tasks you are ready to execute, suitable for feeding into `epic-execute-next-task`.

