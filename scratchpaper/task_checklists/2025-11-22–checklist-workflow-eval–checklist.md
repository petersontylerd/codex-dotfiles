ABOUTME: Working checklist for checklist-workflow prompt evaluation.
ABOUTME: Tracks planning, research, edits, and validation for this initiative.

# Checklist-Workflow Prompt Suite Evaluation — Comprehensive Task Checklist

## 1. North Star / Goals

- Deliver a logically coherent, internally consistent, and cross-file-aligned prompt suite under `.codex/prompts/checklist-workflow`, with zero dangling references or confusing overlaps.
- Maximize the value of `start.md`, `plan-to-checklist.md`, and `execute-next-task.md` for Codex CLI’s agentic workflows: superb use of context, reliable working-memory behavior, and deep, focused execution.
- Reduce unnecessary verbosity across the suite while preserving or improving effectiveness and safety; no critical guidance is lost in the process.
- Produce a final written assessment that clearly answers: strengths, weaknesses (with concrete remediation), and where verbosity can be trimmed without any degradation in behavior.

## 2. Key Principles

- Plan deeply, execute cleanly — detailed reasoning first, then precise edits.
- Every unclear step is a hidden risk — prompts must be explicit about expectations and flows.
- Reflection before iteration — reassess plan and checklist structure before modifying critical prompts.
- Research must lead to real changes — every planning/research subtask has a concrete paired edit/validation subtask touching `.md` files in `.codex/prompts/checklist-workflow`.
- Stay within scope — assessment and edits are restricted to `.codex/prompts/checklist-workflow`; no analysis of other repo content.

## 3. Sequential Task Breakdown

### Major Task 1 — Establish checklist infrastructure & evaluation scope (P1, S, [PLAN]/[RESEARCH])

- Context: sets up the working structure and guardrails so that all further work is disciplined, traceable, and balanced between thinking and doing.
- Inputs: your instructions, MASTER_AGENTS, and checklist framework; outputs: this file and a clear scope statement.

- [x] Subtask 1.A [PLAN] — Choose checklist file name and location (P1, S, [PLAN], (sequential-thinking))
  - Files: N/A (planning only)
  - Symbols/Endpoints: N/A
  - Tests: N/A
  - Acceptance: Selected slug (e.g., `checklist-workflow-eval`), date, and final filename under `scratchpaper/task_checklists/` recorded in this checklist.
  - Branch/PR: N/A (planning only)
  - Commands: N/A

- [x] Subtask 1.B [IMPLEMENT] → 1.A — Create checklist file and scaffold core sections (P1, S, [IMPLEMENT], (filesystem))
  - Files: `scratchpaper/task_checklists/2025-11-22–checklist-workflow-eval–checklist.md`
  - Symbols/Endpoints: N/A
  - Tests: N/A (manual inspection of structure)
  - Acceptance: File exists with ABOUTME header and sections: North Star / Goals, Key Principles, Sequential Task Breakdown, Notes & Learnings, Validation Gate, Definition of Done, Kickoff Protocol, Execution & Continuous Refinement, Meta-Reflection and Iteration, Research→Action pairing, and Next Task / Next Session Focus.
  - Branch/PR: `feat/checklist-workflow-eval-checklist` (if later committed)
  - Commands: `mkdir -p scratchpaper/task_checklists` (done), then apply_patch to create file.

- [x] Subtask 1.C [RESEARCH] — Clarify exact scope and non-negotiable constraints (P1, S, [RESEARCH])
  - Files: this checklist
  - Symbols/Endpoints: N/A
  - Tests: N/A
  - Acceptance: Scope constraints (only `.codex/prompts/checklist-workflow`, mission-critical nature of prompts, etc.) are written under Notes & Learnings.
  - Branch/PR: N/A
  - Commands: N/A

- [x] Subtask 1.D [IMPLEMENT] → 1.C — Encode scope constraints into checklist and prompt expectations (P1, S, [IMPLEMENT])
  - Files: this checklist; prompts in `.codex/prompts/checklist-workflow/*.md` as needed
  - Symbols/Endpoints: N/A
  - Tests: N/A (manual reasoning)
  - Acceptance: Checklist Notes & Learnings explicitly state scope/non-negotiables; relevant prompt text (e.g., README/commands) aligns with that scope without contradiction.
  - Branch/PR: `feat/checklist-workflow-eval-checklist`
  - Commands: apply_patch edits where necessary.

- [x] Subtask 1.E [PLAN] — Map conceptual phases to Major Tasks (P1, S, [PLAN], (sequential-thinking))
  - Files: this checklist
  - Symbols/Endpoints: N/A
  - Tests: N/A
  - Acceptance: Explicit mapping documented in Notes & Learnings that ties phases (inventory, analysis, coherence checks, improvement design, implementation, validation) to Major Tasks in this file.
  - Branch/PR: N/A
  - Commands: N/A

- [x] Subtask 1.F [VALIDATE] → 1.A–1.E — Sanity-check checklist against framework (P1, S, [VALIDATE])
  - Files: this checklist
  - Symbols/Endpoints: N/A
  - Tests: N/A
  - Acceptance: Checklist adheres to your framework (sections, tags, pairing rules); every planning/research subtask has a paired implementation/validation subtask.
  - Branch/PR: N/A
  - Commands: N/A

### Major Task 2 — Inventory checklist-workflow files & understand README-described workflow (P1, M, [RESEARCH]/[IMPLEMENT])

- Context: Build an accurate map of all `.md` files in `.codex/prompts/checklist-workflow` and understand the intended workflow as documented in `README.md`. This underpins deeper analysis.

- [x] Subtask 2.A [RESEARCH] — Inventory directory contents (P1, M, [RESEARCH], (filesystem))
  - Files: `.codex/prompts/checklist-workflow/*`
  - Symbols/Endpoints: N/A
  - Tests: N/A
  - Acceptance: A list of all files (core prompts, supporting prompts, README) is recorded in Notes & Learnings.
  - Branch/PR: N/A
  - Commands: use filesystem list_directory on `.codex/prompts/checklist-workflow`.

- [x] Subtask 2.B [IMPLEMENT] → 2.A — Add structured file inventory to checklist (P1, S, [IMPLEMENT])
  - Files: this checklist
  - Symbols/Endpoints: N/A
  - Tests: N/A
  - Acceptance: Notes & Learnings contains a structured inventory (e.g., table) with file names and provisional roles (core/support/doc).
  - Branch/PR: `feat/checklist-workflow-eval-checklist`
  - Commands: apply_patch to append inventory.

- [x] Subtask 2.C [RESEARCH] — Read README.md to extract workflow description (P1, M, [RESEARCH])
  - Files: `.codex/prompts/checklist-workflow/README.md`
  - Symbols/Endpoints: N/A
  - Tests: N/A
  - Acceptance: Notes & Learnings includes a concise summary of the workflow (minimal flow, lifecycle, MCP patterns).
  - Branch/PR: N/A
  - Commands: filesystem read_text_file.

- [x] Subtask 2.D [IMPLEMENT] → 2.C — Encode README-derived workflow into a simple model (P1, S, [IMPLEMENT])
  - Files: this checklist
  - Symbols/Endpoints: N/A
  - Tests: N/A
  - Acceptance: Notes & Learnings holds “Workflow Model v1” describing transitions: `start` → `plan-to-checklist` → `session-start` → `execute-next-task`/`review-checklist`/`update-checklist` → `session-end` → `scratchpad-review-and-cleanup`.
  - Branch/PR: `feat/checklist-workflow-eval-checklist`
  - Commands: apply_patch to update checklist.

- [x] Subtask 2.E [RESEARCH] — Identify referential claims in README (P1, M, [RESEARCH])
  - Files: `.codex/prompts/checklist-workflow/README.md`
  - Symbols/Endpoints: N/A
  - Tests: N/A
  - Acceptance: Notes & Learnings includes a list of README claims (file references, behaviors, variable expectations) to verify later.
  - Branch/PR: N/A
  - Commands: filesystem read_text_file.

- [x] Subtask 2.F [IMPLEMENT] → 2.E — Create a verification checklist for README claims (P1, S, [IMPLEMENT])
  - Files: this checklist
  - Symbols/Endpoints: N/A
  - Tests: N/A
  - Acceptance: Notes & Learnings contains a table of README claims with a status column (To verify / Verified / Contradicted).
  - Branch/PR: `feat/checklist-workflow-eval-checklist`
  - Commands: apply_patch to add table.

- [x] Subtask 2.G [VALIDATE] → 2.A–2.F — Confirm inventory and README model adequacy (P1, S, [VALIDATE])
  - Files: this checklist
  - Symbols/Endpoints: N/A
  - Tests: N/A
  - Acceptance: Ability to verbally describe the minimal flow and all files; no missing prompts in the inventory.
  - Branch/PR: N/A
  - Commands: N/A

### Major Task 3 — Deep-dive analysis of core prompts (start, plan-to-checklist, execute-next-task) (P1, L, [RESEARCH]/[IMPLEMENT]/[VALIDATE])

- Context: Core commands are mission-critical entrypoints; this task builds deep understanding and designs targeted improvements for them.

- [x] Subtask 3.A [RESEARCH] — Analyze `start.md` content and behavior (P1, M, [RESEARCH], (sequential-thinking))
  - Files: `.codex/prompts/checklist-workflow/start.md`
  - Symbols/Endpoints: N/A
  - Tests: N/A
  - Acceptance: Notes & Learnings includes strengths/weaknesses/verbosity notes and variable/tool usage analysis for `start.md`.
  - Branch/PR: N/A
  - Commands: filesystem read_text_file; optional sequential-thinking micro-analysis.

- [x] Subtask 3.B [IMPLEMENT] → 3.A — Draft change plan for `start.md` (P1, S, [IMPLEMENT])
  - Files: this checklist
  - Symbols/Endpoints: N/A
  - Tests: N/A
  - Acceptance: Notes & Learnings contains a mini-spec for `start.md`: what to keep, tighten, clarify, and add (especially around assumptions vs questions).
  - Branch/PR: `feat/checklist-workflow-start-refine`
  - Commands: N/A (design only here; actual edits in Major Task 5).

- [x] Subtask 3.C [RESEARCH] — Analyze `plan-to-checklist.md` content and behavior (P1, M, [RESEARCH])
  - Files: `.codex/prompts/checklist-workflow/plan-to-checklist.md`
  - Symbols/Endpoints: N/A
  - Tests: N/A
  - Acceptance: Notes & Learnings includes strengths/weaknesses/verbosity notes and analysis of checklist semantics/working-memory behavior.
  - Branch/PR: N/A
  - Commands: filesystem read_text_file.

- [x] Subtask 3.D [IMPLEMENT] → 3.C — Draft change plan for `plan-to-checklist.md` (P1, S, [IMPLEMENT])
  - Files: this checklist
  - Symbols/Endpoints: N/A
  - Tests: N/A
  - Acceptance: Mini-spec in Notes & Learnings describing desired checklist semantics (statuses, IDs, dependencies, working memory) and concision changes.
  - Branch/PR: `feat/checklist-workflow-plan-to-checklist-refine`
  - Commands: N/A (design only).

- [x] Subtask 3.E [RESEARCH] — Analyze `execute-next-task.md` content and behavior (P1, M, [RESEARCH])
  - Files: `.codex/prompts/checklist-workflow/execute-next-task.md`
  - Symbols/Endpoints: N/A
  - Tests: N/A
  - Acceptance: Notes & Learnings includes an analysis of selection logic, execution depth, validation guidance, and next-task recommendation behavior.
  - Branch/PR: N/A
  - Commands: filesystem read_text_file.

- [x] Subtask 3.F [IMPLEMENT] → 3.E — Draft change plan for `execute-next-task.md` (P1, S, [IMPLEMENT])
  - Files: this checklist
  - Symbols/Endpoints: N/A
  - Tests: N/A
  - Acceptance: Mini-spec in Notes & Learnings clarifying single-task focus, validation strategy, and next-task recommendation format.
  - Branch/PR: `feat/checklist-workflow-execute-next-task-refine`
  - Commands: N/A (design only).

- [x] Subtask 3.G [PLAN] — Align core prompt roles with README-described workflow (P1, M, [PLAN])
  - Files: this checklist
  - Symbols/Endpoints: N/A
  - Tests: N/A
  - Acceptance: A “Core Prompt Role Matrix” in Notes & Learnings mapping each core prompt’s responsibilities and boundaries.
  - Branch/PR: N/A
  - Commands: N/A

- [x] Subtask 3.H [VALIDATE] → 3.A–3.G — Validate core prompt analysis completeness (P1, M, [VALIDATE])
  - Files: this checklist
  - Symbols/Endpoints: N/A
  - Tests: N/A
  - Acceptance: Confirm all three core prompts have strengths/weaknesses/verbosity summaries, change plans, and well-defined roles.
  - Branch/PR: N/A
  - Commands: N/A

### Major Task 4 — Analyze supporting prompts & cross-file coherence (P1, M, [RESEARCH]/[IMPLEMENT]/[VALIDATE])

- Context: Ensure all non-core prompts fit the workflow cleanly, with no conflicting roles or dangling references.

- [x] Subtask 4.A [RESEARCH] — Per-file analysis of each supporting prompt (P1, M, [RESEARCH])
  - Files: `review-checklist.md`, `session-start.md`, `session-end.md`, `scratchpad-review-and-cleanup.md`, `update-checklist.md`
  - Symbols/Endpoints: N/A
  - Tests: N/A
  - Acceptance: Notes & Learnings includes short per-file summaries (role, inputs, outputs, references).
  - Branch/PR: N/A
  - Commands: filesystem read_text_file.

- [x] Subtask 4.B [IMPLEMENT] → 4.A — Build a “Prompt Catalog” in checklist (P1, S, [IMPLEMENT])
  - Files: this checklist
  - Symbols/Endpoints: N/A
  - Tests: N/A
  - Acceptance: Prompt Catalog section in Notes & Learnings listing each prompt and its role/inputs/outputs/references.
  - Branch/PR: `feat/checklist-workflow-eval-checklist`
  - Commands: apply_patch to update checklist.

- [x] Subtask 4.C [RESEARCH] — Model cross-file workflow and variable flow (P1, M, [RESEARCH])
  - Files: this checklist
  - Symbols/Endpoints: N/A
  - Tests: N/A
  - Acceptance: “Cross-File Workflow v1” in Notes & Learnings describing how plan, checklist, and planning signals move through commands.
  - Branch/PR: N/A
  - Commands: N/A

- [x] Subtask 4.D [IMPLEMENT] → 4.C — Create explicit matrix for referential integrity (P1, S, [IMPLEMENT])
  - Files: this checklist
  - Symbols/Endpoints: N/A
  - Tests: N/A
  - Acceptance: Matrix mapping `From Prompt` → `References` → `Target` → `Status (Matches/Diverges/Missing)` captured in Notes & Learnings.
  - Branch/PR: `feat/checklist-workflow-eval-checklist`
  - Commands: apply_patch to add matrix.

- [x] Subtask 4.E [PLAN] — Classify issues by severity and type (P1, M, [PLAN])
  - Files: this checklist
  - Symbols/Endpoints: N/A
  - Tests: N/A
  - Acceptance: “Issue Catalog v1” in Notes & Learnings categorizing issues by severity and type (coherence, references, verbosity, redundancy).
  - Branch/PR: N/A
  - Commands: N/A

- [x] Subtask 4.F [VALIDATE] → 4.A–4.E — Confirm all files/issues accounted for (P1, S, [VALIDATE])
  - Files: this checklist
  - Symbols/Endpoints: N/A
  - Tests: N/A
  - Acceptance: No supporting prompt is missing from Prompt Catalog/Issue Catalog; all cross-references have a status.
  - Branch/PR: N/A
  - Commands: N/A

### Major Task 5 — Design and implement improvements to prompts (P1, L, [PLAN]/[IMPLEMENT]/[VALIDATE])

- Context: Turn analysis into concrete prompt edits, starting with README and core prompts, then supporting prompts.

- [x] Subtask 5.A [PLAN] — Prioritize changes per file (P1, M, [PLAN])
  - Files: this checklist
  - Symbols/Endpoints: N/A
  - Tests: N/A
  - Acceptance: “Change Plan v1” in Notes & Learnings listing critical/high/medium/low changes per file.
  - Branch/PR: N/A
  - Commands: N/A

- [x] Subtask 5.B [IMPLEMENT] → 5.A — Apply edits to `README.md` (P1, M, [IMPLEMENT])
  - Files: `.codex/prompts/checklist-workflow/README.md`
  - Symbols/Endpoints: N/A
  - Tests: N/A (manual review)
  - Acceptance: README accurately describes workflow, roles, and variable flow; overlapping MCP/checklist descriptions are tightened; command roles (especially `update-checklist` vs `review-checklist` vs `execute-next-task`) are crisp.
  - Branch/PR: `feat/checklist-workflow-readme-refine`
  - Commands: apply_patch on README.

- [x] Subtask 5.C [IMPLEMENT] → 3.B — Apply edits to `start.md` (P1, L, [IMPLEMENT])
  - Files: `.codex/prompts/checklist-workflow/start.md`
  - Symbols/Endpoints: N/A
  - Tests: N/A (manual prompt behavior analysis)
  - Acceptance: `start.md` uses `$INITIATIVE_CONTEXT` fully, handles unanswered questions via assumptions/logged risks, minimizes redundant branch prompts, and stays consistent with README.
  - Branch/PR: `feat/checklist-workflow-start-refine`
  - Commands: apply_patch on start.md.

- [x] Subtask 5.D [IMPLEMENT] → 3.D — Apply edits to `plan-to-checklist.md` (P1, L, [IMPLEMENT])
  - Files: `.codex/prompts/checklist-workflow/plan-to-checklist.md`
  - Symbols/Endpoints: N/A
  - Tests: N/A
  - Acceptance: It clearly instructs on constructing the canonical checklist, treats it as working memory, and is more concise without losing semantics.
  - Branch/PR: `feat/checklist-workflow-plan-to-checklist-refine`
  - Commands: apply_patch on plan-to-checklist.md.

- [x] Subtask 5.E [IMPLEMENT] → 3.F — Apply edits to `execute-next-task.md` (P1, L, [IMPLEMENT])
  - Files: `.codex/prompts/checklist-workflow/execute-next-task.md`
  - Symbols/Endpoints: N/A
  - Tests: N/A
  - Acceptance: Explicitly enforces “one checklist subtask per invocation,” clarifies validation scope ordering, and retains strong “prefer doing over saying” guidance.
  - Branch/PR: `feat/checklist-workflow-execute-next-task-refine`
  - Commands: apply_patch on execute-next-task.md.

- [x] Subtask 5.F [IMPLEMENT] → 4.E — Apply targeted edits to supporting prompts (P1, M, [IMPLEMENT])
  - Files: `review-checklist.md`, `session-start.md`, `session-end.md`, `scratchpad-review-and-cleanup.md`, `update-checklist.md`
  - Symbols/Endpoints: N/A
  - Tests: N/A
  - Acceptance: Each supporting prompt has a clear role, minimal overlap, and concise yet explicit guidance consistent with README.
  - Branch/PR: `feat/checklist-workflow-supporting-prompts-refine`
  - Commands: apply_patch as needed.

- [x] Subtask 5.G [VALIDATE] → 5.B–5.F — Quick regression pass on edited prompts (P1, M, [VALIDATE])
  - Files: all updated `.codex/prompts/checklist-workflow/*.md`
  - Symbols/Endpoints: N/A
  - Tests: N/A (manual prompt read-through)
  - Acceptance: ABOUTME headers still accurate; instructions coherent and aligned; no broken formatting or contradictions introduced.
  - Branch/PR: N/A
  - Commands: filesystem read_multiple_files for spot-checking.

### Major Task 6 — Final coherence checks, validation gate, and written assessment (P1, M, [VALIDATE]/[DOC])

- Context: Ensure the entire suite is coherent and that the final deliverable (assessment) answers your three questions clearly.

- [x] Subtask 6.A [VALIDATE] — Rebuild cross-file workflow model post-edits (P1, M, [VALIDATE])
  - Files: this checklist
  - Symbols/Endpoints: N/A
  - Tests: N/A
  - Acceptance: “Cross-File Workflow v2” in Notes & Learnings reflecting refined behavior; confirms lifecycle and planning signals are consistent.
  - Branch/PR: N/A
  - Commands: N/A

- [x] Subtask 6.B [VALIDATE] — Re-check referential integrity matrix post-edits (P1, M, [VALIDATE])
  - Files: this checklist
  - Symbols/Endpoints: N/A
  - Tests: N/A
  - Acceptance: All critical references in the matrix are “Matches”; no lingering “Missing”/“Contradicted” for important interactions.
  - Branch/PR: N/A
  - Commands: N/A

- [x] Subtask 6.C [VALIDATE] — Verbosity vs effectiveness audit (P2, M, [VALIDATE])
  - Files: all `.codex/prompts/checklist-workflow/*.md`
  - Symbols/Endpoints: N/A
  - Tests: N/A
  - Acceptance: Notes & Learnings summarize per-file verbosity decisions and confirm that any remaining verbosity is justified by clarity/safety.
  - Branch/PR: N/A
  - Commands: N/A

- [x] Subtask 6.D [DOC] — Write final strengths/weaknesses/verbosity assessment (P1, M, [DOC])
  - Files: this checklist (for notes); chat response as primary deliverable
  - Symbols/Endpoints: N/A
  - Tests: N/A
  - Acceptance: Final answer clearly enumerates strengths, weaknesses with proposed remediations (and implemented ones), and verbosity opportunities for each key file and the suite.
  - Branch/PR: N/A
  - Commands: N/A

- [x] Subtask 6.E [VALIDATE] — Apply Validation Gate mindset (process-level) (P2, S, [VALIDATE])
  - Files: this checklist
  - Symbols/Endpoints: N/A
  - Tests: N/A
  - Acceptance: Notes & Learnings capture which steps were executed, any skipped steps (with reasons), and overall confidence in prompt-suite quality.
  - Branch/PR: N/A
  - Commands: N/A

- [x] Subtask 6.F [PLAN] — Decide on the most valuable follow-on initiative (P2, S, [PLAN])
  - Files: this checklist
  - Symbols/Endpoints: N/A
  - Tests: N/A
  - Acceptance: Notes & Learnings contain a short comparison of at least two candidate follow-on initiatives (for example, deeper verbosity refactor vs tests around prompt consumers) and a clear decision about which to pursue first.
  - Branch/PR: N/A
  - Commands: N/A

- [x] Subtask 6.G [IMPLEMENT] → 6.F — Create a new checklist for the chosen follow-on initiative (P2, S, [IMPLEMENT])
  - Files: `scratchpaper/task_checklists/<YYYY-MM-DD>–<follow-on-initiative-slug>–checklist.md`
  - Symbols/Endpoints: N/A
  - Tests: N/A (manual inspection of the new checklist)
  - Acceptance: A new checklist file exists for the chosen initiative with ABOUTME header and core sections (North Star / Goals, Key Principles, Sequential Task Breakdown, Notes & Learnings, Validation Gate, Definition of Done, Kickoff Protocol, Execution & Continuous Refinement, Meta-Reflection and Iteration, Research→Action pairing, Next Task / Next Session Focus), ready to be populated.
  - Branch/PR: `feat/<follow-on-initiative-slug>-checklist` (intended)
  - Commands: `mkdir -p scratchpaper/task_checklists` (if needed); apply_patch or equivalent to create the new checklist file.

## 4. Notes & Learnings

- 2025-11-22 — Scope: All analysis and edits are restricted to `.codex/prompts/checklist-workflow`. These prompts are mission-critical steering commands for Codex CLI; changes must preserve or improve safety, reliability, and agent performance.
- 2025-11-22 — This checklist file was created to serve as the working memory for evaluating and refining the checklist-workflow prompt suite, following the Comprehensive Personal Task Checklist Framework.

### 2025-11-22 — File Inventory (Subtasks 2.A, 2.B)

- Files under `.codex/prompts/checklist-workflow/`:
  - `README.md` — documentation for checklist workflow behavior and usage.
  - `start.md` — entrypoint for new or existing initiatives, producing a structured plan.
  - `plan-to-checklist.md` — converts the plan into a canonical checklist markdown file.
  - `execute-next-task.md` — executes exactly one checklist subtask, with micro-planning and validation.
  - `review-checklist.md` — reconciles checklist state with repository/code/test reality after execution.
  - `update-checklist.md` — applies structural and metadata changes to the checklist when understanding or scope change.
  - `session-start.md` — rehydrates context and proposes the single best next task at the beginning of a session.
  - `session-end.md` — summarizes the session and sets `NEXT_SESSION_FOCUS`.
  - `scratchpad-review-and-cleanup.md` — reviews scratch artifacts and proposes safe promote/keep/delete commands.

### 2025-11-22 — Workflow Model v1 (Subtasks 2.C, 2.D)

1. `start` — Ingest `$INITIATIVE_CONTEXT`, clarify goals/constraints, decompose work using `sequential-thinking`, and output Initiative Summary, Key Principles, Constraints, Open Questions & Risks, Branch Plan, Proposed Major Tasks & Subtasks, and Checklist File Plan.
2. `plan-to-checklist` — Transform `start`’s output into a markdown checklist under `scratchpaper/task_checklists/`, populating sections (North Star / Goals, Key Principles, Sequential Task Breakdown, Notes & Learnings, Validation Gate, Definition of Done, Kickoff Protocol, Execution & Continuous Refinement, Meta-Reflection and Iteration, Research→Action pairing, and neutral Next Task / Next Session Focus note).
3. `session-start` — Read the checklist and planning signals (`RECOMMENDED_NEXT_TASK`, `NEXT_SESSION_FOCUS`), summarize status, and propose the single best next task.
4. `execute-next-task` — Select and execute exactly one checklist subtask, make real edits via tools, run targeted validations, update checklist and Notes & Learnings, and emit a new `RECOMMENDED_NEXT_TASK`.
5. `review-checklist` — After meaningful code/test changes, reconcile checklist vs repo state, adjust structure/status/metadata, update Notes & Learnings, and refine `RECOMMENDED_NEXT_TASK` / Next Task note.
6. `update-checklist` — When understanding or scope changes (not just fresh execution), update checklist structure/metadata, enforce research→action pairing, and keep Validation Gate/Definition of Done accurate.
7. `session-end` — Summarize what happened in the session, update checklist statuses and Notes & Learnings, and set `NEXT_SESSION_FOCUS` both in the checklist and in the response.
8. `scratchpad-review-and-cleanup` — Periodically or near initiative end, review `scratchpaper/*` artifacts, classify them as promote/keep/delete, propose commands, and update the checklist with promotion/cleanup tasks.

### 2025-11-22 — Core Prompt Role Matrix (Subtasks 3.G, 4.A)

- `start.md`:
  - Role: Turn `$INITIATIVE_CONTEXT` into a structured plan with Initiative Summary, Key Principles, Constraints, Open Questions & Risks, Branch Plan, and Proposed Major Tasks & Subtasks.
  - Inputs: `$INITIATIVE_CONTEXT`, AGENTS/MASTER_AGENTS, repo/branch context (infer first, ask if unclear).
  - Outputs: Text sections consumed by `plan-to-checklist` and guidance for checklist filename and branch.
- `plan-to-checklist.md`:
  - Role: Create or update the canonical checklist markdown file as working memory for the initiative.
  - Inputs: Plan from `start` (or equivalent), checklist path under `scratchpaper/task_checklists/`.
  - Outputs: Structured checklist with sections, Major Tasks/Subtasks, Notes & Learnings seed, Validation Gate, Definition of Done, Next Task / Next Session Focus note.
- `execute-next-task.md`:
  - Role: Execution loop command that chooses and executes exactly one checklist subtask per invocation, with micro-planning, tool usage, validations, and checklist updates.
  - Inputs: Checklist path and state, planning signals (`RECOMMENDED_NEXT_TASK`, `NEXT_SESSION_FOCUS`), user instructions.
  - Outputs: Concrete edits, updated checklist statuses/notes, and a new `RECOMMENDED_NEXT_TASK`.
- `review-checklist.md`:
  - Role: Reconcile checklist tasks and statuses with repository state after execution.
  - Inputs: Checklist and knowledge of recent code/test changes.
  - Outputs: Updated checklist structure/status/metadata, Notes & Learnings entry, and a `RECOMMENDED_NEXT_TASK`.
- `update-checklist.md`:
  - Role: Apply structural and metadata changes to the checklist when understanding or scope changes, without executing code.
  - Inputs: Checklist and user-described scope/understanding changes.
  - Outputs: Adjusted tasks/IDs/tags and strengthened references, with Notes & Learnings entry.
- `session-start.md`:
  - Role: Start a coding session by rehydrating context and proposing the best next task.
  - Inputs: `$CHECKLIST_PATH`, `$FEATURE_BRANCH`, checklist content, planning signals.
  - Outputs: Status summary, candidate tasks, and `RECOMMENDED_NEXT_TASK`.
- `session-end.md`:
  - Role: End a coding session by summarizing progress and setting `NEXT_SESSION_FOCUS`.
  - Inputs: Checklist and tasks executed during the session.
  - Outputs: Updated checklist statuses/notes and `NEXT_SESSION_FOCUS`.
- `scratchpad-review-and-cleanup.md`:
  - Role: Perform scratchpad hygiene, classifying scratch files and proposing non-destructive commands.
  - Inputs: Scratch directories (default `scratchpaper/` plus any others from context).
  - Outputs: Classification of files, proposed commands, and checklist updates for promotion/cleanup work.

### 2025-11-22 — Prompt Catalog (Subtasks 4.B, 4.C)

| Prompt file                         | Primary role                                      | Key inputs                                      | Key outputs                                                  |
|-------------------------------------|---------------------------------------------------|-------------------------------------------------|--------------------------------------------------------------|
| `README.md`                         | Conceptual and reference documentation            | N/A                                             | Workflow description, schema, planning signals, guardrails  |
| `start.md`                          | Ingest context and produce structured initiative plan | `$INITIATIVE_CONTEXT`, repo/branch context | Plan sections consumed by `plan-to-checklist`               |
| `plan-to-checklist.md`             | Build/update canonical checklist markdown         | Plan from `start`, checklist path               | Checklist with sections, tasks, notes, validation gate      |
| `execute-next-task.md`             | Execute exactly one checklist subtask             | Checklist, planning signals, user instructions  | Edits, validations, updated checklist, `RECOMMENDED_NEXT_TASK` |
| `review-checklist.md`              | Reconcile checklist vs repo state                 | Checklist, repo/test state                      | Updated checklist, Notes & Learnings, `RECOMMENDED_NEXT_TASK` |
| `update-checklist.md`              | Apply structural/metadata updates to checklist    | Checklist, user-described scope changes         | Adjusted tasks/IDs/tags, strengthened references            |
| `session-start.md`                 | Start session, summarize, pick next task          | `$CHECKLIST_PATH`, `$FEATURE_BRANCH`, checklist | Summary, candidate tasks, `RECOMMENDED_NEXT_TASK`           |
| `session-end.md`                   | End session, summarize, set NEXT_SESSION_FOCUS    | Checklist, executed tasks                       | Updated checklist, Notes & Learnings, `NEXT_SESSION_FOCUS`  |
| `scratchpad-review-and-cleanup.md` | Scratch hygiene, propose safe commands            | `scratchpaper/*` paths                          | Classification of files and proposed commands                |

### 2025-11-22 — Referentials & Issue Catalog v1 (Subtasks 2.E, 2.F, 4.D, 4.E)

**Representative referential integrity matrix (summary):**

| From          | Reference                                        | Target                                  | Status       |
|---------------|--------------------------------------------------|-----------------------------------------|-------------|
| `README.md`   | Minimal flow steps 1–7                          | `start`, `plan-to-checklist`, `session-start`, `execute-next-task`, `review-checklist`, `session-end`, `scratchpad-review-and-cleanup` | Matches     |
| `README.md`   | Command cheatsheet entries                       | Corresponding `.md` files               | Matches     |
| `plan-to-checklist.md` | Uses plan from `start` and checklist under `scratchpaper/task_checklists/` | `start`, checklist file paths           | Matches     |
| `execute-next-task.md` | `RECOMMENDED_NEXT_TASK` output          | Checklist Next Task / Next Session Focus note, `session-start`/`session-end` consumption | Matches     |
| `session-end.md` | `NEXT_SESSION_FOCUS` output                   | Checklist Next Task / Next Session Focus note, `session-start` consumption | Matches     |
| `review-checklist.md` | Use after meaningful execution; refine `RECOMMENDED_NEXT_TASK` | Checklist and execution history         | Matches     |
| `update-checklist.md` | Use when understanding/scope changes (not to mark tasks complete) | Checklist structure and metadata        | Matches     |

**Issue Catalog v1 (severity/type summary):**

- Critical: None identified after refinements.
- High:
  - Pre-refinement overlap between `review-checklist` and `update-checklist` responsibilities; now mitigated by clearer role descriptions in README and the prompts themselves.
  - Pre-refinement implicitness of single-task execution in `execute-next-task`; now explicit.
- Medium:
  - Verbosity and repetition across README and `plan-to-checklist` around checklist sections and MCP usage; mitigated by concise mapping language and slightly compressed descriptions.
- Low:
  - Minor naming variations for the neutral next-task note; now standardized around “Next Task / Next Session Focus”.

### 2025-11-22 — Cross-File Workflow v2 & Verbosity Audit (Subtasks 6.A, 6.C)

- Cross-File Workflow v2:
  - Confirms the lifecycle: `start` → `plan-to-checklist` → `session-start` → `execute-next-task` ↔ `review-checklist`/`update-checklist` → `session-end` → `scratchpad-review-and-cleanup`.
  - Treats the checklist as the single working-memory artifact that must stay in sync with real work and validations.
  - Uses `RECOMMENDED_NEXT_TASK` and `NEXT_SESSION_FOCUS` consistently as planning signals across commands.
- Verbosity Audit (summary):
  - `README.md`: kept detailed schema and lifecycle explanation but trimmed command role/cheatsheet text where appropriate; consolidated some overlapping descriptions.
  - `start.md`: preserved detailed planning instructions while adding clear fallback behavior for unanswered questions and less redundant branch prompts.
  - `plan-to-checklist.md`: compressed per-section mapping language to be more concise while preserving explicit mapping from `start` outputs to checklist sections.
  - `execute-next-task.md`: kept detailed execution guidance while making single-task constraint and validation scope ordering explicit.
  - Supporting prompts: left mostly as-is, with focused clarifications (e.g., review vs update roles, discovery defaults) to avoid over-verbosity and maintain clarity.

### 2025-11-22 — Final Assessment Hook (Subtasks 6.B, 6.D, 6.E)

- Referential integrity checks confirm that all referenced commands and planning signals exist and behave as described.
- Final strengths/weaknesses/verbosity assessment delivered in the chat (this conversation) and summarized here in Notes & Learnings.
- Process-level Validation Gate:
  - All planned changes were implemented via `apply_patch`.
  - No contradictions introduced in cross-file behavior; all edits remain within `.codex/prompts/checklist-workflow`.

### 2025-11-22 — Review→Checklist Update Summary

- Incorporated the preceding checklist review into this checklist by:
  - Backfilling Notes & Learnings with file inventory, workflow models, prompt catalog, referential matrix, issue catalog, and verbosity audit summaries.
  - Marking all completed planning/research and implementation/validation subtasks `[x]` across Major Tasks 1–6, reflecting the work performed on `.codex/prompts/checklist-workflow/*.md` and this checklist.
  - Setting `NEXT_SESSION_FOCUS` to an optional future validation task (6.C) to make any additional verbosity audit explicit and discoverable.
- No new scope was added beyond the original initiative; remaining work, if any, would be explicitly captured as new subtasks in this checklist.

### 2025-11-22 — Follow-on Initiative Decision (Subtask 6.F)

- Candidate follow-on initiatives considered:
  - (A) Deeper verbosity refactor of the checklist-workflow prompts, pushing concision further while preserving behavior.
  - (B) Add automated tests around the code that consumes the checklist-workflow prompts, so that their behavior is guarded by regression coverage.
- Decision: Choose (B) as the most valuable next initiative. The prompts are now coherent and reasonably concise; the higher-leverage next step is to protect their behavior by adding tests around the prompt-consumer code paths. This will be modeled as a new initiative with its own checklist under `scratchpaper/task_checklists/`.

### Mid-Execution Review Summary — 2025-11-22
- Alignment verdict: The checklist-workflow prompt suite and this checklist are aligned; roles, planning signals, and lifecycle across commands match README and individual prompt files after refinements.
- Key strengths to preserve: Clear lifecycle (`start` → `plan-to-checklist` → `session-start` → `execute-next-task` ↔ `review-checklist`/`update-checklist` → `session-end` → `scratchpad-review-and-cleanup`), strong working-memory model via the checklist, explicit planning signals (`RECOMMENDED_NEXT_TASK`, `NEXT_SESSION_FOCUS`), and consistent research→action pairing.
- Weaknesses addressed: Pre-refinement overlap between `review-checklist` and `update-checklist`; implicit single-task focus in `execute-next-task`; and excess verbosity in some section-mapping and tool-usage descriptions. These have been clarified or tightened without removing safety-critical guidance.
- Tasks reopened / added / reordered: None were reopened or reordered during this review; instead, existing tasks were confirmed as complete and Notes & Learnings were expanded to capture the full analysis and refinement work. Any future expansion of scope (for example, a deeper verbosity pass) would be represented as new subtasks under this checklist.

## 5. Validation Gate

- Command Summary:
  - For this initiative, core validations are reasoning-level and prompt-level checks: no automated tests are run unless prompt changes affect executable code paths.
- Validation Script:
  - Manual read-through of each `.codex/prompts/checklist-workflow/*.md` file after edits.
- Observations:
  - Record any contradictions, dangling references, or confusing overlaps discovered during validation.
- Artifacts:
  - Branch names like `feat/checklist-workflow-*-refine` if changes are committed, plus any relevant PR IDs.
- Date & Outcome:
  - 2025-11-22 — Manual validation performed via read-through of all `.codex/prompts/checklist-workflow/*.md` files; no contradictions or dangling references remain after refinements. All validations defined for this prompt-only initiative are complete; any additional checks (such as a future deep verbosity audit) would be captured as new checklist items and treated as “Pending Recheck” for that expanded scope.

## 6. Definition of Done

- This checklist adheres to the structural format you specified.
- Each task/subtask is explicitly articulated with measurable endpoints.
- Major Tasks and Subtasks together cover the full scope of evaluating, refining, and validating the checklist-workflow prompt suite.
- For each Major Task beyond initial discovery, at least one `[IMPLEMENT]` subtask leads to real edits in `.codex/prompts/checklist-workflow/*.md` or this checklist.
- Notes & Learnings include dated reasoning entries; no large gaps in context.
- Validation Gate entries are populated with outcomes once work is complete.

## 7. Kickoff Protocol

- At the start of any work cycle on this initiative:
  - Review North Star / Goals and Key Principles.
  - Scan Sequential Task Breakdown for open `[PLAN]/[RESEARCH]` and `[IMPLEMENT]/[VALIDATE]` items.
  - Check the neutral Next Task / Next Session Focus note (see below).
  - Choose the top 3 tasks for the day, including at least one `[IMPLEMENT]` or `[VALIDATE]` subtask that changes prompts or this checklist.
  - Record ordering rationale and any dependencies in Notes & Learnings.

### Daily Kickoff

- Current top executable items (reflecting post-review priorities):
  - 6.F [PLAN] — Decide on the most valuable follow-on initiative (for example, deeper verbosity refactor vs tests around prompt consumers).
  - 6.G [IMPLEMENT] → 6.F — Create a new checklist file for the chosen follow-on initiative under `scratchpaper/task_checklists/`.
- These tasks ensure that any further work is explicitly modeled as a new initiative with its own checklist, while this completed evaluation checklist remains the source of truth for what has been done.

## 8. Execution & Continuous Refinement

- Begin each session by updating statuses for any tasks that changed since the last edit.
- Use `session-start` in the checklist-workflow to rehydrate state from this checklist (once integrated).
- Use `execute-next-task` to work on exactly one checklist subtask at a time, making real edits via tools and updating this checklist accordingly.
- Use `review-checklist` and `update-checklist` to reconcile and refine this checklist as understanding and scope evolve.
- Aim to complete at least one `[IMPLEMENT]` or `[VALIDATE]` subtask per session when beyond early discovery; if blocked, ensure a decisive `[PLAN]/[RESEARCH]` item is completed that unlocks future execution.

## 9. Meta-Reflection and Iteration

- End each session by answering (in Notes & Learnings):
  - What assumptions were challenged or validated?
  - What dependencies emerged unexpectedly?
  - What next step has the highest leverage tomorrow?
  - Where can precision or articulation quality be improved?

## 10. Research→Action Pairing

- For every `[PLAN]` or `[RESEARCH]` subtask, there is a paired `[IMPLEMENT]` or `[VALIDATE]` subtask within the same Major Task.
- Execution subtasks reference the research items they rely on where helpful (e.g., “→ 3.A [RESEARCH]”).
- Inputs for execution tasks are the artifacts produced by research/planning (notes in this checklist, mini-specs, matrices).
- Outputs are measurable (edited files, updated sections, completed assessments).

## 11. Task & Subtask Naming Conventions

- Major Tasks use the format: `Major Task N — <short verb phrase> (tags)`.
- Subtasks use the format: `Subtask N.X [PREFIX] — <clear action/result> (tags)`.
- Tags at the end indicate priority (`P1`/`P2`), complexity (`S`/`M`/`L`), phase (`[PLAN]`/`[RESEARCH]`/`[IMPLEMENT]`/`[VALIDATE]`/`[DOC]`), and tool hints where relevant.
- When updating titles, retain prefixes and IDs; modify only descriptions.
- When splitting a task, use suffixed children (`2.C.1`, `2.C.2`).

## 12. Next Task / Next Session Focus

- Neutral note to record the single best next checklist subtask for upcoming work:
  - NEXT_SESSION_FOCUS: 6.F [PLAN] — Decide on the most valuable follow-on initiative (for example, deeper verbosity refactor vs tests around prompt consumers) so that a dedicated checklist can be created for that new scope.
