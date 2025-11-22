# `/review-checklist`

You are performing a **review and refinement** pass over an initiative’s checklist.

Your goals:

- Compare the checklist against the current repository state.
- Update task statuses, structure, and references accordingly.
- Capture decisions and risks in Notes & Learnings.

This command **does not** execute new code changes; it focuses on the checklist and reasoning, ensuring that our progress is reflected and that our remaining items still align the Major Tasks and Subtasks necessary to accomplish our goals.

---

## 1. Inputs

Treat these inputs as authoritative:

- The current checklist file (use the path from session context; ask only if missing or conflicting).
- Recent repository changes (our working branch, files added/modified).
- Any explicit review notes or mid-initiative feedback from the user.

If any of these inputs are missing or unclear, ask for them first.

---

## 2. Reconcile Checklist with Repository (using `serena` where helpful)

1. Scan the checklist for tasks using the canonical status schema:
   - `[ ]` — open/todo (not blocked).
   - `[x]` — completed.
   - `[~]` — explicitly in-progress (if used).
   - Inline annotations such as `(status: blocked — reason)` or `(blocked: …)` to indicate blocked items.
   - Treat references to `todo` in this workflow as conceptual; you do not need the literal word `todo` if the checkbox and annotations already convey status.
2. For a representative subset of tasks (especially critical ones):
   - Use `serena` and `filesystem` to confirm whether the described work actually exists in the repo. Begin each assessment by assuming the work doesn't actually exist, and prove to yourself that it does.
   - If scope is unclear, check `list_allowed_directories`; use `list_directory`/`directory_tree`/`search_files` for targeted spot-checks.
   - Note any discrepancies:
     - Completed in code but not marked in checklist.
     - Marked complete in checklist but missing or incomplete in code/tests.
   - Focus this subset on high-priority or recently modified tasks and at least one task from each critical Major Task.
3. Summarize these findings as:
   - Alignment points (checklist matches reality).
   - Misalignments (checklist vs code/test state).

Do not change code in this command.
If discrepancies involve external APIs or expected behaviors, optionally use `context7` to verify intended API surface and capture the takeaway in Notes & Learnings.

---

## 3. Update the Checklist Structure and Status

Using your findings:

1. For each affected Major Task/Subtask:
   - Add/reopen/reorder items as needed.
   - Mark tasks `[x]` only when you have high confidence they’re truly done and validated.
2. Guard against overplanning drift:
   - Ensure every `[PLAN]/[RESEARCH]` item has a paired `[IMPLEMENT]/[VALIDATE]` item.
   - Add missing execution items when necessary.
3. Strengthen references:
   - Add file paths, symbols, and Branch references where they are missing but known.
4. New Subtasks to add to the checklist:
   - If you identify any critical Subtasks that should be included on the checklist but are missing, propose the Subtask(s) and specify the related Major Task, Subtask text, and Subtask purpose. Verify your proposal with the user before making any additions.


Write changes back to the checklist file while preserving IDs, prefixes, and overall structure.

---

## 4. Notes, Risks, and Decisions

1. Under **Notes & Learnings**, add a dated entry summarizing:
   - What you learned from the review.
   - Any significant scope changes or risk discoveries.
   - Decisions about deferring or cancelling tasks.
2. If you identify new risks or assumptions, call them out explicitly and suggest remediation(s).

---

## 5. Priority Next Moves

1. From your review, derive **top 1–3 executable next steps**:
   - At least one should be an `[IMPLEMENT]` or `[VALIDATE]` item that will change code/tests.
2. Ensure these are clearly represented:
   - In the checklist by updating or annotating existing Subtasks, or adding new Subtasks under associated existing Major Task.
   - In your response as a short prioritized list.

End with:

`RECOMMENDED_NEXT_TASK: <task ID or description> — <two-sentence rationale>`

Use this command after meaningful code or test changes when you want to reconcile the checklist with reality..
