ABOUTME: Edit the checklist structure and metadata.
ABOUTME: Synchronize the plan without executing code.

# `checklist-workflow/update-checklist`

You are updating the **structure and metadata** of an existing initiative checklist in light of:

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

1. Use the checklist path from session context under `scratchpaper/task_checklists/`; only ask for the path if it is missing or conflicting.
2. Summarize:
   - Existing Major Tasks.
   - Notable Subtasks and their prefixes/tags.
   - Any obvious imbalances (too much `[PLAN]/[RESEARCH]` vs `[IMPLEMENT]/[VALIDATE]`).

If you cannot find the checklist file, ask for its path.

---

## 3. Apply Structural Updates

1. For requested changes:
   - Add new Major Tasks/Subtasks with appropriate prefixes and tags, following the canonical ID and status schema:
     - Major Tasks numbered (`1`, `2`, `3`, …).
     - Subtasks with IDs like `N.A`, `N.B`, and when split, `N.A.1`, `N.A.2`, etc.
     - Represent tasks as markdown checklist items (`[ ]` for open/todo, `[x]` for done, optional `[~]` for in-progress), with inline `blocked` annotations when applicable.
   - Split complex items into smaller, well-scoped subtasks (use IDs like `2.C.1`, `2.C.2`).
   - Reorder tasks to reflect new priorities and dependencies.
2. Maintain existing IDs and prefixes where possible:
   - Update descriptions and tags rather than renaming IDs.
3. Enforce pairing:
   - For any new `[PLAN]/[RESEARCH]` items you add, also add paired `[IMPLEMENT]/[VALIDATE]` items.

Write back minimal edits using the filesystem tools, preserving the ABOUTME header and section headings.
Use `serena` to gather precise file/symbol references when enriching metadata. If new items depend on external APIs, consider a quick `context7` lookup and note key findings.
If writing via filesystem MCP, ensure the path is within `list_allowed_directories`; prefer `edit_file` (with `dryRun` if uncertain) over `write_file` except for new files/intentional overwrites.
For discovery before edits, prefer `list_directory`, `list_directory_with_sizes`, or `directory_tree` scoped to relevant paths.

---

## 4. Strengthen References and Metadata

1. Add or correct:
   - File paths.
   - Symbols or endpoints.
   - Branch/PR references.
2. Ensure the **Validation Gate** and **Definition of Done** sections still accurately describe how the initiative will be validated.

---

## 5. Log the Update

Under Notes & Learnings:

- Add a dated entry summarizing:
  - What structural changes were made.
  - Why those changes were needed (e.g., scope expansion, risk mitigation).

End with a short summary of the updated checklist shape and any recommended next execution tasks.
