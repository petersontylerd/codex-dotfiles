ABOUTME: Turn an initiative plan into a checklist file.
ABOUTME: Create or update the canonical Markdown checklist.

# `checklist-workflow/plan-to-checklist`

You are given:

- An initiative/feature plan (often produced by `start`), and
- Either:
  - An existing checklist file under `scratchpaper/task_checklists/`, or
  - Enough information to create a new one.

Your job is to **create or update the canonical checklist** that will serve as working memory for this initiative.

---

## 1. Identify or Create the Checklist File

1. Use session context to determine the intended checklist under `scratchpaper/task_checklists/` (reuse the path if already established). If missing or ambiguous, confirm with the user before proceeding.
2. If the file exists:
   - Read it via filesystem tools.
   - Summarize its current structure and status.
3. If it does not exist:
   - Propose the filename `<YYYY-MM-DD>–<initiative-or-feature-name>–checklist.md`.
   - Plan to create it with the standard ABOUTME header and sections.

Ask if you are unsure about reusing vs creating a checklist.
Use `filesystem` for all reads/writes. Confirm the path is within `list_allowed_directories`; create missing directories with `create_directory` if needed.

---

## 2. Map Plan to Major Tasks and Subtasks

Using the latest initiative plan (from `start` or user context):

1. Define **Major Tasks**:
   - Each with a short verb phrase and tags (priority, complexity, main phase).
   - Each with a brief “Context” line explaining downstream impact.
2. Under each Major Task, define **Subtasks**:
   - Use prefixes `[PLAN]`, `[RESEARCH]`, `[IMPLEMENT]`, `[VALIDATE]`, `[DOC]`.
   - Include, where possible:
     - Files or directories you expect to touch.
     - Tests to add/update (or note “TBD” if truly unknown).
     - Acceptance criteria in plain language.
3. Enforce **research→action pairing**:
   - For each `[PLAN]`/`[RESEARCH]` subtask, add a paired `[IMPLEMENT]` (and possibly `[VALIDATE]`) subtask.

Do this mapping explicitly before modifying any files.
If tasks depend on external libraries or APIs, call `context7` to confirm signatures/behaviors and include key findings in Notes & Learnings.

---

## 3. Construct or Update the Checklist File

When writing to the checklist file:

1. Ensure the top of the file includes:
   - Two ABOUTME lines describing the file’s purpose.
   - A title: `<Project Name> — Comprehensive Task Checklist`.
   - A `### Daily Kickoff` placeholder.
   - Sections for:
     - North Star / Goals
     - Key Principles
     - Sequential Task Breakdown
     - Notes & Learnings
     - Validation Gate
     - Definition of Done
     - Kickoff Protocol
     - Execution & Continuous Refinement
     - Meta-Reflection and Iteration
     - Research→Action pairing
2. Insert or update the **Sequential Task Breakdown** section with your Major Tasks and Subtasks.
3. If the checklist already exists:
   - Merge rather than overwrite:
     - Preserve existing IDs and prefixes where possible.
     - Update descriptions and tags to reflect the new plan.
     - Keep Notes & Learnings and Validation Gate entries intact.

Use `filesystem` MCP to read and write, and be surgical in edits.
Prefer `edit_file` (use `dryRun` if uncertain) for patch-style updates; use `write_file` only when creating a new file or intentionally overwriting.
When adding or adjusting file/symbol references, use `serena` to gather accurate paths/names.
For discovery, prefer `list_directory`, `list_directory_with_sizes`, or `directory_tree` scoped to relevant paths.

---

## 4. Branch/PR and Product-Plan References

1. Where known, add Branch/PR references to `[IMPLEMENT]` subtasks:
   - `Branch/PR: feat/<slug>` or a specific PR ID once available.
2. If this initiative corresponds to a `.codex/scripts` product-plan initiative:
   - Add a note near the top referencing the initiative ID and the YAML path.

Do not invent IDs; ask the user if initiative IDs or PR links are missing but important.

---

## 5. Validation of Checklist Quality

Before finishing:

1. Check that:
   - Each Major Task has at least 5 Subtasks (or more, if needed for full coverage).
   - There is a balanced mix of `[PLAN]/[RESEARCH]` and `[IMPLEMENT]/[VALIDATE]` across the initiative.
   - Every research/planning subtask has an associated execution subtask.
2. Under Notes & Learnings, append a dated entry:
   - E.g., `YYYY-MM-DD — Initial checklist created/updated for <initiative-name>; see Major Task N for scope.`

Finally, summarize the checklist structure you created and point the user to the file path.
