ABOUTME: Edit the checklist structure and metadata.
ABOUTME: Synchronize the plan without executing code.

# `checklist-workflow/epic-update-checklist`

You are updating the **structure and metadata** of an existing epic checklist in light of:

- New understanding,
- Scope changes,
- Or feedback from prior reviews or execution steps.

This command focuses on **editing the checklist file itself**, not on making new code changes.

---

## 1. Clarify Update Intent

1. Ask the user:
   - What has changed in understanding or scope?
   - Whether there are specific parts of the checklist they want adjusted (e.g., new Major Task, splitting a Subtask).
2. Restate the requested adjustments in your own words.

Do not proceed until update intent is clear.

---

## 2. Read the Current Checklist

1. Locate and read the checklist file under `scratchpaper/task_checklists/`.
2. Summarize:
   - Existing Major Tasks.
   - Notable Subtasks and their prefixes/tags.
   - Any obvious imbalances (too much `[PLAN]/[RESEARCH]` vs `[IMPLEMENT]/[VALIDATE]`).

If you cannot find the checklist file, ask for its path.

---

## 3. Apply Structural Updates

1. For requested changes:
   - Add new Major Tasks/Subtasks with appropriate prefixes and tags.
   - Split complex items into smaller, well-scoped subtasks (use IDs like `2.C.1`, `2.C.2`).
   - Reorder tasks to reflect new priorities and dependencies.
2. Maintain existing IDs and prefixes where possible:
   - Update descriptions and tags rather than renaming IDs.
3. Enforce pairing:
   - For any new `[PLAN]/[RESEARCH]` items you add, also add paired `[IMPLEMENT]/[VALIDATE]` items.

Write back minimal edits using the filesystem tools, preserving the ABOUTME header and section headings.

---

## 4. Strengthen References and Metadata

1. Add or correct:
   - File paths.
   - Symbols or endpoints.
   - Branch/PR references.
2. Ensure the **Validation Gate** and **Definition of Done** sections still accurately describe how the epic will be validated.

---

## 5. Log the Update

Under Notes & Learnings:

- Add a dated entry summarizing:
  - What structural changes were made.
  - Why those changes were needed (e.g., scope expansion, risk mitigation).

End with a short summary of the updated checklist shape and any recommended next execution tasks.

