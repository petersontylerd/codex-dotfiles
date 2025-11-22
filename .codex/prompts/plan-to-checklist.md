# `/plan-to-checklist`

You are given:

- An `initiative plan`, which contains essential information and context necessary to create a comprehensive, richly-detailed checklist.

Your job is to **create the canonical checklist** (as a new markdown file) that will serve as working memory for this initiative: a living artifact that links planning, execution, validations, and reasoning. In this command you always create a fresh checklist file; you never update or merge into an existing one.

---

## 1. Choose the Checklist File Path

1. Use session context to determine the intended checklist path under `scratchpaper/task_checklists/`. If missing or ambiguous, confirm with the user before proceeding.
2. Always assume you are creating a new file for this initiative:
   - Propose the filename `<YYYY-MM-DD>–<initiative-or-feature-name>–checklist.md`.
   - Confirm the final path under `scratchpaper/task_checklists/`.

Use `filesystem` for all writes and `create_directory` for missing directories as needed. You do **not** merge into an existing checklist in this command; you create a new file.

---

## 2. Map Plan to Major Tasks and Subtasks

Using the latest initiative plan you are provided:

1. Define **Major Tasks**:
   - Each with a short verb phrase and tags (priority, complexity, main phase).
   - Each with a brief “Context” line explaining downstream impact.
2. Under each Major Task, define **Subtasks**:
   - Use prefixes `[PLAN]`, `[RESEARCH]`, `[IMPLEMENT]`, `[VALIDATE]`, `[DOC]`.
   - Give each subtask a stable ID like `N.A`, `N.B`, and, when split, `N.A.1`, `N.A.2`, etc., where `N` is the Major Task number.
   - Represent subtasks as markdown checklist items (`[ ]` when open, `[x]` when complete; optionally `[~]` when explicitly in progress).
   - When a subtask is temporarily blocked, annotate the line with a short reason (for example, `(status: blocked — waiting on external command output)`); treat these as blocked in review and execution prompts.
   - Include, where possible:
     - Files or directories you expect to touch.
     - Tests to add/update (or note “TBD” if truly unknown).
     - Acceptance criteria in plain language.
3. Enforce **research→action pairing**:
   - For each `[PLAN]`/`[RESEARCH]` subtask, add a paired `[IMPLEMENT]` (and possibly `[VALIDATE]`) subtask.

Do this mapping explicitly before modifying any files.
If tasks depend on external libraries or APIs, call `context7` to confirm signatures/behaviors and include key findings in Notes & Learnings. Otherwise, you risk using outdated documentation, or making up incorrect signatures/behaviors. That would be a process failure leading to complicated bugs and refactoring, which we must avoid.

---

## 3. Construct the Checklist File

When writing the new checklist file:

1. Ensure the top of the file includes:
   - Two ABOUTME lines describing the file’s purpose.
   - A title: `<Project Name> — Comprehensive Task Checklist`.
   - Sections for:
     - Feature Development Setup
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
     - Feature Development Finalization
   - When filling these sections, use the initiative plan as follows, ensuring descriptions are rich in detail:
     - **Feature Development Setup** — The first task on the checklist must always be to create a new feature branch in the repository. Ensure that existing repository modifications are handled delicately, and that we are always assured of beginning our `initiative plan` on a clean slate. The agent must not run these git commands themselves. Instead, the agent must provide detailed instructions for the user to review, and commands for the user to copy/paste into a separate terminal.
     - **North Star / Goals** — summarize the initiative’s goal and success criteria from the “Initiative Summary” section of the `initiative plan` and any explicit success metrics.
     - **Key Principles** — adapt the “Key Principles” section from `initiative plan`, reflecting the non-negotiable ground rules and operational philosophy.
     - **Sequential Task Breakdown** — convert the “Proposed Major Tasks & Subtasks” section from `initiative plan` into checklist Major Tasks and Subtasks using the canonical IDs, prefixes, and status schema. You must maintain all detail. Summariziation risks creating ambiguity, and will adversely effect downstream activities.
     - **Notes & Learnings** — seed with any important findings or constraints from `initiative plan` (for example, key risks or decisions), and add a dated entry describing the creation or update of this checklist.
     - **Validation Gate** — list the concrete commands and checks (tests, lint, type checks, pre-commit) that must pass before the initiative is considered done.
     - **Definition of Done** — describe what it means for this initiative to be complete (behavioral outcomes, documentation, and Validation Gate conditions).
     - **Kickoff Protocol** — briefly describe how a future agent should restart work on this initiative using `session-start` and `execute-next-task`.
     - **Execution & Continuous Refinement** — note how `execute-next-task` and `review-checklist` will be used in a loop to make real changes, run validations, and refine the checklist as reality evolves.
     - **Meta-Reflection and Iteration** — indicate when to perform deeper reviews of the checklist and initiative (for example, after major milestones or meaningful risk changes).
     - **Research→Action pairing** — state how every `[PLAN]/[RESEARCH]` item has linked `[IMPLEMENT]/[VALIDATE]` items within the Sequential Task Breakdown.
     - **Feature Development Finalization** — The final task on the checklist must always define the need to carefully commit our finalized feature additions and merge to main. The agent must not run these git commands themselves. Instead, the agent must provide detailed instructions for the user to review, and commands for the user to copy/paste into a separate terminal.
2. Insert the **Sequential Task Breakdown** section with your Major Tasks and Subtasks.

Use `filesystem` MCP to write the new .md checklist file. When adding or adjusting file/symbol references, use `serena` to gather accurate paths/names. For discovery, prefer `list_directory`, `list_directory_with_sizes`, or `directory_tree` scoped to relevant paths.

---

## 4. Branch/PR and Product-Plan References

1. Where known, add Branch references to `[IMPLEMENT]` subtasks:
   - `Branch/PR: feat/<slug>` once available.

Do not invent names or IDs.

---

## 5. Validation of Checklist Quality

Before finishing:

1. Check that:
   - Each Major Task has at least 5 Subtasks (or more, if needed for full coverage).
   - There is a balanced mix of `[PLAN]/[RESEARCH]` and `[IMPLEMENT]/[VALIDATE]` across the initiative.
   - Every research/planning subtask has an associated execution subtask.
   - The first task properly advises the user on carefully handling any uncommitted changes currently in the repository and creating a new feature branch to ensure a clean slate.
   - The last task properly advises the user on carefully merging the feature branch with the main branch.
2. Under Notes & Learnings, append a dated entry:
   - E.g., `YYYY-MM-DD — Initial checklist created/updated for <initiative-name>; see Major Task N for scope.`

Finally, summarize the checklist structure you created and point the user to the file path.
