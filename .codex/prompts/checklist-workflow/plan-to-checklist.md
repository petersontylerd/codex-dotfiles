---
description: Convert new initiative plan to checklist for a single INITIATIVE_NAME
argument-hint: INITIATIVE_NAME=<initiative_name>
---
# `/plan-to-checklist`

You are given a `new initiative plan` stored on disk. Load it directly from `./scratchpaper/initiatives/$INITIATIVE_NAME/plans/optimized/*.md` (exactly one `.md` is expected in that directory); do not rely on plan details being present in the conversation context. The plan contains essential information and context necessary to create a comprehensive, richly-detailed checklist that will help ensure you successfully research, plan, implement, validate and document this new initiative.

Your job is to **create the canonical checklist** (as a new markdown file) that will serve as working memory for this initiative: a living artifact that links planning, execution, validations, and reasoning. In this command you always create a fresh checklist file; you never update or merge into an existing one.

---

## 1. Choose the Checklist File Path

1. Use the initiative context to write the checklist under `./scratchpaper/initiatives/$INITIATIVE_NAME/checklists/raw/` in the repository. If the directory is missing, create it.
2. Always assume you are creating a new file for this initiative:
   - Propose the filename `<YYYY-MM-DD>-<initiative-or-feature-name>-checklist.md`.
   - Confirm the final path under `./scratchpaper/initiatives/$INITIATIVE_NAME/checklists/raw/`.

Use `filesystem` for all writes and `create_directory` for missing directories as needed. You do **not** merge into an existing checklist in this command; you create a new file.

---

## 2. Map Plan to Major Tasks and Subtasks

Using the `new initiative plan` loaded from `./scratchpaper/initiatives/$INITIATIVE_NAME/plans/optimized/*.md`:

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
   - For each `[PLAN]`/`[RESEARCH]` subtask, explicitly cite the `[IMPLEMENT]` ID(s) that will execute its findings. One `[IMPLEMENT]` may satisfy multiple upstream subtasks, but every research item must name at least one downstream execution subtask.
   - For each `[IMPLEMENT]` subtask, explicitly cite the `[VALIDATE]` ID(s) that prove it succeeded (tests, benchmarks, artifact diffs, etc.). No `[IMPLEMENT]` is allowed without at least one validation step, and each `[VALIDATE]` entry must list every `[IMPLEMENT]` it covers (one-to-many allowed when explicitly enumerated).
   - If the upstream initiative plan omitted `[IMPLEMENT]` or `[VALIDATE]` items, derive them now—translate the research/planning findings into concrete execution tasks and the execution tasks into concrete validation steps. Never carry the omission forward.

Do this mapping explicitly before modifying any files.
If tasks depend on external libraries or APIs, call `context7` to confirm signatures/behaviors and include key findings in Notes & Learnings. Otherwise, you risk using outdated documentation, or making up incorrect signatures/behaviors. That would be a process failure leading to complicated bugs and refactoring, which we must avoid.

---

### Mandatory Major Task 0 — Feature Branch Establishment

Every checklist must begin with **Major Task 0**, dedicated exclusively to standing up a brand-new feature branch for this initiative. This task is blocking—no other Major Tasks may begin until all of its subtasks are complete, and you must explicitly note this blocking status in the checklist.

Major Task 0 must include, at minimum, three subtasks with the following scopes:

1. **Handle existing uncommitted changes** — the agent may run `git status -sb` once to detect whether the working tree is already clean. If it is, note that status in the checklist, check off Subtask `0.A`, and inform the user. If the working tree is not clean, provide the user with copy/paste command sets to resolve the differences via (a) a focused commit, (b) a stash, or (c) a cleanup/reset. Only the user may run those resolution commands; the agent must never execute them.
2. **Create and switch to the new branch from `main`** — instruct the user to checkout `main`, pull with `--ff-only`, create the new feature branch with the agreed slug, and switch to it. Again, list the commands verbatim for the user and reiterate that the agent cannot run them.
3. **Verify the new branch is active and clean** — the agent may run `git status -sb` and `git branch --show-current` to confirm the feature branch is active and clean; record those results in the checklist, mark Subtask `0.C` appropriately, and inform the user. If the checks fail (branch mismatch or dirty tree), provide copy/paste commands so the user can correct them before continuing.

To guarantee consistency, embed the canonical Major Task 0 fenced shell block from `.codex/prompts/checklist-workflow/README.md` (see “Major Task 0 canonical block”). Copy it byte-for-byte, replacing only `<feature-branch-slug>` with the actual branch name you specified elsewhere in the checklist. This ensures every command distinction (agent vs user) stays synchronized across prompts without duplicating definitions here.

---

### Implementation Coverage Verification

After mapping the tasks:

1. Build a mapping table inside your working notes that lists:
   - Each `[PLAN]`/`[RESEARCH]` subtask alongside the `[IMPLEMENT]` IDs that fulfill it.
   - Each `[IMPLEMENT]` subtask alongside the `[VALIDATE]` IDs that prove it (noting whenever a single `[VALIDATE]` covers multiple implementations).
2. If any `[PLAN]`/`[RESEARCH]` lack an `[IMPLEMENT]` entry or any `[IMPLEMENT]` lack a `[VALIDATE]` entry, stop and revise. Do **not** continue until the mapping is complete.
3. Record both the mapping and the aggregate counts for inclusion later in the checklist (e.g., the **Execution Readiness / Implementation Coverage** note or Notes & Learnings) so downstream agents can audit coverage quickly.

---

## 3. Construct the Checklist File

When writing the new checklist file:

1. Ensure the top of the file includes:
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
     - **Feature Development Setup** — The first task on the checklist must always be to create a new feature branch in the repository. Ensure that existing repository modifications are handled delicately, and that we are always assured of beginning our `new initiative plan` on a clean slate. Aside from the explicitly permitted detection checks noted in Major Task 0 (e.g., `git status -sb`, `git branch --show-current`), the agent must not run git commands; instead, provide detailed instructions for the user to review and copy/paste into a separate terminal.
     - **North Star / Goals** — summarize the initiative’s goal and success criteria from the “Initiative Summary” section of the plan you loaded from `./scratchpaper/initiatives/$INITIATIVE_NAME/plans/optimized/*.md` and any explicit success metrics.
     - **Key Principles** — adapt the “Key Principles” section from the loaded plan, reflecting the non-negotiable ground rules and operational philosophy.
     - **Sequential Task Breakdown** — convert the “Proposed Major Tasks & Subtasks” section from the loaded plan into checklist Major Tasks and Subtasks using the canonical IDs, prefixes, and status schema. You must maintain all detail. Summariziation risks creating ambiguity, and will adversely effect downstream activities.
     - **Notes & Learnings** — seed with any important findings or constraints from the loaded plan (for example, key risks or decisions), and add a dated entry describing the creation or update of this checklist.
     - **Validation Gate** — list the concrete commands and checks (tests, lint, type checks, pre-commit) that must pass before the initiative is considered done.
     - **Definition of Done** — describe what it means for this initiative to be complete (behavioral outcomes, documentation, and Validation Gate conditions).
     - **Kickoff Protocol** — briefly describe how a future agent should restart work on this initiative using `session-start` and `execute-next-task`.
     - **Execution & Continuous Refinement** — note how `execute-next-task` and `review-checklist` will be used in a loop to make real changes, run validations, and refine the checklist as reality evolves.
     - **Meta-Reflection and Iteration** — indicate when to perform deeper reviews of the checklist and initiative (for example, after major milestones or meaningful risk changes).
     - **Research→Action pairing** — state how every `[PLAN]/[RESEARCH]` item has linked `[IMPLEMENT]/[VALIDATE]` items within the Sequential Task Breakdown.
     - **Feature Development Finalization** — The final task on the checklist must always define the need to carefully commit our finalized feature additions and merge to main. The agent must not run these git commands themselves. Instead, the agent must provide detailed instructions for the user to review, and commands for the user to copy/paste into a separate terminal.
2. Insert the **Sequential Task Breakdown** section with your Major Tasks and Subtasks.
3. Immediately after the Sequential Task Breakdown, add a short **Execution Readiness / Implementation Coverage** paragraph that summarizes the mapping for each Major Task (e.g., “`1.B` → `1.D` `[IMPLEMENT]` → `1.E` `[VALIDATE]`”, noting any shared validations) and reiterates that code/test changes are required before any documentation-only pass.
Use `filesystem` MCP to write the new .md checklist file to `./scratchpaper/initiatives/$INITIATIVE_NAME/checklists/raw/`. When adding or adjusting file/symbol references, use `serena` to gather accurate paths/names. For discovery, prefer `list_directory`, `list_directory_with_sizes`, or `directory_tree` scoped to relevant paths.

---

## 4. Branch/PR and Product-Plan References

1. Where known, add Branch references to `[IMPLEMENT]` subtasks:
   - `Branch/PR: feat/<slug>` once available.

Do not invent names or IDs.

---

## 5. Validation of Checklist Quality

Before finishing:

1. Check that:
   - Each Major Task carries enough Subtasks to cover PLAN→IMPLEMENT→VALIDATE pairings (typically 5 or more, but allow fewer when the scope is legitimately smaller).
   - There is a balanced mix of `[PLAN]/[RESEARCH]` and `[IMPLEMENT]/[VALIDATE]` across the initiative.
   - Every `[PLAN]`/`[RESEARCH]` subtask explicitly references at least one `[IMPLEMENT]` subtask, and every `[IMPLEMENT]` subtask explicitly references at least one `[VALIDATE]` subtask. Treat any missing reference as a blocker.
   - Any failure of the above bullets is a blocker. Revise the checklist before concluding; never finalize this command while a Major Task lacks `[IMPLEMENT]` coverage, while an `[IMPLEMENT]` lacks `[VALIDATE]`, or while the mappings/counts are missing from the Execution Readiness / Implementation Coverage note.
   - Major Task 0 appears first, includes the mandated subtasks, states that the agent must not run the commands, and contains the canonical `.sh` fence with only the branch slug substituted.
   - The first task properly advises the user on carefully handling any uncommitted changes currently in the repository and creating a new feature branch to ensure a clean slate.
   - The last task properly advises the user on carefully merging the feature branch with the main branch.
2. Under Notes & Learnings, append a dated entry:
   - E.g., `YYYY-MM-DD — Initial checklist created/updated for $INITIATIVE_NAME; see Major Task N for scope.`

Finally, summarize the checklist structure you created and point the user to the file path under `./scratchpaper/initiatives/$INITIATIVE_NAME/checklists/raw/`.
