ABOUTME: README for Codex CLI checklist-workflow prompts.
ABOUTME: Documents problem, scope, and usage patterns.

# Codex CLI Checklist Workflow

## Quickstart (read this first)
- Purpose: durable initiative checklists and commands that bias toward action (edits plus validation).
- Invocation: run prompt files under `.codex/prompts/checklist-workflow/*.md` with your Codex CLI (for example, `codex prompt .codex/prompts/checklist-workflow/start.md`); adjust to your runner.
- Scratchpads: use `scratchpaper/` (especially `scratchpaper/task_checklists/<YYYY-MM-DD>-<name>-checklist.md`); promote or clean up as you go.
- Follow `AGENTS.md` and `MASTER_AGENTS.md`: feature branches, TDD, `uv`, `ruff`, no bypassed hooks.

### MCP quick use
- `sequential-thinking` - required for non-trivial planning/micro-plans; summarize outputs in Notes & Learnings.
- `serena` - primary navigation/edit tool; spot-check code vs checklist; gather file/symbol references.
- `filesystem` - read/write checklists and list scratchpads; keep edits minimal and preserve ABOUTME.
- `context7` - fetch versioned API docs before using external libraries; note findings in Notes & Learnings.
- Filesystem safety: stay inside `list_allowed_directories`; prefer `edit_file` with `dryRun` for patches; use `write_file` only for new/overwrite cases; use `list_directory`/`list_directory_with_sizes`/`directory_tree` for scoped discovery.

### Minimal flow
1. `start` - confirm goals and constraints; propose branch.
2. `plan-to-checklist` - turn the plan into the checklist file.
3. `session-start` - summarize state and pick top tasks for the session.
4. `execute-next-task` - pick a checklist item, do the edits, run validations; loop.
5. `review-checklist` - reconcile statuses and notes after meaningful progress.
6. `session-end` - record progress and a clear resume pointer.
7. `scratchpad-review-and-cleanup` - near the end, promote or delete scratch artifacts safely.

### Command variables
- `start`: `$INITIATIVE_CONTEXT` (goals, principles, constraints) used to infer initiative name and propose branch slug.
- `session-start`: `$CHECKLIST_PATH` (authoritative checklist) and `$FEATURE_BRANCH` (current branch) to rehydrate session context.
All other commands consume the established session context and should not prompt for additional variables unless inputs conflict or are missing.

### Command cheatsheet
- `start`: Start or reorient an initiative. Outputs goals, constraints, branch suggestion, and initial plan (driven by `$INITIATIVE_CONTEXT`).
- `plan-to-checklist`: Convert the plan into the markdown checklist (major tasks and subtasks). Needs the latest plan from `start` or user context.
- `update-checklist`: Adjust checklist structure (add, split, retag tasks) without rewriting the file.
- `execute-next-task`: Choose the next subtask, perform edits, run targeted validation, and update checklist notes/statuses.
- `review-checklist`: Periodically sync checklist and code/tests; mark blocked/unblocked; capture decisions.
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
- Structure: title, goals (North Star), principles, sequential task breakdown (major tasks with `[PLAN]/[RESEARCH]/[IMPLEMENT]/[VALIDATE]/[DOC]` subtasks and tags), notes and learnings, validation gate, definition of done, kickoff protocol (how to resume work and choose the next task), execution & continuous refinement, meta-reflection and iteration, research→action pairing, and a neutral “next task / next session focus” note (no daily- or time-based semantics).
- Link to `.codex/scripts/development/initiative-*` artifacts when relevant; keep checklist and code in sync.

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
  - Every `[PLAN]` or `[RESEARCH]` subtask must have at least one corresponding `[IMPLEMENT]` subtask (and usually a `[VALIDATE]` subtask) in the same Major Task.
  - Execution subtasks should, where appropriate, reference the research IDs they rely on (for example, “Exec for 3.B [RESEARCH]”).

### Planning signals and next-task pointers
- Two primary planning signals flow between commands and the checklist:
  - `RECOMMENDED_NEXT_TASK: <task ID or description> — <rationale>` — a line emitted by commands such as `execute-next-task` and `review-checklist` to suggest the single best next task based on current context.
  - `NEXT_SESSION_FOCUS: <task ID or description> — <rationale>` — a line emitted by `session-end` to record the single highest-leverage next task to tackle when work resumes.
- The checklist should contain a neutral note (for example, a short “Next Session Focus” or “Next Task” note) that records the current `NEXT_SESSION_FOCUS`; avoid daily- or time-based section names.
- Command roles with respect to these signals:
  - `execute-next-task`:
    - Consumes the checklist and existing planning signals to choose the next most appropriate checklist item.
    - Emits `RECOMMENDED_NEXT_TASK` in its response to suggest what should follow the work it just performed.
  - `review-checklist`:
    - May update or refine `RECOMMENDED_NEXT_TASK` based on a reconciliation of checklist vs repository state.
  - `session-end`:
    - Records the last task completed and sets `NEXT_SESSION_FOCUS` (both in the checklist and as output) to point to the single best next task.
  - `session-start`:
    - Reads the checklist, including any previous `RECOMMENDED_NEXT_TASK` / `NEXT_SESSION_FOCUS` information, plus task statuses and dependencies, to discern and propose the single best next task to execute next (without relying on any daily or time-bound framing).

### Command behaviors (reference)
- Planning commands (`start`, `plan-to-checklist`, `update-checklist`) - use `sequential-thinking` for structure; `filesystem` to read/write checklists; `context7` when tasks depend on external APIs; `serena` when adding file/symbol references.
- Execution commands (`execute-next-task`, `review-checklist`) - `sequential-thinking` for the micro-plan; `serena` + `filesystem` for edits and verification; `context7` to confirm APIs before implementing; mark blocked states and log findings.
- Session commands (`session-start`, `session-end`) - `filesystem` to read/update the checklist; if choosing tasks that rely on external APIs, optionally check `context7` and log learnings.
- Hygiene command (`scratchpad-review-and-cleanup`) - `filesystem` for discovery; propose commands without executing; use `serena` only if promoting code paths.

### Command lifecycle and state handoff
- Typical lifecycle for an initiative:
  1. **`start`** — ingest `$INITIATIVE_CONTEXT`, clarify goals/constraints, decompose work using `sequential-thinking`, and emit a structured plan with sections such as Initiative Summary, Key Principles, Constraints, Open Questions and Risks, Proposed Major Tasks & Subtasks, Branch Plan, and Checklist File Plan.
  2. **`plan-to-checklist`** — transform the `start` output into a canonical checklist under `scratchpaper/task_checklists/`, populating sections like North Star / Goals, Key Principles, Sequential Task Breakdown, Notes & Learnings, Validation Gate, Definition of Done, Kickoff Protocol, Execution & Continuous Refinement, Meta-Reflection and Iteration, Research→Action pairing, and the neutral next-task / `NEXT_SESSION_FOCUS` note.
  3. **`session-start`** — when resuming work, read the checklist and any existing `RECOMMENDED_NEXT_TASK` / `NEXT_SESSION_FOCUS` signals, summarize the current state, and propose the single best next task.
  4. **`execute-next-task`** — consume planning signals and checklist status to select and execute the single best next task, make real edits via `serena`/`filesystem`, run validations, update the checklist (including statuses and Validation Gate), and emit a new `RECOMMENDED_NEXT_TASK`.
  5. **`review-checklist`** — periodically reconcile checklist vs repository state, adjust task structure/status and references, log decisions and risks, and refine upcoming work (including the next-task note and `RECOMMENDED_NEXT_TASK`).
  6. **`session-end`** — close out a working session by summarizing what happened, updating the checklist and Notes & Learnings, and setting `NEXT_SESSION_FOCUS` both in the checklist and as output so the next `session-start` can rehydrate quickly.
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
- Scratchpads are ephemeral; promote valuable content to `.codex/scripts` or `docs/` and clean the rest.

### Validation
- Before finishing an initiative: run targeted validations noted in the checklist (tests, lint, type checks), update the validation gate, and ensure tasks reflect reality.
- For prompt or code changes, use `uv run pre-commit run --all-files` and `uv run pytest` where applicable.
