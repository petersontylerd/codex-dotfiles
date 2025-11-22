ABOUTME: README for Codex CLI checklist-workflow prompts.
ABOUTME: Documents problem, scope, and usage patterns.

# Codex CLI Checklist Workflow

## 1. Problem & Scope

### 1.1 Problem Statement

Agentic coding workflows for multi-session epics and features currently rely on ad-hoc prompts and ephemeral context. This leads to:

- Inconsistent or shallow planning that is not captured in durable artifacts.
- Checklists that are either missing, incomplete, or not tightly coupled to actual code and test changes.
- A tendency for the agent to describe what it would do instead of actually executing changes and running tools.
- Scratchpad and temporary files accumulating without a clear lifecycle or cleanup strategy.
- Friction and stalls when commands fail due to network restrictions, permissions, or timeouts, forcing manual recovery.

The net effect is that it is too easy to lose context across sessions, skip critical steps, or degrade quality when working on longer-running epics.

### 1.2 Goal

Design and implement a Codex CLI–driven checklist workflow that acts as robust working memory for epics and features, enabling multi-session, multi-day development without context loss, while encoding best practices for planning, execution, validation, and hygiene directly into custom commands and documentation.

### 1.3 In Scope

The checklist workflow covers:

- A canonical way to represent epics/features as checklists with Major Tasks and Subtasks, including status, notes, and code/test references.
- A set of Codex CLI custom commands under `.codex/prompts/checklist-workflow/` that:
  - Help initialize an epic (capture goals, constraints, repo scope, and branch).
  - Turn plans into structured checklists stored in the repo.
  - Drive execution of checklist items with a strong bias toward actually editing files and running commands.
  - Periodically review and refine the checklist against the codebase.
  - Manage session start/end summaries so work can resume smoothly across days.
  - Review and clean up scratchpad and temporary artifacts in a controlled way.
- Integration of MCP servers (`sequential-thinking`, `serena`, `context7`) into the workflow so that planning, code navigation/edits, and external documentation lookups follow repeatable patterns.
- Version control guidance tightly coupled to checklist usage (branching, commit cadence, PR/merge, and branch cleanup).

### 1.4 Out of Scope

The checklist workflow does **not** attempt to:

- Automate or enforce project-specific CI/CD pipelines beyond documenting recommended commands to run.
- Replace all existing `.codex/prompts` files or planning artifacts; it complements them and may gradually supersede some.
- Implement language- or framework-specific workflows beyond what is compatible with the repository-wide conventions and docs.
- Automatically run `git` operations in a way that bypasses your judgment; instead, it will propose commands and patterns for you to apply.
- Solve every possible multi-repo or polyglot use case; the focus is on this repo's conventions and Codex CLI usage, with patterns that should generalize.

### 1.5 Success Criteria

The workflow is considered successful if, in regular use:

- Epics and features are consistently represented as durable checklists that act as working memory across 2–3+ sessions without context loss.
- Planning and research tasks are always paired with concrete implementation and validation tasks that change code, tests, or documentation.
- The new `checklist-workflow` commands significantly reduce the need for you to nudge the agent to "Execute" instead of merely describing actions.
- Scratchpad and temporary artifacts follow clear naming, location, and lifecycle conventions, with regular review and cleanup.
- When commands are blocked by network, permissions, or timeouts, the prompts reliably cause the agent to stop, emit explicit commands for you to run, and resume once results are provided.
- The prompts and README remain maintainable: they are grounded in first principles, aligned with AGENTS and `.codex` conventions, and easy to extend as new best practices emerge.

## 2. Repository Constraints & Conventions

This checklist workflow must respect and reinforce the repository-wide guidance in `AGENTS.md`, `MASTER_AGENTS.md`, and `.codex/docs`.

### 2.1 Global Behavior & Collaboration

- Treat Codex as an experienced, pragmatic software engineer: prefer simple, clean solutions over clever ones.
- Always ask for clarification rather than making assumptions; stop and ask for help when stuck.
- Never be sycophantic or falsely agreeable; provide honest technical judgment, especially when disagreeing.
- Long-running tooling (tests, docker compose, migrations, etc.) must always be invoked with sensible timeouts or non-interactive batch modes; never leave a command waiting indefinitely.

### 2.2 Naming, Comments, and File Headers

- All files must start with a two-line `ABOUTME:` comment explaining their current purpose, except where doing so would break file syntax.
- Names must describe what code or prompts do **now** (no “new/old/legacy/improved” temporal qualifiers).
- Do not remove existing comments unless they are provably false; comments describe the current state, not history.
- Follow language-appropriate naming conventions (snake_case, camelCase, PascalCase) and mirror existing `.codex` naming patterns (e.g., `product-plan-*`, `skunkworx-*`).

### 2.3 Testing and TDD Expectations

- TDD is the primary development methodology: write tests before implementation where applicable.
- All projects must have unit, integration, and end-to-end tests; test failures are your responsibility.
- Use `pytest` as the primary test runner for Python code, following the standards in `.codex/docs/using-tdd.md`.
- Never mock the system under test; use real data and real APIs or realistic test environments where possible.
- For any Python modules or scripts added to support this workflow, plan to add corresponding tests under `tests/` and run `uv run pytest` as part of validation.

### 2.4 Tooling, Style, and Environment

- Python version: target >=3.11 (per `.codex/docs/using-python.md`), with `uv` as the required package manager; never use `pip`, `venv`, or poetry directly.
- Use `ruff` for formatting and linting, and `mypy` (with strict settings) for type checking where Python code is involved.
- Use `uv sync` to install/update dependencies, `uv run pytest` for tests, `uv run ruff format .` and `uv run ruff check .` for formatting and linting, and `uv run mypy src/` for type checking.
- When this workflow recommends or emits commands, prefer these standards so they align with the rest of the repo.

### 2.5 Planning Artifacts and `.codex` Structure

- Planning artifacts for product work live under `.codex/scripts`, organized into `development/epic-*` directories with nested feature and user-story YAML files.
- Shared reference docs, including language playbooks, live under `.codex/docs`.
- When creating new planning-related artifacts (e.g., epic checklists that must live beyond scratchpads), prefer using `templates/product-plan` skeletons and `.codex/scripts` conventions where appropriate.
- The `checklist-workflow` prompts should integrate with this structure rather than inventing parallel, conflicting patterns.

### 2.6 Scratchpads and `scratchpaper/` Conventions

- Use the `scratchpaper/` directory for truly temporary or exploratory artifacts:
  - Keep checklist files under `scratchpaper/task_checklists/` following the naming convention `<YYYY-MM-DD>–<project-or-feature-name>–checklist.md`.
  - Use additional subdirectories (e.g., `scratchpaper/spikes/`, `scratchpaper/notes/`) as needed for other scratch materials.
- Treat `scratchpaper/*` as **ephemeral working surfaces**:
  - Content here is allowed to be rough, iterative, and disposable.
  - Anything that becomes long-lived or project-critical should be promoted into a stable location under `.codex/scripts`, `docs/`, or the codebase itself.
- The checklist workflow should:
  - Explicitly record when scratch files are created and why.
  - Periodically review scratch artifacts, classifying them as “promote”, “keep as scratch”, or “delete”.
  - Emit clear, non-destructive commands for deletion or moves so you remain in control of cleanup.

### 2.6 Version Control Practices

- Always use feature branches such as `feat/<slug>`, `fix/<slug>`, or `chore/<slug>` for work on this workflow.
- Create PRs for all changes, with atomic commits of the form `type(scope): description` (e.g., `feat(checklist-workflow): implement epic-start command`).
- Run `uv run pre-commit run --all-files` before committing or opening PRs; never bypass hooks with `--no-verify`, `--no-hooks`, or similar flags.
- Before running `git add -A`, inspect the working tree with `git status`; never make large, blind staging operations.
- When the workflow suggests `git` commands, it must respect these patterns and leave final decision/execution to you.

### 2.7 MCP Usage Expectations

- Use the MCP servers provided by this repo as first-class tools:
  - `sequential-thinking` for stepwise planning and reflective reasoning.
  - `filesystem` for structured file operations within the sandboxed workspace.
  - `serena` for semantic, symbol-level navigation and precise edits in the codebase.
  - `context7` for retrieving version-specific documentation and code examples for external libraries.
  - Additional MCPs (e.g., `figma`, `playwright`, domain-specific `serena` instances) may be used when relevant but should not be hard-wired into this workflow unless necessary.
- The `checklist-workflow` prompts should explicitly instruct when and how to use these tools so that agent behavior remains predictable and aligned with repo expectations.

### 2.8 Checklist Artifact Format & Location

- **Primary working-memory artifact**  
  - Epic/feature work is tracked in Markdown checklist files under `scratchpaper/task_checklists/`.  
  - Use the naming convention `<YYYY-MM-DD>–<project-or-feature-name>–checklist.md` (e.g., `2025-11-22–codex-cli-checklist-workflow–checklist.md`).

- **Core structure**  
  - Each checklist file should follow the high-level structure defined in `create-detailed-checklist.md`, including:
    - Title: `<Project Name> — Comprehensive Task Checklist`.
    - Daily Kickoff section.
    - Sections for North Star/Goals, Key Principles, Sequential Task Breakdown, Notes & Learnings, Validation Gate, Definition of Done, Kickoff Protocol, Execution & Refinement, Meta-Reflection, and Research→Action pairing.
  - Within Sequential Task Breakdown:
    - Represent Major Tasks as top-level items with context and scope.
    - Represent Subtasks as nested items with prefixes `[PLAN]`, `[RESEARCH]`, `[IMPLEMENT]`, `[VALIDATE]`, `[DOC]` and tags for priority, complexity, and tool context.

- **Integration with `.codex/scripts` planning artifacts**  
  - Where applicable, include references from checklist files to product-plan epics (e.g., IDs or paths under `.codex/scripts/development/epic-*`).  
  - Use Notes & Learnings to link decisions and implementation steps back to the relevant YAML artifacts.

- **Read/write expectations for commands**  
  - Commands such as `epic-plan-to-checklist`, `epic-execute-next-task`, `epic-review-checklist`, and `epic-update-checklist` should:
    - Operate on an existing checklist file when one is provided or discoverable.  
    - Avoid creating duplicate checklists for the same epic unless explicitly instructed.  
    - Update only the relevant sections (task statuses, Notes & Learnings, Validation Gate entries) without rewriting the entire file unnecessarily.  
    - Preserve the ABOUTME header and overall structure while appending or editing content.

- **Version control considerations**  
  - Treat checklist files as part of the epic’s branch history:
    - Commit meaningful updates (e.g., major structural changes or significant progress) alongside code and test changes.  
    - Use Branch/PR fields in `[IMPLEMENT]` subtasks to tie tasks to specific commits or PRs where helpful.

## 3. External Best Practices Overview

Across modern agentic coding CLIs (for example, Codex CLI–style tools, Claude Code, Gemini-based CLIs, and similar systems), several recurring patterns and lessons shape effective workflows. This section distills those patterns into guidance that informs the `checklist-workflow` design.

### 3.1 Planning vs Execution

- Separate **planning** from **execution**, but keep them tightly coupled:
  - Use dedicated flows or commands for “plan first, then act”, rather than mixing both in a single uncontrolled prompt.
  - Capture plans in durable artifacts (checklists, specs, notes) that live alongside the code, not only in transient chat history.
- Bias the agent toward **action** once planning is sufficient:
  - Prompts should explicitly instruct the agent to prefer making concrete changes (file edits, tests, commands) over narrating hypothetical steps.
  - “Plan-only” behavior should be opt-in, not the default, and should still end with specific, actionable next steps.

### 3.2 Persistent Working Memory and Checklists

- Represent multi-step work as a **structured checklist**:
  - Use hierarchy (epic → major tasks → subtasks) with explicit statuses.
  - Include references to code paths, tests, and validation commands wherever possible.
- Keep the checklist file in the repo, not only in scratch terminals:
  - This allows any future agent or human to resume work with full context.
  - Treat the checklist as the primary working-memory artifact for the epic.
- Regularly reconcile the checklist with the actual codebase:
  - After meaningful changes, update statuses, notes, and references.
  - Avoid letting the checklist drift out of sync with reality.

### 3.3 Session Management and Resumption

- Introduce explicit **session start** and **session end** rituals:
  - At session start, summarize current status, branch, and next recommended tasks.
  - At session end, record what was achieved, outstanding issues, and where to resume.
- Encourage small, well-defined **work chunks**:
  - Each session should aim to complete at least one implementation or validation subtask.
  - Avoid sprawling, unbounded “do everything” sessions; they are hard to resume safely.

### 3.4 Version Control Integration

- Treat **feature branches** as first-class parts of the workflow:
  - Start epic work on a dedicated branch with a meaningful name.
  - Encourage frequent, atomic commits with clear messages tied to checklist items.
- Have the agent **propose** `git` commands rather than running them blindly:
  - This mirrors patterns in many CLIs that surface suggested commands for humans to execute.
  - It avoids accidental destructive actions while still providing guidance.
- Tie checklist items to commits/PRs where feasible:
  - For significant `[IMPLEMENT]` items, record commit hashes or PR IDs in the checklist.

### 3.5 Scratchpads and Temporary Artifacts

- Use dedicated directories or naming conventions for scratch work:
  - Many tools encourage keeping scratch files in a `scratch/` or `.tmp/` area, or naming them with a clear suffix (e.g., `_scratch`).
  - This makes them easy to discover and clean.
- Distinguish between **ephemeral** and **promotable** scratch content:
  - Some scratch work should graduate into proper documentation, tests, or code comments.
  - Other scratch artifacts should be deleted once their purpose has been served.
- Build **cleanup rituals** into the workflow:
  - Periodically review scratchpads, decide what to keep, promote, or delete, and record decisions.

### 3.6 Error Handling and Environment Constraints

- When commands fail due to environment constraints (network, permissions, timeouts):
  - Stop retrying automatically; instead, surface the failure clearly.
  - Emit a list of copy-pastable commands for the user to run manually, along with what output is needed.
- Treat “blocked by environment” as a **first-class status**:
  - Mark the relevant checklist items as blocked with a short explanation and expectations for resuming.
  - Resume once the user provides the requested information or confirms resolution.
- Prefer **idempotent, inspectable commands**:
  - Many CLIs recommend using commands that are safe to re-run and that print enough logs for downstream reasoning.

### 3.7 Prompt Shape and Interaction Style

- Use **structured prompts** with clear sections (context, goals, constraints, tools, steps) rather than monolithic paragraphs.
- Encourage the agent to:
  - Ask targeted clarification questions when context is missing or ambiguous.
  - Make its reasoning and decisions explicit, but keep that reasoning focused on what is actionable.
- Avoid “fire-and-forget” behavior:
  - Each significant task should follow a micro-cycle of clarify → plan → execute → validate → summarize → propose next.

### 3.8 Design Implications from Research

The patterns above directly shape the design of this checklist workflow:

- **Checklist as primary working memory**  
  - Epic work is always anchored to a durable checklist artifact in the repo, not just transient chat history.  
  - Checklists reference code paths, tests, and validation commands, and are updated after meaningful changes.

- **Plan–execute coupling**  
  - Prompts encourage explicit planning (via `sequential-thinking`) but require paired `[IMPLEMENT]` and `[VALIDATE]` subtasks that change code/docs/tests.  
  - “Plan-only” modes are supported but must end with concrete next actions that can be executed in follow-up steps.

- **Session-oriented workflow**  
  - Dedicated commands handle session start/end, ensuring that each session begins with context (branch, open tasks) and ends with a clear resume point.  
  - This reduces the cost of resuming epics after pauses or model restarts.

- **Version control integrated into planning**  
  - Branch creation, commit cadence, and merge readiness are treated as part of the epic plan, not an afterthought.  
  - Checklist items capture Branch/PR references where appropriate, improving traceability.

- **Scratchpad hygiene built-in**  
  - Scratch work is deliberately placed under `scratchpaper/` and reviewed periodically.  
  - The workflow includes a dedicated scratchpad-review command that proposes non-destructive cleanup actions for you to execute.

- **Error handling as a first-class concern**  
  - When blocked by environment constraints (network, permissions, timeouts), prompts instruct the agent to stop, surface the issue, and emit copy-pastable commands for you.  
  - Blocked items are recorded explicitly in checklists and resumed once information is available.

These implications ensure the workflow is opinionated enough to prevent common failure modes while remaining flexible for different epics and codebases.

## 4. Version Control Best Practices for Checklists

This section focuses specifically on how version control practices should interact with epic checklists in this workflow.

### 4.1 Branch Strategy for Epics

- Create a dedicated feature branch for each epic or major feature:
  - Use names like `feat/<epic-slug>` or `fix/<issue-slug>` consistent with `AGENTS.md`.
  - Start epic planning and checklist creation on that branch so documentation and code evolve together.
- Keep changes scoped:
  - Avoid mixing unrelated work on the same branch; if the checklist reveals a new epic, create a separate branch for it.

### 4.2 Linking Checklist Items to Commits and PRs

- For each substantial `[IMPLEMENT]` subtask:
  - Reference the relevant branch name and, once available, commit hashes or PR IDs.
  - Use the checklist’s “Branch/PR” field to keep these references close to the task description.
- When merging:
  - Ensure all Major Tasks related to the epic’s branch are either complete or explicitly documented as deferred before merging to the main branch.

### 4.3 Commit Style and Cadence

- Follow the commit style from `AGENTS.md`:
  - `type(scope): description` (e.g., `feat(checklist-workflow): implement epic-start command`).
- Aim for **atomic commits**:
  - Each commit should correspond to one or a small cluster of checklist subtasks.
  - Avoid commits that blend planning artifacts, prompt changes, and unrelated refactors without clear rationale.
- Encourage a steady commit cadence:
  - Commit after completing meaningful pieces of work (e.g., finishing a prompt file, adding a validation scenario) rather than after every minor edit.

### 4.4 Git Commands and Automation Boundaries

- Prompts in this workflow should **propose** `git` commands rather than executing them automatically:
  - Example: `git checkout -b feat/codex-cli-checklist-workflow`, `git status`, `git add .`, `git commit -m "feat(checklist-workflow): scaffold command prompt files"`.
  - This keeps you in control of staging, committing, and pushing changes.
- Never bypass pre-commit hooks:
  - Do not suggest `--no-verify` or similar flags.
  - Instead, surface hook failures and help identify root causes, then rerun `uv run pre-commit run --all-files`.

### 4.5 Checklist-Driven Merge Readiness

- Before merging an epic branch:
  - Use the checklist to verify that:
    - All required `[IMPLEMENT]` and `[VALIDATE]` items are complete or explicitly documented as intentionally deferred.
    - Validation commands (tests, linting, type checks) have been run and recorded.
  - Add a short “Merge Readiness” note in the checklist summarizing:
    - Which Major Tasks are complete.
    - What validation was performed.
    - Any known trade-offs or follow-up work.

These practices ensure that checklists are not just planning documents but are tightly coupled to version control history and merge decisions.

## 5. Epic Lifecycle

This workflow models epic/feature work as a sequence of well-defined phases. Each phase has corresponding checklist items and supporting commands.

### 5.1 Epic Initialization

- Capture background, goals, constraints, and scope for the epic or feature.
- Identify relevant repositories, directories, and technologies involved.
- Establish non-negotiable rules (e.g., directory restrictions, testing expectations).
- Create or select a dedicated feature branch for the epic.
- Initial output:
  - An epic description (often in a planning artifact under `.codex/scripts`).
  - A new or updated checklist file representing the epic.

### 5.2 Planning and Checklist Creation

- Decompose the epic into Major Tasks and Subtasks with clear outcomes.
- Balance `[PLAN]/[RESEARCH]` and `[IMPLEMENT]/[VALIDATE]` across each Major Task.
- Link tasks to expected code paths, tests, and validation commands.
- Persist the plan and checklist structure to disk so it can be resumed later.

### 5.3 Execution Loop

- Iteratively pick the next highest-value checklist item.
- For each item:
  - Clarify the task and confirm definition of done.
  - Use `sequential-thinking` to create a micro-plan.
  - Execute edits and commands using `serena`, `filesystem`, and other tools.
  - Run targeted tests and validation commands.
  - Update checklist status, notes, and references.
- Repeat until the epic’s functional objectives are met.

### 5.4 Review and Refinement

- Periodically review the checklist and codebase for alignment.
- Adjust task breakdown, priorities, and scope as new information emerges.
- Capture decisions, risks, and trade-offs in Notes & Learnings.
- Ensure completed tasks genuinely correspond to implemented and validated behavior.

### 5.5 Session Management

- At session start:
  - Summarize current epic status, branch, and open tasks.
  - Choose a small set of high-leverage tasks for the session.
- At session end:
  - Summarize what was done and what remains.
  - Record a clear “resume here next” pointer.
  - Optionally suggest commits and branch actions (without executing them).

### 5.6 Closure and Hygiene

- Confirm all critical `[IMPLEMENT]` and `[VALIDATE]` tasks are complete.
- Run the full Validation Gate for the epic.
- Review and handle scratchpads:
  - Promote valuable content, delete or archive the rest.
- Capture a final summary:
  - What was delivered.
  - Validation performed.
  - Known follow-ups or future epics.

## 6. Command Reference Overview

This section summarizes each `checklist-workflow` command and how it fits into the epic lifecycle.

- `epic-start`  
  - **Phase:** Epic Initialization  
  - **Purpose:** Capture epic context (goals, constraints, scope, repo paths, branch) and initial high-level plan.  
  - **Typical Use:** Run once per epic at the beginning, or when revisiting an existing epic to refresh context.

- `epic-plan-to-checklist`  
  - **Phase:** Planning and Checklist Creation  
  - **Purpose:** Convert a high-level plan into a structured checklist artifact (Major Tasks/Subtasks, tags, references).  
  - **Typical Use:** After `epic-start`, and whenever the plan needs structural updates.

- `epic-execute-next-task`  
  - **Phase:** Execution Loop  
  - **Purpose:** Select and execute the next checklist item with a strong bias toward making actual changes and running validations.  
  - **Typical Use:** Main workhorse during execution; invoked repeatedly to progress through the checklist.

- `epic-review-checklist`  
  - **Phase:** Review and Refinement  
  - **Purpose:** Reconcile checklist state with the codebase, adjust statuses, and capture decisions.  
  - **Typical Use:** Periodically (e.g., after several tasks or at session boundaries).

- `epic-update-checklist`  
  - **Phase:** Planning and Checklist Creation / Review and Refinement  
  - **Purpose:** Perform focused edits to the checklist structure (add/split tasks, retag items, adjust priorities).  
  - **Typical Use:** When understanding changes or scope shifts require restructuring the checklist.

- `session-start`  
  - **Phase:** Session Management  
  - **Purpose:** Summarize current status, branch, and open tasks; propose top-priority tasks for this session.  
  - **Typical Use:** At the beginning of a working session.

- `session-end`  
  - **Phase:** Session Management  
  - **Purpose:** Summarize progress, update checklist, and record resume instructions for the next session.  
  - **Typical Use:** At the end of a working session.

- `scratchpad-review-and-cleanup`  
  - **Phase:** Closure and Hygiene / Review and Refinement  
  - **Purpose:** Discover scratchpad artifacts, decide which to promote/keep/delete, and emit safe cleanup commands.  
  - **Typical Use:** Near the end of an epic or after exploratory spikes that generated many scratch files.

## 7. MCP Usage Patterns

This section describes how `sequential-thinking`, `serena`, `filesystem`, and `context7` are expected to be used across commands.

### 7.1 `sequential-thinking`

- Use for internal planning and reflective reasoning in non-trivial tasks.  
- Typical responsibilities:
  - Decompose tasks into micro-steps before execution.
  - Reassess plans when new information appears.
  - Summarize reasoning that should be reflected in Notes & Learnings.
- Commands that should routinely use it:
  - `epic-start`, `epic-plan-to-checklist`, `epic-execute-next-task`, `epic-review-checklist`, `session-start`, `session-end`.

### 7.2 `serena`

- Use for semantic code navigation and structured edits:
  - Find relevant symbols, files, and references.
  - Plan and apply precise changes to prompts, scripts, or other code.  
- Particularly important when:
  - Updating existing `.codex/prompts` files.
  - Integrating checklist behavior with `.codex/scripts` planning artifacts.

### 7.3 `filesystem`

- Use for file operations within the allowed workspace:
  - Creating, updating, or moving checklist files and scratchpads.
  - Reading artifacts needed for planning or execution.
- Should be guided by the scratchpad and planning conventions described earlier.

### 7.4 `context7`

- Use when external or version-specific documentation is needed:
  - Library APIs, CLI tools, framework behavior.  
- Record `context7` lookups in Notes & Learnings with short summaries of what was learned and how it affects implementation decisions.

### 7.5 Other MCPs

- `figma`, `playwright`, domain-specific `serena` instances, and others may be used when relevant.  
- The `checklist-workflow` itself does not hard-code their use, but commands may suggest them when epics involve design systems or browser-based flows.

## 8. Behavioral Guardrails

This workflow encodes explicit guardrails to prevent common failure modes.

### 8.1 Execute vs Describe

- `epic-execute-next-task` and related commands:
  - Must attempt to perform actual edits and run validation commands when feasible.  
  - Should only fall back to pure narration when blocked by environment constraints or explicit user instruction.
- Responses that only say “what I would do next” without acting should be treated as incomplete unless explicitly requested.

### 8.2 Version Control Discipline

- All guidance must respect `AGENTS.md`:
  - Use feature branches, atomic commits, and pre-commit hooks.  
- Prompts should:
  - Propose `git` commands, not execute them blindly.  
  - Never suggest bypassing pre-commit hooks.

### 8.3 Scratchpad Hygiene

- Scratchpads live under `scratchpaper/` and are explicitly reviewed:
  - Avoid leaving behind unexplained temporary files at the end of an epic.  
- `scratchpad-review-and-cleanup`:
  - Classifies each artifact (promote/keep/delete) and emits safe commands for you to run.

### 8.4 Error and Constraint Handling

- When commands are blocked by network, permissions, or timeouts:
  - Stop automated retries.  
  - Emit a concise list of commands for the user to run in a separate terminal.  
  - Mark checklist items as `blocked` with clear notes and expectations for resuming.

### 8.5 Clarification and Uncertainty

- When context is ambiguous or incomplete:
  - Commands must instruct the agent to pause and ask targeted questions rather than guessing.  
- This applies especially to:
  - Directory scopes for edits.
  - Intended behavior for new or refactored code.

## 9. Validation & Example Flows

This section outlines how to validate the workflow and provides example usage sequences.

### 9.1 Validation Gate for the Workflow

- Before adopting the workflow broadly:
  - Run `uv run pre-commit run --all-files` to ensure style and lint checks pass.  
  - Run `uv run pytest` for any tests related to workflow-supporting code.  
  - Exercise at least one small and one larger epic scenario using the new commands.  
- Record results (including branch/commit/PR IDs) in the relevant checklist’s Validation Gate section.

### 9.2 Example Flow: Small Epic over Two Sessions

1. Run `epic-start` to establish context, goals, and branch.  
2. Run `epic-plan-to-checklist` to generate the checklist.  
3. Use `session-start` to identify top tasks for the session.  
4. Loop on `epic-execute-next-task` until a few key tasks are completed.  
5. Run `epic-review-checklist` to reconcile checklist and code.  
6. Use `session-end` to capture progress and next steps.  
7. In the next session, resume with `session-start` and continue the execution loop.  
8. Once done, run validations and finalize via the checklist’s Validation Gate.

### 9.3 Example Flow: Refactor Epic with Scratchpads

1. Run `epic-start` and `epic-plan-to-checklist` for the refactor work.  
2. During exploratory spikes, create temporary notes and experiments under `scratchpaper/`.  
3. Use `epic-execute-next-task` to implement refactor steps, updating tests and docs as needed.  
4. Periodically run `epic-review-checklist` to keep the checklist aligned with code.  
5. Near the end, run `scratchpad-review-and-cleanup` to:
   - Promote valuable scratch content into permanent artifacts.  
   - Propose deletion commands for truly temporary files.  
6. Conclude with Validation Gate steps and a final checklist review before merging the branch.
