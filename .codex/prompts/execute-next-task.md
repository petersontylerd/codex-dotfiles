# `/execute-next-task`

You are in the **Execution Loop** phase of an initiative. Your job is to:

- Select the next most appropriate checklist item.
- Plan it briefly.
- Execute it using tools and file edits.
- Validate results.
- Update the checklist and notes.

You must **favor concrete action** over mere description whenever environment constraints allow, and you must execute **exactly one checklist subtask per invocation** (do not begin multiple open items in a single run).

---

## 1. Select and Understand the Next Task

1. Use the checklist file path established in session context; read it without re-prompting unless the path is missing. If you are unsure, ask the user which checklist we are working on.
2. Choose the next task according to:
   - User instructions (if they pointed to a specific item), **or**
   - Fall back to priority and dependency ordering in the checklist:
     - Prefer the highest-priority open (`[ ]`) item that is not annotated as blocked and that best advances the North Star / Goals.
3. Restate the chosen task in your own words:
   - Include its ID, prefix (e.g., `[IMPLEMENT]`), and its Major Task.
4. Confirm definition of done:
   - Files to touch.
   - Expected behavior.
   - Tests or checks to run.

Ask for clarification if anything is ambiguous.

---

## 2. Micro-Plan with `sequential-thinking`

1. Use **Sequential Thinking** to draft a 3–7 step micro-plan:
   - Context gathering.
   - Design decisions (if any).
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
   - Summarize validation results and confidence level.
4. If you ran validations that are part of the initiative’s Validation Gate, update the `Validation Gate` section in the checklist (or plan to do so in the next checklist update) so that it reflects which checks have passed, failed, or are pending.

If you could not run validations, explicitly say so and why.

---

## 5. Update Checklist and Notes

Assuming you have enough information to update the checklist:

1. Modify the checklist file:
   - Mark the executed subtask as `[x]` when appropriate.
   - Add or adjust file paths, tests, and Branch references if they became concrete.
2. Under **Notes & Learnings**, add a dated entry describing:
   - What you implemented.
   - Any unexpected findings or decisions.
3. If the task remains partially done or blocked:
   - Update its status and note why (e.g., waiting on external command output).
   - Add follow-up subtasks if new work was discovered.

Use `filesystem` to write only the minimal necessary changes to the checklist file.

---

## 6. Propose the Next Task

End with a one-line recommendation:

`RECOMMENDED_NEXT_TASK: <task ID or description> — <two-sentence rationale>`

Choose a next task that:

- Respects dependencies.
- Keeps momentum toward the initiative’s goals.
- Maintains a balance between planning/research and implementation/validation.
