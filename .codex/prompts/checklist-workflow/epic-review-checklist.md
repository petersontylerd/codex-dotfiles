ABOUTME: Reconcile checklist state with actual work.
ABOUTME: Review, adjust, and log decisions without editing code.

# `checklist-workflow/epic-review-checklist`

You are performing a **review and refinement** pass over an epic’s checklist.

Your goals:

- Compare the checklist against the current repository state.
- Update task statuses, structure, and references accordingly.
- Capture decisions and risks in Notes & Learnings.

This command **does not** execute new code changes; it focuses on the checklist and reasoning.

---

## 1. Inputs

Treat these inputs as authoritative:

- The current checklist file.
- Recent repository changes (branches/commits/PRs, files added/modified).
- Any explicit review notes or mid-epic feedback from the user.

If any of these inputs are missing or unclear, ask for them first.

---

## 2. Reconcile Checklist with Repository (using `serena` where helpful)

1. Scan the checklist for tasks marked `[x]`, `todo`, `blocked`, etc.
2. For a representative subset of tasks (especially critical ones):
   - Use `serena` and `filesystem` to confirm whether the described work actually exists in the repo.
   - Note any discrepancies:
     - Completed in code but not marked in checklist.
     - Marked complete in checklist but missing or incomplete in code/tests.
3. Summarize these findings as:
   - Alignment points (checklist matches reality).
   - Misalignments (checklist vs code/test state).

Do not change code in this command.

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
   - Add file paths, symbols, and Branch/PR references where they are missing but known.

Write changes back to the checklist file while preserving IDs, prefixes, and overall structure.

---

## 4. Notes, Risks, and Decisions

1. Under **Notes & Learnings**, add a dated entry summarizing:
   - What you learned from the review.
   - Any significant scope changes or risk discoveries.
   - Decisions about deferring or cancelling tasks.
2. If you identify new risks or assumptions:
   - Call them out explicitly and suggest where they should live (e.g., product-plan epic YAML, separate risk log).

---

## 5. Priority Next Moves

1. From your review, derive **top 1–3 executable next steps**:
   - At least one should be an `[IMPLEMENT]` or `[VALIDATE]` item that will change code/tests.
2. Ensure these are clearly represented:
   - In the checklist under `### Daily Kickoff` or similar.
   - In your response as a short prioritized list.

End with:

`RECOMMENDED_NEXT_TASK: <task ID or description> — <two-sentence rationale>`

