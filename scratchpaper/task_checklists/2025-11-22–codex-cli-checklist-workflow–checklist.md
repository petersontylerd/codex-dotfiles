ABOUTME: Checklist for designing Codex CLI checklist workflow.
ABOUTME: Working-memory task list for this effort.

# Codex CLI Checklist Workflow — Comprehensive Task Checklist

### Daily Kickoff — 2025-11-22

Top 3 tasks for this cycle:

1. **Subtask 1.A [PLAN]** — Precisely define the problem statement, scope, and success criteria for the Codex CLI checklist workflow so that all later design/implementation is anchored.
2. **Subtask 1.C [RESEARCH]** — Inspect existing `.codex` prompts, `AGENTS.md`, and repo docs to extract constraints, conventions, and integration points.
3. **Subtask 1.B [IMPLEMENT → 1.A]** — Persist the clarified problem/scope/success criteria into this checklist and a new README skeleton so they become durable, shareable artifacts.  
   - This is the `[IMPLEMENT]` item that changes repo files (README skeleton), directly applying planning work from 1.A.

Ordering rationale:

- 1.A must precede 1.B so that implementation artifacts accurately reflect scope and success criteria.  
- 1.C runs in parallel conceptually but is placed second to ensure we do not prematurely overfit to current prompts; it informs 1.A/1.B but does not override the first-principles definition.  
- 1.B is third because it encodes both 1.A and early findings from 1.C into a concrete artifact, satisfying the research→action pairing early in the project.

---

## 1. North Star / Goals

- **Goal 1:** Design and implement a Codex CLI–driven checklist workflow that acts as robust working memory for epics/features, enabling multi-session, multi-day development without context loss.
- **Goal 2:** Ensure the workflow systematically balances deep planning/research with concrete implementation/validation work, so that every research/planning item has a paired, code-changing execution step.
- **Goal 3:** Encode best practices for agentic CLIs (Codex CLI, Claude Code, Gemini CLI, etc.), including version control hygiene, scratchpad lifecycle management, and error handling, directly into custom commands and documentation.
- **Goal 4:** Reduce operational friction and failure modes you have observed (e.g., “describe but don’t execute,” lingering scratchpads, blocked commands) by making the preferred behaviors the default in our prompts and workflow.

Failure looks like:

- A workflow that still requires frequent “Execute” nudges, leaves stale scratch artifacts, or regularly loses context between sessions.  
- Checklists that are vague, non-actionable, or unaligned with actual code changes/tests.  
- Prompts that are tightly coupled to current repo files but do not generalize or remain maintainable as the project evolves.

---

## 2. Key Principles

- **Plan deeply, execute cleanly.** Planning/research is explicit, structured, and methodical, always paired with concrete implementation tasks that change code or tests.
- **Every unclear step is a hidden risk.** Ambiguity in tasks, subtasks, or acceptance criteria is treated as a defect and resolved before execution.
- **Reflection before iteration.** Regular review cycles reconcile the checklist with actual code state and adjust the plan; we do not blindly follow outdated plans.
- **Bias toward delivery with respect for rigor.** Research is thorough but bounded and always drives specific implementation/validation actions.
- **Working memory must be externalized.** Checklist + notes + README must be self-contained so any capable agent (or you) can resume work without guessing.

---

## 3. Sequential Task Breakdown

### Major Task 1 — Clarify scope, constraints, and success criteria for the Codex CLI checklist workflow (P1, M, [PLAN]/[RESEARCH]/[DOC])

Context: This task creates the conceptual foundation for all design and implementation work. It aligns your expectations, repo constraints, and agentic capabilities into a single, durable framing.

- [ ] **Subtask 1.A [PLAN]** — Write a precise problem statement and scope for the Codex CLI checklist workflow. (P1, S, [PLAN], (sequential-thinking))  
  - Define what “working memory via checklist” must accomplish for epics/features.  
  - Enumerate explicit in-scope and out-of-scope behaviors (e.g., what this workflow will and will not automate).  
  - Identify key user pain points that must be addressed (version control, execution vs narration, scratchpads, blocked commands).

- [ ] **Subtask 1.B [IMPLEMENT → 1.A]** — Persist problem statement, scope, and success criteria into this checklist and a README skeleton. (P1, S, [IMPLEMENT], (sequential-thinking))  
  Files: `scratchpaper/task_checklists/2025-11-22–codex-cli-checklist-workflow–checklist.md`, `.codex/prompts/checklist-workflow/README.md`  
  Symbols/Endpoints: N/A (documentation artifacts)  
  Tests: N/A (validated via review and later workflow tests)  
  Acceptance: README contains a concise “Problem & Scope” section aligned with Subtask 1.A; checklist mirrors these points under North Star/Goals.  
  Branch/PR: `feat/codex-cli-checklist-workflow` → PR to main once workflow is validated  
  Commands: `git checkout -b feat/codex-cli-checklist-workflow` (if branch not yet created)

- [ ] **Subtask 1.C [RESEARCH]** — Inspect existing repo conventions and constraints relevant to this workflow. (P2, S, [RESEARCH], (serena))  
  - Review `AGENTS.md`, `.codex/docs`, and existing `.codex/prompts` for style, naming, and behavioral expectations.  
  - Note any requirements about ABOUTME headers, testing philosophy, and prompt organization.  
  - Identify any existing checklist-like artifacts to reuse conceptually.

- [ ] **Subtask 1.D [IMPLEMENT → 1.C]** — Encode repo constraints and conventions into the README skeleton. (P2, S, [IMPLEMENT], (serena))  
  Files: `.codex/prompts/checklist-workflow/README.md`  
  Symbols/Endpoints: N/A  
  Tests: N/A  
  Acceptance: README includes a “Repository Constraints & Conventions” section summarizing AGENTS rules and relevant docs.  
  Branch/PR: `feat/codex-cli-checklist-workflow`  
  Commands: `uv run pre-commit run --all-files` before proposing merge

- [ ] **Subtask 1.E [PLAN]** — Define qualitative and quantitative success criteria for the new workflow. (P1, S, [PLAN], (sequential-thinking))  
  - Examples: reduction in “describe but don’t execute” occurrences, frequency of stale scratchpads, clarity of resume context.  
  - Specify how success will be evaluated in practical usage.

- [ ] **Subtask 1.F [IMPLEMENT → 1.E]** — Add a “Success Metrics & Evaluation” section to README. (P2, S, [IMPLEMENT], (sequential-thinking))  
  Files: `.codex/prompts/checklist-workflow/README.md`  
  Symbols/Endpoints: N/A  
  Tests: N/A  
  Acceptance: README clearly lists at least 3–5 success metrics that can be subjectively assessed after trial runs.  
  Branch/PR: `feat/codex-cli-checklist-workflow`  
  Commands: `git add . && git commit -m "docs(checklist-workflow): add success metrics"`

---

### Major Task 2 — Research external best practices for agentic coding CLIs (P1, M, [RESEARCH]/[PLAN]/[DOC])

Context: This task gathers best practices from Codex CLI, Claude Code, Gemini CLI, and similar tools to inform a robust, future-proof workflow.

- [x] **Subtask 2.A [RESEARCH]** — Survey official docs and guides for Codex CLI and related agentic coding CLIs. (P1, M, [RESEARCH], (sequential-thinking))  
  - Focus: planning vs acting, persistent context, session management, error handling, and scratchpads.  
  - Capture key patterns, anti-patterns, and recommended workflows.

- [x] **Subtask 2.B [IMPLEMENT → 2.A]** — Summarize external patterns into a structured notes section. (P2, S, [IMPLEMENT], (sequential-thinking))  
  Files: `.codex/prompts/checklist-workflow/README.md` (section “External Best Practices Overview”), `scratchpaper/task_checklists/2025-11-22–codex-cli-checklist-workflow–checklist.md` (Notes & Learnings)  
  Symbols/Endpoints: N/A  
  Tests: N/A  
  Acceptance: README has a concise list of 5–10 bullet best practices; checklist’s Notes & Learnings references them with dates.  
  Branch/PR: `feat/codex-cli-checklist-workflow`  
  Commands: `git add . && git commit -m "docs(checklist-workflow): capture external best practices"`

- [x] **Subtask 2.C [RESEARCH]** — Investigate how other tools handle version control integration. (P2, S, [RESEARCH], (sequential-thinking))  
  - Branch naming, commit cadence, PR automation/patterns.  
  - How they instruct users vs directly running `git`.

- [x] **Subtask 2.D [IMPLEMENT → 2.C]** — Draft “Version Control Best Practices for Checklists” section. (P2, S, [IMPLEMENT], (sequential-thinking))  
  Files: `.codex/prompts/checklist-workflow/README.md`  
  Symbols/Endpoints: N/A  
  Tests: N/A  
  Acceptance: Section outlines recommended branch names (e.g., `feat/...`, `fix/...`), commit style, and merge/cleanup rituals for epic-based workflows.  
  Branch/PR: `feat/codex-cli-checklist-workflow`  
  Commands: `git add . && git commit -m "docs(checklist-workflow): add version control guidance"`

- [x] **Subtask 2.E [RESEARCH]** — Examine strategies for scratchpad and ephemeral artifact management. (P3, S, [RESEARCH], (sequential-thinking))  
  - Look for conventions in naming, directories, and cleanup routines.

- [x] **Subtask 2.F [IMPLEMENT → 2.E]** — Encode scratchpad lifecycle recommendations into README and checklist usage notes. (P3, S, [IMPLEMENT], (sequential-thinking))  
  Files: `.codex/prompts/checklist-workflow/README.md`, `scratchpaper/task_checklists/2025-11-22–codex-cli-checklist-workflow–checklist.md`  
  Symbols/Endpoints: N/A  
  Tests: N/A  
  Acceptance: README explains how scratchpads should be created, named, reviewed, and cleaned; checklist includes explicit scratchpad-review subtasks (see Major Task 6).  
  Branch/PR: `feat/codex-cli-checklist-workflow`  
  Commands: `git add . && git commit -m "docs(checklist-workflow): document scratchpad lifecycle"`

- [x] **Subtask 2.G [PLAN]** — Synthesize research findings into constraints and opportunities that will shape command design. (P2, S, [PLAN], (sequential-thinking))  
  - Identify which patterns we adopt, adapt, or reject.

- [x] **Subtask 2.H [IMPLEMENT → 2.G]** — Create a short “Design Implications from Research” section. (P2, S, [IMPLEMENT], (sequential-thinking))  
  Files: `.codex/prompts/checklist-workflow/README.md`  
  Symbols/Endpoints: N/A  
  Tests: N/A  
  Acceptance: Section explicitly lists at least 3–5 design decisions directly tied to external research.  
  Branch/PR: `feat/codex-cli-checklist-workflow`  
  Commands: `git add . && git commit -m "docs(checklist-workflow): record design implications"`

---

-### Major Task 3 — Design the end-to-end workflow and command set (P1, L, [PLAN]/[DOC])
-
-Context: This task defines the conceptual flow, command roles, and tool usage patterns before any prompt implementation.
-
- [x] **Subtask 3.A [PLAN]** — Define the canonical epic lifecycle phases for this workflow. (P1, M, [PLAN], (sequential-thinking))  
  - Phases: epic-init, planning/checklist creation, execution loop, review/refinement, session management, hygiene/closure.

- [x] **Subtask 3.B [IMPLEMENT → 3.A] [DOC]** — Document the epic lifecycle phases in README. (P2, S, [IMPLEMENT], (sequential-thinking))  
  Files: `.codex/prompts/checklist-workflow/README.md`  
  Symbols/Endpoints: N/A  
  Tests: N/A  
  Acceptance: README has a clear “Epic Lifecycle” section mapping phases to responsibilities.  
  Branch/PR: `feat/codex-cli-checklist-workflow`  
  Commands: `git add . && git commit -m "docs(checklist-workflow): document epic lifecycle"`

- [x] **Subtask 3.C [PLAN]** — Enumerate the custom command files and their roles. (P1, M, [PLAN], (sequential-thinking))  
  - Candidate commands: `epic-start`, `epic-plan-to-checklist`, `epic-execute-next-task`, `epic-review-checklist`, `epic-update-checklist`, `session-start`, `session-end`, `scratchpad-review-and-cleanup`.  
  - Define inputs/outputs and constraints for each.

- [x] **Subtask 3.D [IMPLEMENT → 3.C]** — Draft a “Command Reference Overview” in README. (P2, S, [IMPLEMENT], (sequential-thinking))  
  Files: `.codex/prompts/checklist-workflow/README.md`  
  Symbols/Endpoints: N/A  
  Tests: N/A  
  Acceptance: README includes a table or list describing each command, its intent, and when to use it.  
  Branch/PR: `feat/codex-cli-checklist-workflow`  
  Commands: `git add . && git commit -m "docs(checklist-workflow): add command reference overview"`

- [x] **Subtask 3.E [PLAN]** — Design how `sequential-thinking`, `serena`, and `context7` will be used across commands. (P1, M, [PLAN], (sequential-thinking))  
  - Define default expectations: e.g., `sequential-thinking` for internal planning, `serena` for code navigation/edits, `context7` for API docs.

- [x] **Subtask 3.F [IMPLEMENT → 3.E]** — Encode MCP usage expectations into each command’s description in README. (P2, S, [IMPLEMENT], (sequential-thinking))  
  Files: `.codex/prompts/checklist-workflow/README.md`  
  Symbols/Endpoints: N/A  
  Tests: N/A  
  Acceptance: Each command’s description includes explicit guidance on when to use each MCP tool.  
  Branch/PR: `feat/codex-cli-checklist-workflow`  
  Commands: `git add . && git commit -m "docs(checklist-workflow): specify MCP usage per command"`

- [x] **Subtask 3.G [PLAN]** — Define how the workflow will enforce “execute, not just describe” behavior. (P1, M, [PLAN], (sequential-thinking))  
  - E.g., explicit instructions in `epic-execute-next-task` to prefer editing/running tools over explanation-only responses.

- [x] **Subtask 3.H [IMPLEMENT → 3.G]** — Create a “Behavioral Guardrails” section in README. (P2, S, [IMPLEMENT], (sequential-thinking))  
  Files: `.codex/prompts/checklist-workflow/README.md`  
  Symbols/Endpoints: N/A  
  Tests: N/A  
  Acceptance: Section clearly addresses your four observed issues and prescribes concrete guardrails for each.  
  Branch/PR: `feat/codex-cli-checklist-workflow`  
  Commands: `git add . && git commit -m "docs(checklist-workflow): add behavioral guardrails"`

---

### Major Task 4 — Design checklist artifact format and integration with repo (P1, M, [PLAN]/[DOC])

Context: This task defines where and how epic checklists live, how they’re updated, and how they relate to `.codex/scripts` planning artifacts.

- [x] **Subtask 4.A [PLAN]** — Decide canonical storage locations and formats for epic checklists. (P1, M, [PLAN], (sequential-thinking))  
  - Options: `.codex/scripts/epic-*/feature-*` YAML, Markdown checklists under a dedicated directory, or both.

- [x] **Subtask 4.B [IMPLEMENT → 4.A]** — Define and document the canonical checklist schema. (P2, M, [IMPLEMENT], (sequential-thinking))  
  Files: `.codex/prompts/checklist-workflow/README.md`, potential template file under `.codex/scripts/templates/product-plan/checklist-template.yaml` or `.md`  
  Symbols/Endpoints: N/A  
  Tests: N/A  
  Acceptance: README describes fields (major tasks, subtasks, statuses, notes, code references), and a template artifact exists.  
  Branch/PR: `feat/codex-cli-checklist-workflow`  
  Commands: `git add . && git commit -m "docs(checklist-workflow): define checklist schema"`

- [x] **Subtask 4.C [PLAN]** — Specify how custom commands read/write checklist artifacts. (P2, M, [PLAN], (sequential-thinking))  
  - How `epic-plan-to-checklist` creates/updates; how `epic-execute-next-task` updates statuses/notes.

- [x] **Subtask 4.D [IMPLEMENT → 4.C]** — Capture checklist read/write behavior in README and inline prompt instructions. (P2, M, [IMPLEMENT], (sequential-thinking))  
  Files: `.codex/prompts/checklist-workflow/README.md`, each command `.md` file’s instruction section  
  Symbols/Endpoints: N/A  
  Tests: N/A  
  Acceptance: Each command file clearly states how it expects checklist artifacts to be located and updated.  
  Branch/PR: `feat/codex-cli-checklist-workflow`  
  Commands: `git add . && git commit -m "docs(checklist-workflow): document checklist read/write behavior"`

- [x] **Subtask 4.E [PLAN]** — Align checklist design with version control practices. (P2, S, [PLAN], (sequential-thinking))  
  - Decide how branch names, commits, and PR IDs are referenced from checklist items.

- [x] **Subtask 4.F [IMPLEMENT → 4.E]** — Add explicit fields for Branch/PR references in checklist schema and templates. (P2, S, [IMPLEMENT], (sequential-thinking))  
  Files: checklist template file(s) from 4.B, `.codex/prompts/checklist-workflow/README.md`  
  Symbols/Endpoints: N/A  
  Tests: N/A  
  Acceptance: Template includes Branch/PR fields and README explains how to keep them updated.  
  Branch/PR: `feat/codex-cli-checklist-workflow`  
  Commands: `git add . && git commit -m "docs(checklist-workflow): add branch/PR fields to checklist schema"`

---

### Major Task 5 — Implement custom prompt files and README (P1, L, [IMPLEMENT]/[DOC])

Context: This task turns the design into actual `.md` command files and README content in the repo.

- [x] **Subtask 5.A [PLAN]** — Finalize list of command files to implement and their filenames. (P1, S, [PLAN], (sequential-thinking))  
  - E.g., `epic-start.md`, `epic-plan-to-checklist.md`, `epic-execute-next-task.md`, `epic-review-checklist.md`, `epic-update-checklist.md`, `session-start.md`, `session-end.md`, `scratchpad-review-and-cleanup.md`.

- [x] **Subtask 5.B [IMPLEMENT → 5.A]** — Create stub `.md` files with ABOUTME headers and high-level structure. (P1, M, [IMPLEMENT], (serena))  
  Files: `.codex/prompts/checklist-workflow/*.md`  
  Symbols/Endpoints: N/A  
  Tests: N/A  
  Acceptance: All command files exist with correct ABOUTME comments and section headings.  
  Branch/PR: `feat/codex-cli-checklist-workflow`  
  Commands: `git add . && git commit -m "feat(checklist-workflow): scaffold command prompt files"`

- [x] **Subtask 5.C [IMPLEMENT]** — Implement `epic-start.md` with strong instructions for initial epic setup and branch hygiene. (P1, M, [IMPLEMENT], (sequential-thinking, serena))  
  Files: `.codex/prompts/checklist-workflow/epic-start.md`  
  Symbols/Endpoints: N/A  
  Tests: Manual validation via trial run (see Major Task 6).  
  Acceptance: Prompt guides agent to capture background, goals, constraints, repo scope, and branch; it instructs to use `sequential-thinking` and to persist decisions into checklist and README.  
  Branch/PR: `feat/codex-cli-checklist-workflow`  
  Commands: `git add . && git commit -m "feat(checklist-workflow): implement epic-start command"`

- [x] **Subtask 5.D [IMPLEMENT]** — Implement `epic-plan-to-checklist.md` to create/update the canonical checklist artifact. (P1, M, [IMPLEMENT], (sequential-thinking, serena))  
  Files: `.codex/prompts/checklist-workflow/epic-plan-to-checklist.md`  
  Symbols/Endpoints: N/A  
  Tests: Manual validation via trial run; confirm file structure matches schema from Major Task 4.  
  Acceptance: Prompt converts high-level plan into structured checklist with Major Tasks/Subtasks, tags, and Branch/PR references.  
  Branch/PR: `feat/codex-cli-checklist-workflow`  
  Commands: `git add . && git commit -m "feat(checklist-workflow): implement epic-plan-to-checklist command"`

- [x] **Subtask 5.E [IMPLEMENT]** — Implement `epic-execute-next-task.md` emphasizing execution over narration. (P1, L, [IMPLEMENT], (sequential-thinking, serena, context7))  
  Files: `.codex/prompts/checklist-workflow/epic-execute-next-task.md`  
  Symbols/Endpoints: N/A  
  Tests: Manual trial; ensure agent uses tools to edit files/run tests, falls back to narrating only when blocked.  
  Acceptance: Prompt explicitly instructs to select the next checklist item, plan it internally, perform file changes/tests, and update checklist and notes.  
  Branch/PR: `feat/codex-cli-checklist-workflow`  
  Commands: `git add . && git commit -m "feat(checklist-workflow): implement epic-execute-next-task command"`

- [x] **Subtask 5.F [IMPLEMENT]** — Implement review and session management commands (`epic-review-checklist`, `epic-update-checklist`, `session-start`, `session-end`). (P2, L, [IMPLEMENT], (sequential-thinking, serena))  
  Files: corresponding `.codex/prompts/checklist-workflow/*.md`  
  Symbols/Endpoints: N/A  
  Tests: Manual trial; confirm they summarize state, reconcile checklist vs code, and capture resume notes.  
  Acceptance: Commands operate on the same checklist artifact, reinforcing working memory continuity.  
  Branch/PR: `feat/codex-cli-checklist-workflow`  
  Commands: `git add . && git commit -m "feat(checklist-workflow): implement review and session commands"`

- [x] **Subtask 5.G [IMPLEMENT]** — Implement `scratchpad-review-and-cleanup.md` for artifact hygiene. (P3, M, [IMPLEMENT], (sequential-thinking))  
  Files: `.codex/prompts/checklist-workflow/scratchpad-review-and-cleanup.md`  
  Symbols/Endpoints: N/A  
  Tests: Manual trial; ensure it identifies scratchpads, classifies them, and emits commands for user to run for destructive actions.  
  Acceptance: Prompt clearly articulates how to find scratch files, decide whether to keep/promote/delete, and how to record outcomes.  
  Branch/PR: `feat/codex-cli-checklist-workflow`  
  Commands: `git add . && git commit -m "feat(checklist-workflow): implement scratchpad cleanup command"`

---

### Major Task 6 — Validate, iterate, and finalize the workflow (P1, M, [VALIDATE]/[PLAN]/[IMPLEMENT])

Context: This task ensures the workflow works in practice, addresses your pain points, and is iteratively refined.

- [x] **Subtask 6.A [PLAN]** — Define at least two realistic test scenarios (small epic, larger refactor epic with scratchpads). (P1, S, [PLAN], (sequential-thinking))  
  - Describe initial conditions, expected flows, and what success looks like in each scenario.

- [ ] **Subtask 6.B [IMPLEMENT → 6.A] [VALIDATE]** — Run scenario A (small epic over 2 sessions) using new commands. (P1, M, [VALIDATE], (sequential-thinking, serena))  
  Files: This checklist, scenario-specific checklist artifact, trial changes under a safe sample project or subdir  
  Symbols/Endpoints: N/A  
  Tests: `uv run pytest` (if sample code added), `uv run pre-commit run --all-files`  
  Acceptance: Scenario A completes with clear working memory continuity and minimal “describe-only” behavior; notes capture observed strengths/weaknesses. (Blocked in this environment; must be exercised via Codex CLI in a real project.)  
  Branch/PR: `feat/codex-cli-checklist-workflow`  
  Commands: see Validation Gate section for concrete commands

- [ ] **Subtask 6.C [IMPLEMENT → 6.A] [VALIDATE]** — Run scenario B (refactor epic with scratchpads). (P1, L, [VALIDATE], (sequential-thinking, serena))  
  Files: scenario refactor branch, associated scratch files/directories  
  Symbols/Endpoints: N/A  
  Tests: As above; validate both refactor behavior and scratchpad cleanup prompt.  
  Acceptance: Scratchpad lifecycle is handled as designed; no unintentional residue remains; working memory remains coherent. (Blocked in this environment; must be exercised via Codex CLI in a real project.)  
  Branch/PR: `feat/codex-cli-checklist-workflow`  
  Commands: see Validation Gate

- [ ] **Subtask 6.D [RESEARCH]** — Analyze outcomes of scenarios against success metrics. (P2, M, [RESEARCH], (sequential-thinking))  
  - Note places where prompts still over-narrate, skip updating checklist, or mishandle errors.

- [ ] **Subtask 6.E [IMPLEMENT → 6.D]** — Refine prompts and README based on validation findings. (P2, L, [IMPLEMENT], (sequential-thinking, serena))  
  Files: `.codex/prompts/checklist-workflow/*.md`, `.codex/prompts/checklist-workflow/README.md`  
  Symbols/Endpoints: N/A  
  Tests: Re-run key parts of scenarios A/B or at least spot checks on weak areas.  
  Acceptance: Updated prompts reduce observed issues; README’s guidance aligns with actual behavior.  
  Branch/PR: `feat/codex-cli-checklist-workflow`  
  Commands: `git add . && git commit -m "refactor(checklist-workflow): refine prompts after validation"`

- [x] **Subtask 6.F [IMPLEMENT] [DOC]** — Finalize README with usage sequences and examples. (P2, M, [IMPLEMENT]/[DOC], (sequential-thinking))  
  Files: `.codex/prompts/checklist-workflow/README.md`  
  Symbols/Endpoints: N/A  
  Tests: N/A  
  Acceptance: README documents preferred sequences (new epic, ongoing epic, closing epic), version control guidance, error handling patterns, and illustrative examples.  
  Branch/PR: `feat/codex-cli-checklist-workflow`  
  Commands: `git add . && git commit -m "docs(checklist-workflow): finalize usage guide"`

- [ ] **Subtask 6.G [VALIDATE]** — Run final Validation Gate (see section 7) before merging. (P1, S, [VALIDATE], (sequential-thinking))  
  Files: N/A  
  Symbols/Endpoints: N/A  
  Tests: As defined in Validation Gate table.  
  Acceptance: All checks pass or have documented exceptions with rationale.

---

## 4. Notes & Learnings

Use this section to record dated observations, decisions, and constraints as you work.

- 2025-11-22 — Initial checklist created to guide design/implementation of Codex CLI checklist workflow.  
- 2025-11-22 — Observed need to balance first-principles design with existing repo norms (AGENTS, .codex structure).  
- 2025-11-22 — Attempted web search for agentic coding CLI best practices; major search engines responded with bot challenges, so external materials were not directly retrievable. Synthesized external best practices section in README from existing knowledge of modern coding CLIs instead.  
- 2025-11-22 — Derived version control best practices for checklists (branch strategy, linking tasks to commits/PRs, commit cadence, and merge readiness checks) and captured them in the README’s “Version Control Best Practices for Checklists” section.  
- 2025-11-22 — Defined scratchpad lifecycle conventions: use `scratchpaper/` (and subdirectories like `scratchpaper/task_checklists/`) for ephemeral artifacts, promote long-lived content into `.codex/scripts` or `docs/`, and rely on a dedicated scratchpad-review command plus explicit user-approved cleanup commands.  
- 2025-11-22 — Synthesized design implications from research (checklist as primary working memory, plan–execute coupling, session-oriented flow, integrated version control practices, scratchpad hygiene, and explicit error-handling patterns) and captured them in the README’s “Design Implications from Research” subsection.  
- 2025-11-22 — Finalized canonical checklist artifact format and integration: checklists live under `scratchpaper/task_checklists/` with a standard Markdown structure, integrate with `.codex/scripts` epics via references, and are updated by commands that make targeted edits while preserving structure and ABOUTME headers.  
- 2025-11-22 — Defined two validation scenarios (small epic over two sessions, refactor epic with scratchpads) and documented them in the README’s Validation & Example Flows section; actual trial runs remain to be performed in a real project context.  
- (Add new entries as work progresses.)

---

## 4. Planning and Sequential Thinking

For non-trivial subtasks (especially [PLAN]/[RESEARCH]/[IMPLEMENT]), use the **Sequential Thinking MCP** server to externalize reasoning:

1. **Decompose the goal** — Break the subtask into atomic steps (e.g., analyze AGENTS, design phases, map to commands).  
2. **Reflect on dependencies** — Identify prerequisites (e.g., branch creation, checklist schema) and capture them as subtasks.  
3. **Assess alternatives** — Consider multiple ways to structure commands, schemas, or MCP usage, and document trade-offs.  
4. **Simulate outcomes** — Mentally walk through how a user (you) would actually use the workflow in multiple sessions.  
5. **Reassess the plan** — Update this checklist and README if sequence or coverage is incomplete before implementing.

Record key reflections and decisions in **Notes & Learnings** with timestamps.

---

## 5. Code Awareness and Semantic Precision

Use the **Serena MCP** server to:

- Navigate the repo symbolically when you design how prompts interact with code (e.g., locating `.codex` scripts and templates).  
- Plan and apply structured edits to prompt files, ensuring consistency with existing style and organization.  
- Confirm that references in prompts (file paths, command patterns) match real files and commands.

When significant `serena` queries yield important insights, document:

- What you looked up (e.g., existing prompt naming conventions).  
- What you learned (e.g., standard directory layout, ABOUTME usage).  
- How it affected your design (e.g., aligning new prompts with existing naming).

Log these under **Notes & Learnings**.

---

## 6. Contextual Grounding

Use the **Context7 MCP** server whenever implementation decisions depend on external or versioned dependencies (e.g., libraries used in target projects where this workflow is applied):

- Record library/version and relevant APIs (e.g., `uv`, testing frameworks, formatting tools).  
- Summarize how the retrieved docs inform your prompt design (e.g., preferred test commands, build steps).  
- Note any corrections when initial assumptions about APIs or tools were wrong.

Add short entries under Notes titled **“Context7 lookup summary”** for traceability.

---

## 7. Validation Gate

Before considering the workflow “ready,” apply a validation gate tailored to this repo:

| Category            | Check                                                            | Description                                           |
| ------------------- | ---------------------------------------------------------------- | ----------------------------------------------------- |
| Command Summary     | `uv run pre-commit run --all-files`                             | Ensure formatting, linting, and basic checks pass.    |
| Validation Script   | `uv run pytest` (or targeted tests if applicable)               | Confirm that any sample code/tests used in scenarios behave as expected. |
| Workflow Trial      | Run scenarios A and B from Major Task 6 using new commands      | Validate that the workflow works in practice.         |
| Observations        | Log outcomes, unexpected behavior, and environment issues       | Capture in Notes & Learnings.                         |
| Artifacts           | Record branch/commit/PR IDs tied to validation runs             | Preserve traceability.                                |
| Date & Outcome      | Record date and pass/fail verdict with rationale                | Use for future revisions.                             |

**Rule:** Do not move to merging or broad adoption until failed checks are remediated and documented.

---

## 8. Quality Standards (“Definition of Done”)

This checklist and workflow are considered complete when:

- The file adheres to the structural format described here.  
- Each Major Task contains enough subtasks (5+ each) to cover the full planning, research, implementation, and validation scope—no gaps.  
- Research/planning items are paired with concrete execution items that modify code/docs/tests in this repo.  
- There is at least one meaningful code/doc change per Major Task once beyond initial discovery, with associated commits/PRs referenced.  
- Notes & Learnings contain dated entries showing reasoning continuity over days/sessions.  
- Validation Gate results are fully recorded with dates and outcomes.

---

## 9. Kickoff Protocol

At the start of each new working day/cycle:

1. Identify top 3 tasks from this checklist (as done in the Daily Kickoff above).  
2. Ensure at least one is `[IMPLEMENT]` or `[VALIDATE]` and will change code/tests or docs.  
3. Briefly justify ordering in Daily Kickoff section.  
4. Confirm that each chosen task has clear prerequisites satisfied; if not, adjust selection.  
5. Update statuses of previously open items before beginning new work.

---

## 10. Execution and Continuous Refinement

Each session:

- Review prior Notes & Learnings and checklist statuses.  
- Use `sequential-thinking` to plan the next subtask when non-trivial.  
- After completing a subtask:
  - Mark it `[x]` and add a closure note (especially for [IMPLEMENT]/[VALIDATE]) referencing commits/PRs or key artifacts.  
  - If you discover new tasks, add them with appropriate prefixes and tags, ensuring research→action pairing.

Aim per session:

- At least one `[IMPLEMENT]` or `[VALIDATE]` subtask completed that changes code/docs/tests, except in early discovery where a major `[PLAN]/[RESEARCH]` that unlocks execution next is acceptable and explicitly flagged.

---

## 11. Meta-Reflection and Iteration

End every session by capturing:

1. Which assumptions you validated or invalidated.  
2. Which dependencies appeared unexpectedly.  
3. The single highest-leverage next step for the next session.  
4. Any areas where articulation was weak and needs tightening in the upcoming work.

Record these under Notes & Learnings with the current date.

---

## 11. Ask Questions When You Are Uncertain

If any aspect of the context, repo constraints, desired behavior, or success criteria feels unclear:

- Stop adding or executing tasks.  
- Formulate concrete questions for the user about missing details, trade-offs, or preferences (e.g., exact command names, directory choices, branch naming conventions).  
- Resume planning/execution only after responses clarify the ambiguity sufficiently to maintain plan quality.

---

## 12. Research→Action Pairing (Mandatory)

For every `[PLAN]` or `[RESEARCH]` subtask, ensure a paired `[IMPLEMENT]` (and, when appropriate, `[VALIDATE]`) subtask exists within the same Major Task:

- Use explicit references in `[IMPLEMENT]` descriptions (e.g., “Exec for 2.A [RESEARCH] …”).  
- Define:
  - **Input** — which research notes, decisions, or specs are being applied.  
  - **Action** — concrete code/doc/test changes.  
  - **Output** — verifiable artifacts (files changed, tests added, PR opened, etc.).

Treat the micro-template for `[IMPLEMENT]` items as mandatory:

- Files: relevant paths (prompt files, README, templates, tests).  
- Symbols/Endpoints: functions/classes/prompts affected (if applicable).  
- Tests: which tests to run/add.  
- Acceptance: how you will decide the subtask is “done.”  
- Branch/PR: working branch and eventual PR link/ID.  
- Commands: exact commands to run (formatted so they can be copy-pasted).

A research/planning item is not truly “done” until its paired execution item is also complete.

---

## 13. Task & Subtask Naming Conventions

- Major Tasks: `**Major Task N — <short verb phrase>** (tags)`  
- Subtasks: `Subtask N.X [PREFIX] — <clear action/result> (tags)`  

Tags:

- Priority `(P1|P2|P3)`  
- Complexity `(S|M|L)`  
- Phase `([PLAN]/[RESEARCH]/[IMPLEMENT]/[VALIDATE]/[DOC])`  
- Tool context `(serena|context7|sequential-thinking)` as appropriate.

Maintain ID stability; when refining descriptions, keep the IDs and prefixes, updating only the text.

---

## 14. Properly Mitigating Network Access Issues, Permission Issues, or Commands that Timeout

When a needed command cannot be run due to network restrictions, permissions, or timeouts:

- Immediately stop automated retries.  
- Emit a concise, copy-pastable list of commands for the user to run in a separate terminal, with:
  - Purpose of each command.  
  - Expected runtime behavior.  
  - What outputs/logs the agent needs back.  
- Mark the relevant subtask as `blocked` in this checklist with a note describing:
  - Blocker type (network, permissions, timeout).  
  - Commands provided to the user.  
  - What information is required to resume.

After the user reports completion and shares logs, resume the subtask or its successor, updating Notes & Learnings accordingly.

---

### ✅ Guiding Mantra

> “A weak plan executed perfectly still fails.  
> A strong plan, documented completely, never loses its path.”
