ABOUTME: README for Codex CLI checklist-workflow prompts.
ABOUTME: Documents problem, scope, and usage patterns.

# Codex CLI Checklist Workflow

## Quickstart (read this first)
- Purpose: durable initiative checklists and commands that bias toward action (edits plus validation).
- Invocation: run prompt files under `.codex/prompts/checklist-workflow/*.md` with your Codex CLI (for example, `codex prompt .codex/prompts/checklist-workflow/create-initiative-plan.md`); adjust to your runner.
- Scratchpads: use `scratchpaper/` (especially `scratchpaper/task_checklists/<YYYY-MM-DD>-<name>-checklist.md`); promote or clean up as you go.
- Follow `AGENTS.md` and `MASTER_AGENTS.md`: feature branches, TDD, `uv`, `ruff`, no bypassed hooks.

### MCP quick use
- `sequential-thinking` - required for non-trivial planning/micro-plans; summarize outputs in Notes & Learnings.
- `serena` - primary navigation/edit tool; spot-check code vs checklist; gather file/symbol references.
- `filesystem` - read/write checklists and list scratchpads; keep edits minimal and preserve ABOUTME.
- `context7` - fetch versioned API docs before using external libraries; note findings in Notes & Learnings.
- Filesystem safety: stay inside `list_allowed_directories`; prefer `edit_file` with `dryRun` for patches; use `write_file` only for new/overwrite cases; use `list_directory`/`list_directory_with_sizes`/`directory_tree` for scoped discovery.

### Minimal flow
1. `create-initiative-plan` - confirm goals and constraints; propose branch.
2. `plan-to-checklist` - turn the plan into the checklist file.
3. `session-start` - summarize state and pick top tasks for the session.
4. `execute-next-task` - pick a checklist item, do the edits, run validations; loop.
5. `review-checklist` - reconcile statuses and notes after meaningful progress.
6. `session-end` - record progress and a clear resume pointer.
7. `scratchpad-review-and-cleanup` - near the end, promote or delete scratch artifacts safely.

### Command variables
- `create-initiative-plan`: `$INITIATIVE_CONTEXT` (goals, principles, constraints) used to infer initiative name and propose branch slug.
- `session-start`: `$CHECKLIST_PATH` (authoritative checklist) and `$FEATURE_BRANCH` (current branch) to rehydrate session context.
All other commands consume the established session context and should not prompt for additional variables unless inputs conflict or are missing.

### Command cheatsheet
- `create-initiative-plan`: Start or reorient an initiative. Outputs goals, constraints, branch suggestion, and initial plan (driven by `$INITIATIVE_CONTEXT`).
- `plan-to-checklist`: Convert the plan into the markdown checklist (major tasks and subtasks). Needs the latest plan from `create-initiative-plan` or user context.
- `update-checklist`: Adjust checklist structure (add, split, retag tasks) without rewriting the file; use this when understanding or scope changes but no new execution is being reconciled.
- `execute-next-task`: Choose the next subtask, perform edits, run targeted validation, and update checklist notes/statuses; one invocation should execute exactly one checklist subtask.
- `review-checklist`: Periodically sync checklist and code/tests; mark blocked/unblocked; capture decisions; use this after meaningful code or test changes to reconcile the checklist with reality.
- `session-start`: Begin a session; recap branch/status; propose top tasks and immediate commands (uses `$CHECKLIST_PATH` and `$FEATURE_BRANCH`).
- `session-end`: Close a session; record progress, blockers, next steps, and suggested commits/commands (do not auto-run git; uses session context).
- `scratchpad-review-and-cleanup`: Catalog scratch files and propose promote/keep/delete actions with safe commands.

### Quick safety and quality reminders
- Use feature branches (`feat/<slug>` and similar), atomic commits, and pre-commit hooks (`uv run pre-commit run --all-files`).
- Tests: unit plus integration plus end-to-end; real data where possible; do not mock what you are testing.
- Commands that could hang must include timeouts or batch flags; surface blocked states explicitly and ask for user commands or output.

## Reference (detailed)

### Problem and goals
- Avoid ad-hoc, forgetful initiative work by keeping checklists as working memory that pairs planning with actual edits and validation.

### Scope
- Covers checklist structure, command prompts, scratchpad lifecycle, and MCP usage (`sequential-thinking`, `serena`, `filesystem`, `context7`).
- Does not replace all `.codex/prompts` or automate CI; commands propose git actions but do not run them.

### Conventions and tooling
- Keep the two-line `ABOUTME` header in all files; names describe current behavior (no "new" or "old").
- Python 3.12 via `uv`; format and lint with `ruff`; type-check with `mypy` if code is added; run `uv run pytest` for tests.
- Follow `.codex/docs/using-python.md`, `.codex/docs/using-tdd.md`, and AGENTS/MASTER_AGENTS for style and collaboration.

### Checklist artifacts
- Location: `scratchpaper/task_checklists/<YYYY-MM-DD>-<project-or-feature-name>-checklist.md`.
- Structure:
  - Title, goals (North Star), principles, sequential task breakdown (major tasks with `[PLAN]/[RESEARCH]/[IMPLEMENT]/[VALIDATE]/[DOC]` subtasks and tags), Notes & Learnings, Validation Gate, Definition of Done, Kickoff Protocol (how to resume work and choose the next task), Execution & Continuous Refinement, Meta-Reflection and Iteration, Research→Action pairing, Feature Development Finalization, and Execution Readiness / Implementation Coverage. Next-task selection relies purely on the ordering, priority, and blocked/unblocked annotations inside the Sequential Task Breakdown—no dedicated field is required.
  - **Major Task 0** (Feature Branch Establishment) must appear first, is blocking, and contains the canonical fenced `.sh` block. Only detection commands (`git status -sb`, `git branch --show-current`) may be run by the agent; all resolution/branch commands are provided for the user to copy/paste in a separate terminal.
  - The **Execution Readiness / Implementation Coverage** section summarizes PLAN→IMPLEMENT→VALIDATE mappings per Major Task (including shared validations) and aggregate counts. Keep it up to date whenever tasks change.
- Link to `.codex/scripts/development/initiative-*` artifacts when relevant; keep checklist and code in sync.

#### Major Task 0 canonical block
Use this block verbatim (only substitute `<feature-branch-slug>`). This is the single source of truth—plan-to-checklist inserts it, and review/update prompts verify against it.

```sh
### Major Task 0: Feature Branch Establishment [Priority: Critical][Phase: Setup][Complexity: Low]
Context: Stand up a dedicated feature branch off `main` before any other work; the user must run every command below in a separate terminal while the agent observes and records outcomes. This task is blocking for the entire checklist.
- [ ] `0.A` [PLAN] Handle existing uncommitted changes. The agent may run the first `git status -sb` locally to check cleanliness:
      git status -sb
      # If the working tree is clean, record that finding in Notes & Learnings and inform the user.
      # If changes exist, instruct the user to choose ONE of the following resolution paths and run all commands in that path (the agent must not run these):
      # Option A — Commit the relevant changes (user runs):
      git add <paths-to-commit>
      git commit -m "WIP: describe changes before branching"
      git status -sb
      # Option B — Stash the changes (user runs):
      git stash push --include-untracked --message "<feature-branch-slug>-pre-branch"
      git status -sb
      # Option C — Clean up/discard the changes (user runs cautiously):
      git restore --staged <paths-to-drop>
      git restore <paths-to-drop>
      git clean -fd -- <directories-to-drop>
      git status -sb
      Require confirmation that the final `git status -sb` output shows a clean tree before proceeding.
- [ ] `0.B` [IMPLEMENT] Create and switch to `Branch/PR: <feature-branch-slug>` from `main`. The user must run:
      git checkout main
      git pull --ff-only
      git checkout -b <feature-branch-slug>
      git status -sb
      Emphasize that the agent is forbidden from running these commands and must rely on the user’s pasted outputs.
- [ ] `0.C` [VALIDATE] Confirm `<feature-branch-slug>` is the active clean branch before other tasks. The user must run:
      git branch --show-current
      git status -sb
      # The agent may also run these commands locally to double-check, then record the results in the checklist and inform the user.
      # If the branch or cleanliness check fails:
      # (User runs)
      git checkout <feature-branch-slug>
      git status -sb
      # (Optionally resolve/stash/clean as in 0.A if the tree is dirty.)
      Block downstream work until both the user and agent confirm the branch is active and the tree remains clean.
```

### Task status and ID schema
- Tasks are represented as markdown checklist items:
  - `[ ]` — open/todo.
  - `[x]` — completed.
  - `[~]` — optional explicit in-progress marker when useful.
- In this workflow, “todo” refers conceptually to any open (`[ ]`) item that is not blocked; you do **not** need to include the literal word `todo` in the text.
- Blocked tasks are encoded via inline annotations on the same line, for example:
  - `(status: blocked — waiting on external command output)` or `(blocked: missing API access)`.
- Major Tasks:
  - Numbered (`1`, `2`, `3`, …) and titled like `**Major Task N — <short verb phrase>** (tags)`.
  - May carry tags such as priority `(P1|P2)` and complexity `(S|M|L)`.
- Subtasks:
  - Identified by IDs such as `N.A`, `N.B`, … and, when split, `N.A.1`, `N.A.2`, etc.
  - Each subtask line uses one prefix to indicate its role:
    - `[PLAN]`, `[RESEARCH]`, `[IMPLEMENT]`, `[VALIDATE]`, or `[DOC]`.
  - Example: `- [ ] Subtask 2.C [IMPLEMENT] — Add exponential backoff ... (P1, M, serena)`.
- Research→action pairing:
  - Every `[PLAN]` or `[RESEARCH]` subtask must explicitly cite at least one `[IMPLEMENT]` subtask ID that will realize it (one `[IMPLEMENT]` may serve multiple upstream items if each link is documented).
  - Every `[IMPLEMENT]` subtask must cite at least one `[VALIDATE]` subtask ID that proves the change (tests, benchmarks, artifact diffs). Each `[VALIDATE]` subtask must list all `[IMPLEMENT]` IDs it covers, so the mapping remains unambiguous.

### Command behaviors (reference)
- Planning commands (`create-initiative-plan`, `plan-to-checklist`, `update-checklist`) - use `sequential-thinking` for structure; `filesystem` to read/write checklists; `context7` when tasks depend on external APIs; `serena` when adding file/symbol references.
- Execution commands (`execute-next-task`, `review-checklist`) - `sequential-thinking` for the micro-plan; `serena` + `filesystem` for edits and verification; `context7` to confirm APIs before implementing; mark blocked states and log findings.
- Session commands (`session-start`, `session-end`) - `filesystem` to read/update the checklist; if choosing tasks that rely on external APIs, optionally check `context7` and log learnings.
- Hygiene command (`scratchpad-review-and-cleanup`) - `filesystem` for discovery; propose commands without executing; use `serena` only if promoting code paths.
- All commands must consult and update the checklist’s **Execution Readiness / Implementation Coverage** note when they add, remove, or relink `[PLAN]`/`[IMPLEMENT]`/`[VALIDATE]` items; treat missing mappings as blockers.

### Command lifecycle and state handoff
- Typical lifecycle for an initiative:
1. **`create-initiative-plan`** — ingest `$INITIATIVE_CONTEXT`, clarify goals/constraints, decompose work using `sequential-thinking`, and emit a structured plan with sections such as Initiative Summary, Key Principles, Constraints, Open Questions and Risks, Proposed Major Tasks & Subtasks (with explicit PLAN→IMPLEMENT→VALIDATE pairings), Branch Plan, Execution Readiness / Implementation Coverage, and Checklist File Plan.
2. **`plan-to-checklist`** — transform the `create-initiative-plan` output into a canonical checklist under `scratchpaper/task_checklists/`, populating sections like North Star / Goals, Key Principles, Sequential Task Breakdown (starting with Major Task 0’s canonical fence), Notes & Learnings, Validation Gate, Definition of Done, Kickoff Protocol, Execution & Continuous Refinement, Meta-Reflection and Iteration, Research→Action pairing, Execution Readiness / Implementation Coverage, Feature Development Finalization, and a neutral note on how to choose the next task directly from the checklist.
  3. **`session-start`** — when resuming work, read the checklist, summarize the current state, and propose the single best next task strictly from (a) explicit user instructions or (b) the highest-priority unblocked checklist item; no separate stored pointer is required.
4. **`execute-next-task`** — consume checklist status plus explicit user instructions to select and execute the single best next task, make real edits via `serena`/`filesystem`, run validations, and update the checklist (including statuses, Validation Gate, and Execution Readiness / Implementation Coverage). When working within Major Task 0, follow the agent-only detection rule for git commands. In the response, briefly state which checklist subtask should follow next, but do not write any special markers into the checklist.
5. **`review-checklist`** — periodically reconcile checklist vs repository state, adjust task structure/status and references, log decisions and risks, and ensure upcoming work is obvious from the prioritized checklist ordering. Refresh the Execution Readiness / Implementation Coverage note and ensure Validation Gate entries reflect actual validation status.
6. **`session-end`** — close out a working session by summarizing what happened, updating the checklist (including Execution Readiness / Implementation Coverage) and Notes & Learnings, and reiterating in the response which checklist subtask should run next (again derived from user direction or the natural ordering in the checklist rather than a stored field).
  7. **`scratchpad-review-and-cleanup`** — near the end of an initiative, review scratch artifacts under `scratchpaper/`, promote valuable content into durable docs or product-plan YAML, and propose safe cleanup commands for anything obsolete.
- Throughout this lifecycle, treat the checklist as the primary working memory: it must stay in sync with real work and validations; letting it drift is considered a process violation.

### MCP usage patterns
- `sequential-thinking`: micro-plans and reasoning before non-trivial work; record learnings.
- `serena`: semantic navigation and edits for `.codex/prompts` and related files.
- `filesystem`: read and update checklist and scratch files within workspace bounds.
- `context7`: fetch external docs when needed; summarize findings in notes and learnings.

### Guardrails and git discipline
- Propose git commands; do not run them. Never bypass hooks.
- Mark blocked items explicitly (network, permissions, timeouts) and provide copy-paste commands plus expected output to proceed.
- Only the detection commands in Major Task 0 (`git status -sb`, `git branch --show-current`) may be run by the agent; all other git operations (commit, stash, cleanup, branch creation/switching) must be provided for the user to run in a separate terminal.
- Scratchpads are ephemeral; promote valuable content to `.codex/scripts` or `docs/` and clean the rest.

### Validation
- Before finishing an initiative: run targeted validations noted in the checklist (tests, lint, type checks), update the validation gate, and ensure tasks reflect reality.
- For prompt or code changes, use `uv run pre-commit run --all-files` and `uv run pytest` where applicable.
