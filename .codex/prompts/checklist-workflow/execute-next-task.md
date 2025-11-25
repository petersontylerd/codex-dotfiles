---
description: Execute next task on initiative checklist currently in context
argument-hint: FEATURE_BRANCH=<feature_branch>
---
# `/execute-next-task`

You are in the **Execution Loop** phase of an initiative. Your job is to:

- Begin executing the *Recommended next subtask* immediately.
- If the *Recommended next subtask* is unclear, select the next most appropriate checklist item based on *Recommended next subtask* in prior response or priority/dependency ordering in checklist. Confirm your selection with the user.
- Plan it briefly.
- Execute it using tools and file edits.
- Validate results.
- Update the checklist and notes.

You must **favor concrete action** over mere description whenever environment constraints allow, and you must execute **exactly one checklist subtask per invocation** (do not begin multiple open items simultaneously).

---

## 1. Select and Understand the Next Task

1. Choose the next task according to:
   - First, default to the *Recommended next subtask* provided within the previous response, **or**
   - If prior response did not recommend a next best task, fall back to priority and dependency ordering in the checklist:
     - Prefer the highest-priority open (`[ ]`) item that is not annotated as blocked and that best advances the North Star / Goals.
2. Restate the chosen task in your own words:
   - Include its ID, prefix (e.g., `[IMPLEMENT]`), and its Major Task.
   - If the subtask scope is broad or ambiguous (e.g., “apply docstrings across modules”), first decompose it into concrete sub-subtasks (and sub-sub-subtasks if needed) scoped to specific directories/files/themes with explicit validation commands. Add these to the checklist, keep IDs/prefixes stable, and select the first new child to execute in this invocation. Do not proceed with code changes until this breakdown exists.
3. Verify you are on `$FEATURE_BRANCH` before executing: check the current branch (e.g., `git branch --show-current`). If the branch differs, stop and ask the user to switch before proceeding.
4. Confirm definition of done:
   - Files to touch.
   - Expected behavior.
   - Tests or checks to run.
   - On correct feature branch

Ask for clarification if anything is ambiguous.

---

## 2. Micro-Plan with `sequential-thinking`

1. Use **Sequential Thinking** to draft a 3–7 step micro-plan:
   - Context gathering.
   - Design decisions (if any).
   - Decomposition of any broad subtask into specific sub-subtasks with file/test scope and acceptance criteria (if not already decomposed), and add those decomposed items to the checklist as open tasks.
   - File edits with `serena`/`filesystem`.
   - Tests/validation commands.
   - Checklist/notes updates.
2. sanity-check the plan:
   - Does it respect directory/test constraints?
   - Does it keep scope tight for this one task?

Do not skip this step for non-trivial tasks.
If external APIs or libraries are involved, plan a `context7` lookup and record key findings in Notes & Learnings.

---

## 3. Execute with Tools (Prefer Doing over Saying)

Follow your micro-plan step-by-step:

1. Use `serena` and `filesystem` to inspect and edit relevant files.
2. When changing code or prompts:
   - Make small, focused edits.
   - Respect repo style.
   - Stay within `list_allowed_directories`; for filesystem edits, prefer `edit_file` with `dryRun` before applying; use `write_file` only for new/overwrite cases.
   - For discovery, prefer `list_directory`, `list_directory_with_sizes`, or `directory_tree` scoped to relevant paths.
   - If you decomposed a broad task, update the checklist first with the new sub-subtasks and execute only the selected child subtask in this invocation.
3. When you need to run commands (tests, linters, scripts):
   - Attempt them if allowed by the environment.
   - If blocked by network/permissions/timeout:
     - Stop and produce **“Commands for User to Run”** section in the interactive terminal with:
       - Exact commands.
       - Expected behavior.
     - What logs/output you need back.
     - Mark the task as `blocked` in your narrative and in the checklist update plan.
     - Wait for the user to provide the necessary input. Then, evaluate it, update the checklist, and continue.

Avoid repeatedly explaining “what you would do” when you can actually do it via tools.
Use `context7` before implementing against external APIs to confirm signatures/behaviors; capture the takeaway in your notes.

---

## 4. Validate and Record Outcomes

1. Run targeted validations:
   - Prefer the narrowest reasonable scope first (for example, tests for affected modules or directories).
   - As appropriate, run broader commands such as `uv run pytest` for affected tests/directories and `uv run ruff check` or other relevant checks when you have edited Python code.
2. Capture results:
   - Pass/fail and any notable errors.
   - If validations fail, stop and focus on fixing the failure before moving on.
3. In your response:
   - Summarize what changed (files, key logic).
   - Summarize validation results and confidence level, explicitly calling out which checklist `[VALIDATE]` subtask(s) you satisfied (or why they remain pending).
4. If you ran validations that are part of the initiative’s Validation Gate, update the `Validation Gate` section in the checklist (or plan to do so in the next checklist update) so that it reflects which checks have passed, failed, or are pending.

If you could not run validations, explicitly say so and why.

---

## 5. Update Checklist and Notes

Assuming you have enough information to update the checklist:

1. Modify the checklist file:
   - Mark the executed subtask as `[x]` when appropriate.
   - Add or adjust file paths, tests, and Branch references if they became concrete.
   - If you decomposed a broad task, ensure the new sub-subtasks are added with IDs/prefixes, scoped descriptions, and validation commands; leave unexecuted children open.
   - Update the **Execution Readiness / Implementation Coverage** paragraph if you added or re-linked any `[PLAN]`, `[IMPLEMENT]`, or `[VALIDATE]` tasks so the PLAN→IMPLEMENT→VALIDATE mapping stays accurate.
2. Under **Notes & Learnings**, add a dated entry describing:
   - What you implemented.
   - Any unexpected findings or decisions.
3. If the task remains partially done or blocked:
   - Update its status and note why (e.g., waiting on external command output).
   - Add follow-up subtasks if new work was discovered.

Use `filesystem` to write only the minimal necessary changes to the checklist file.

---

## 6. Propose the Next Task

Re-read the current checklist in its entirety to understand the current state of the checklist. Review all open items, and determine what should be the single *Recommended next subtask*.

End with a concise sentence naming the single *Recommended next subtask* that should follow, along with a short rationale. Derive this strictly from explicit user instructions or, if none exist, the highest-priority unblocked item in the checklist—no special markers or stored notes are required.

Choose a next task that:

- Respects dependencies.
- Keeps momentum toward the initiative’s goals.
- Maintains a balance between planning/research and implementation/validation.
