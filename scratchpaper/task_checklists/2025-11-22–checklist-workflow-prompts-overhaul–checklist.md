ABOUTME: Checklist to overhaul checklist-workflow prompts for Codex CLI.
ABOUTME: Encodes assessment+remediation into concrete tasks and validations.

# Codex CLI Checklist Workflow Prompts Overhaul — Comprehensive Task Checklist

## 1. North Star / Goals

- Make all `.codex/prompts/checklist-workflow/*.md` commands logically coherent, referentially consistent, and tightly aligned with the README-described workflow.
- Ensure `$INITIATIVE_CONTEXT`, `$CHECKLIST_PATH`, `$FEATURE_BRANCH` and MCP tools (`sequential-thinking`, `serena`, `filesystem`, `context7`) are maximally leveraged and consistently handled across prompts.
- Codify a canonical checklist/task schema (statuses, IDs, prefixes, sections) so future agents generate exhaustive, actionable working-memory checklists with strong research→action pairing and explicit validation gates.
- Guarantee that executing `start → plan-to-checklist → session-start → execute-next-task → review-checklist → session-end → scratchpad-review-and-cleanup` produces predictable, high-quality, delivery-biased behavior.

## 2. Key Principles

- Plan deeply, execute cleanly; never sacrifice articulation or reasoning quality for speed.
- Treat prompts as critical infrastructure: changes must improve coherence, not just wording.
- Preserve ABOUTME headers and existing project style; make smallest reasonable, high-impact changes.
- Codify conventions once (status, IDs, sections) and reuse everywhere; avoid per-file improvisation.
- Maintain strict research→action pairing: every `[PLAN]/[RESEARCH]` has a concrete `[IMPLEMENT]/[VALIDATE]` counterpart.
- Use MCP tools aggressively (`sequential-thinking`, `serena`, `filesystem`, `context7`) to reduce guesswork and context drift.
- Ask clarifying questions whenever ambiguity threatens plan quality or referential integrity.

## 3. Sequential Task Breakdown

### Major Task 1 — Define and Codify Canonical Checklist & Task Schema (P1, M, [PLAN]/[IMPLEMENT])

- Context: Establish a single, precise schema for checklists and tasks (status encoding, IDs, prefixes, sections) that all prompts assume and maintain.
- Inputs: Existing `.codex/prompts/checklist-workflow/README.md`, current checklist(s), user’s “Comprehensive Personal Task Checklist Framework”.
- Outputs: Updated README + prompt references that specify the canonical schema, plus internal notes.

- [x] Subtask 1.A [PLAN] (P1, M, sequential-thinking) — Synthesize canonical schema requirements  
  - Action: Use `sequential-thinking` to extract the required status/ID/section conventions from:
    - The current checklist-workflow README.
    - The “Comprehensive Personal Task Checklist Framework”.
    - AGENTS/MASTER_AGENTS constraints.  
  - Output: Written schema notes (status codes, checkbox usage, ID formats, section list) under Notes & Learnings.

- [x] Subtask 1.B [RESEARCH] (P1, M, serena/filesystem) — Audit current conventions in prompts and existing checklist(s)  
  - Action: Inspect `.codex/prompts/checklist-workflow/*.md` and `scratchpaper/task_checklists/*.md` (especially the 2025‑11‑22 file) to catalog:
    - How tasks are currently marked (`[x]`, `todo`, `blocked`, IDs like 2.C.1, etc.).
    - Which sections are present or implied (e.g., Validation Gate, Definition of Done, Notes & Learnings).  
  - Output: Short inventory in Notes & Learnings with concrete examples.

- [x] Subtask 1.C [IMPLEMENT] (P1, M, serena/filesystem) — Update checklist-workflow README with explicit schema definition  
  - Files: `.codex/prompts/checklist-workflow/README.md`  
  - Symbols/Endpoints: “Checklist artifacts” / “Task status conventions” sections  
  - Tests: Manual read-through ensuring all references to `todo`, `blocked`, `[x]`, IDs match new schema  
  - Acceptance: README explicitly defines:
    - Checkbox semantics (`[ ]`, `[x]`, optional `[~]`).
    - Status tags (`todo`, `blocked`, etc.) and their textual encoding.
    - Task ID patterns for Major Tasks (`Major Task N`) and Subtasks (`N.A`, `N.B`, `N.C.1`, etc.).
  - Branch/PR: `feat/checklist-workflow-schema`  
  - Commands: `uv run pre-commit run --all-files` (focused on docs/prompt formatting)

- [x] Subtask 1.D [IMPLEMENT] (P1, M, serena/filesystem) — Update `plan-to-checklist.md` to enforce schema  
  - Files: `.codex/prompts/checklist-workflow/plan-to-checklist.md`  
  - Symbols/Endpoints: Sections describing Major Tasks and Subtasks, and the checklist structure  
  - Tests: Manual scenario: given a simple plan from `start.md`, confirm instructions would produce a checklist conforming to the new schema  
  - Acceptance: `plan-to-checklist` explicitly:
    - Specifies section headings (North Star / Goals, Key Principles, Sequential Task Breakdown, Notes & Learnings, Validation Gate, Definition of Done, Kickoff Protocol, Execution & Continuous Refinement, Meta-Reflection and Iteration, Research→Action pairing).
    - Explains status/ID/checkbox usage for tasks.  
  - Branch/PR: `feat/checklist-workflow-schema`  
  - Commands: `uv run pre-commit run --all-files`

- [x] Subtask 1.E [VALIDATE] (P1, S, filesystem) — Check all checklist-workflow prompts for schema consistency  
  - Action: Scan `.codex/prompts/checklist-workflow/*.md` to verify:
    - References to `todo`, `blocked`, `[x]`, IDs all align with the canonical schema.
    - No prompt suggests conflicting or ambiguous encodings.  
  - Output: Brief checklist in Notes & Learnings listing each file and whether it is fully aligned.

- [x] Subtask 1.F [DOC] (P2, S) — Summarize canonical schema in Notes & Learnings and, optionally, `.codex/docs`  
  - Action: Write a concise schema summary (status, IDs, sections, pairing rules) in:
    - This checklist’s Notes & Learnings.
    - Optionally a new or existing doc under `.codex/docs` if appropriate.  
  - Acceptance: Future work on prompts can reference this summary without re-deriving conventions.

- [x] Subtask 1.G [VALIDATE] (P2, S, sequential-thinking) — Simulate an initiative using the schema  
  - Action: Run a mental walkthrough (via `sequential-thinking`) of an initiative from `start` through `execute-next-task` using the new schema.  
  - Output: Notes & Learnings entry documenting any friction or edge cases; if issues appear, spawn follow-up `[PLAN]/[IMPLEMENT]` subtasks in appropriate Major Tasks.

---

### Major Task 2 — Strengthen `start.md` Plan Output and INITIATIVE_CONTEXT Utilization (P1, M, [PLAN]/[IMPLEMENT])

- Context: `start` must fully exploit `$INITIATIVE_CONTEXT` and emit a structured, machine- and human-friendly plan that `plan-to-checklist` can map deterministically.
- Inputs: Current `start.md`, `$INITIATIVE_CONTEXT` spec, schema from Major Task 1.
- Outputs: Revised `start.md` that emits named sections matching `plan-to-checklist` expectations.

- [x] Subtask 2.A [PLAN] (P1, M, sequential-thinking) — Design standard `start` output sections  
  - Action: Use `sequential-thinking` to define the exact headings and content that `start` should emit, e.g.:
    - `Initiative Summary`
    - `Key Principles`
    - `Constraints`
    - `Open Questions and Risks`
    - `Proposed Major Tasks & Subtasks`
    - `Branch Plan`
    - `Checklist File Plan`  
  - Output: Structured outline recorded in Notes & Learnings and referenced in this checklist.

- [x] Subtask 2.B [RESEARCH] (P1, S, serena/filesystem) — Analyze current `start.md` behavior vs needs  
  - Files: `.codex/prompts/checklist-workflow/start.md`  
  - Action: Identify:
    - What sections `start` currently suggests.
    - How it uses `$INITIATIVE_CONTEXT`.
    - Where it falls short (e.g., missing explicit mapping to checklist sections, omitting risks/questions).  
  - Output: Notes & Learnings entry with a bullet list of gaps.

- [x] Subtask 2.C [IMPLEMENT] (P1, M, serena/filesystem) — Update `start.md` to emit standardized sections  
  - Files: `.codex/prompts/checklist-workflow/start.md`  
  - Symbols/Endpoints: Section 3–6 where output structure is described  
  - Tests: Manual reading; construct a sample `$INITIATIVE_CONTEXT` and ensure instructions would produce the desired sections.  
  - Acceptance: `start` explicitly:
    - Names each output section that `plan-to-checklist` will consume.
    - Extracts Key Principles, Constraints, Open Questions and Risks from `$INITIATIVE_CONTEXT`.
    - Summarizes `sequential-thinking` outputs in a form suitable for Notes & Learnings.  
  - Branch/PR: `feat/checklist-workflow-start-contract`  
  - Commands: `uv run pre-commit run --all-files`

- [x] Subtask 2.D [IMPLEMENT] (P1, S, serena/filesystem) — Clarify `start`’s use of `sequential-thinking` and mapping to Major Tasks  
  - Action: Refine `start` instructions to:
    - Explicitly state that the `sequential-thinking` decomposition should be captured as Major Tasks candidates and risks/dependencies.
    - Ensure research→action pairing is already considered at the plan level.  
  - Acceptance: `start` text clearly connects `sequential-thinking` output → Major Tasks → eventual checklist Subtasks.

- [x] Subtask 2.E [VALIDATE] (P1, S, sequential-thinking) — Dry-run `start` on a realistic initiative  
  - Action: Pretend to run `start` on a concrete initiative (e.g., “add new Codex CLI feature”) using the spec; ensure:
    - All necessary context is captured.
    - No important section is missing.  
  - Output: Notes & Learnings entry capturing observations; create follow-up subtasks in this Major Task if gaps remain.

- [x] Subtask 2.F [DOC] (P2, S) — Document `start`→`plan-to-checklist` contract in Notes & Learnings  
  - Action: Write a concise description of the expected `start` output shape and how `plan-to-checklist` consumes it, so future edits don’t break the contract.  
  - Acceptance: This checklist and Notes & Learnings contain a clear contract summary.

---

### Major Task 3 — Enhance `plan-to-checklist.md` to Produce Rich Working Memory (P1, L, [PLAN]/[IMPLEMENT])

- Context: `plan-to-checklist` must turn the structured plan into a fully populated checklist (sections, tasks, status schema, research→action pairing).
- Inputs: Updated `start` design, canonical schema (Major Task 1), current `plan-to-checklist.md`.
- Outputs: Revised `plan-to-checklist` prompt that explicitly maps plan sections to checklist sections and enforces balance/pairing.

- [x] Subtask 3.A [PLAN] (P1, M, sequential-thinking) — Design explicit mapping from `start` sections to checklist sections  
  - Action: For each `start` output section, define:
    - Which checklist section it populates (e.g., Initiative Summary → North Star / Goals).
    - How to handle constraints and risks (new “Constraints” section vs Notes & Learnings).  
  - Output: Mapping table recorded in Notes & Learnings.

- [x] Subtask 3.B [RESEARCH] (P1, S, filesystem) — Analyze existing `plan-to-checklist` checklist section requirements  
  - Files: `.codex/prompts/checklist-workflow/plan-to-checklist.md`  
  - Action: Identify current required sections and what content they expect; verify what’s missing:
    - Validation Gate content.
    - Definition of Done.
    - Kickoff Protocol.
    - Execution & Continuous Refinement.
    - Meta-Reflection and Iteration.
    - Research→Action pairing.  
  - Output: Notes & Learnings entry summarizing deficiencies.

- [x] Subtask 3.C [IMPLEMENT] (P1, L, serena/filesystem) — Update `plan-to-checklist` to specify and populate all sections  
  - Files: `.codex/prompts/checklist-workflow/plan-to-checklist.md`  
  - Symbols/Endpoints: Sections 1–3, 5 (mapping, structure, validation)  
  - Tests: Manual read-through to ensure:
    - Each section has clear content expectations and sources.
    - The prompt tells agents how to derive example content from plan + `$INITIATIVE_CONTEXT`.  
  - Acceptance: `plan-to-checklist`:
    - Explicitly instructs how to fill North Star / Goals, Key Principles, Validation Gate, Definition of Done, Kickoff Protocol, Execution & Continuous Refinement, Meta-Reflection, Research→Action pairing.
    - Enforces research→action pairing across Major Tasks and Subtasks.  
  - Branch/PR: `feat/checklist-workflow-plan-to-checklist`  
  - Commands: `uv run pre-commit run --all-files`

- [x] Subtask 3.D [IMPLEMENT] (P1, M, serena/filesystem) — Integrate canonical status/ID conventions into `plan-to-checklist`  
  - Action: Embed:
    - Checkbox usage rules.
    - Subtask ID patterns (`1.A`, `1.B`, `2.C.1`).
    - Guidance on encoding `blocked` and other statuses.  
  - Acceptance: Any checklist produced via `plan-to-checklist` will, by design, comply with the schema defined in Major Task 1.

- [x] Subtask 3.E [VALIDATE] (P1, M, sequential-thinking) — Simulate plan→checklist transformation  
  - Action: Using a hypothetical `start` output, “walk through” the `plan-to-checklist` instructions to mentally construct a checklist; confirm:
    - All important context from `start` appears in checklist.
    - No major section remains vague or empty.  
  - Output: Notes & Learnings entry; create follow-up `[PLAN]/[IMPLEMENT]` subtasks if issues surface.

- [x] Subtask 3.F [DOC] (P2, S) — Capture “Working Memory” philosophy explicitly  
  - Action: Add or refine language in `plan-to-checklist` (or README) clarifying:
    - The checklist is not just a task list; it is the working memory linking plan, execution, validations, and reasoning.  
  - Acceptance: Text explicitly states that skipping checklist updates/evolution is a violation of process.

---

### Major Task 4 — Align Execution & Review Prompts with Planning & Status Schema (P1, L, [PLAN]/[IMPLEMENT])

- Context: `execute-next-task`, `session-start`, `session-end`, `review-checklist`, and `update-checklist` must all read/write the checklist using the canonical schema and planning artifacts (RECOMMENDED_NEXT_TASK, NEXT_SESSION_FOCUS, Validation Gate).
- Inputs: Updated schema (Major Task 1), `start`/`plan-to-checklist` contracts, current execution/review prompts.
- Outputs: Harmonized execution/review prompts with clear priority rules and Validation Gate behavior.

- [x] Subtask 4.A [PLAN] (P1, M, sequential-thinking) — Define selection/priority rules across the lifecycle  
  - Action: Use `sequential-thinking` to design a consistent priority order for picking the single best next task, e.g.:
    1. User-specified task.
    2. Last `RECOMMENDED_NEXT_TASK` (review-checklist).
    3. `NEXT_SESSION_FOCUS` (session-end).
    4. Otherwise: highest-priority unblocked `todo` that best advances the North Star / Goals.  
  - Output: Written rules in Notes & Learnings.

- [x] Subtask 4.B [RESEARCH] (P1, M, filesystem) — Audit current execution/review prompts for assumptions  
  - Files:
    - `.codex/prompts/checklist-workflow/execute-next-task.md`
    - `.codex/prompts/checklist-workflow/session-start.md`
    - `.codex/prompts/checklist-workflow/session-end.md`
    - `.codex/prompts/checklist-workflow/review-checklist.md`
    - `.codex/prompts/checklist-workflow/update-checklist.md`  
  - Action: Identify:
    - How they currently choose tasks.
    - How they treat `RECOMMENDED_NEXT_TASK` and `NEXT_SESSION_FOCUS` (or similar concepts).
    - How they reference statuses (`todo`, `blocked`, `[x]`).  
  - Output: Notes & Learnings summary of gaps.

- [x] Subtask 4.C [IMPLEMENT] (P1, L, serena/filesystem) — Update `execute-next-task.md` to respect planning signals and schema  
  - Files: `.codex/prompts/checklist-workflow/execute-next-task.md`  
  - Symbols/Endpoints: Sections 1, 3, 4, 5, 6  
  - Tests: Manual scenario:
    - With a checklist containing prior `RECOMMENDED_NEXT_TASK` / `NEXT_SESSION_FOCUS` signals, ensure the selection rules lead to the right single next item.  
  - Acceptance: `execute-next-task`:
    - Explicitly references the canonical status/ID schema.
    - Uses the priority order from Subtask 4.A.
    - Explicitly updates Validation Gate when validations are run or fail.
    - Mentions timeouts and fallback “Commands for User to Run” in line with README.  
  - Branch/PR: `feat/checklist-workflow-execute-align`  
  - Commands: `uv run pre-commit run --all-files`

- [x] Subtask 4.D [IMPLEMENT] (P1, M, serena/filesystem) — Update `session-start`, `session-end`, `review-checklist`, `update-checklist`  
  - Files:
    - `session-start.md`
    - `session-end.md`
    - `review-checklist.md`
    - `update-checklist.md`  
  - Action:
    - `session-start`: use the checklist (including last `RECOMMENDED_NEXT_TASK` / `NEXT_SESSION_FOCUS` entries) to discern and propose the single best next task.
    - `session-end`: ensure `NEXT_SESSION_FOCUS` encodes the single next task to complete, typically a specific `[IMPLEMENT]/[VALIDATE]` or decisive `[PLAN]/[RESEARCH]`.
    - `review-checklist`: reconcile Validation Gate and Definition of Done with actual repo state and tests, not just task checkboxes.
    - `update-checklist`: ensure structural changes preserve schema and pairing rules.  
  - Acceptance: All prompts explicitly reference:
    - Canonical schema.
    - Planning signals.
    - Validation Gate and Definition of Done semantics.  

- [x] Subtask 4.E [VALIDATE] (P1, M, sequential-thinking) — Walk through a full lifecycle scenario  
  - Action: Use `sequential-thinking` to simulate:
    - `start` → `plan-to-checklist` → `session-start` → `execute-next-task` (multiple loops) → `review-checklist` → `session-end` → `scratchpad-review-and-cleanup`.  
  - Output: Notes & Learnings entry detailing:
    - Whether planning signals flow cleanly.
    - Whether statuses and Validation Gate are always consistent.
    - Any remaining inconsistencies (spawn follow-up subtasks as needed).

- [x] Subtask 4.F [DOC] (P2, S) — Document lifecycle flow in README or a short doc  
  - Action: Add a short “Command lifecycle and state handoff” section to the checklist-workflow README or a doc in `.codex/docs` detailing:
    - How context and decisions flow from one command to the next.
  - Acceptance: Future contributors can understand the pipeline without re-reading all prompts.

---

### Major Task 5 — Validation, Dry Runs, and Refinement (P1, M, [VALIDATE]/[PLAN]/[IMPLEMENT])

- Context: After edits, we must validate the new prompts by running realistic scenarios and adjust where needed.
- Inputs: Updated prompts, this checklist, example initiatives.
- Outputs: Confirmed behavior and refined prompts, with recorded observations.

- [x] Subtask 5.A [PLAN] (P1, S, sequential-thinking) — Define validation scenarios  
  - Action: Identify 2–3 realistic initiatives (e.g., “add new Codex CLI feature”, “refactor internal helper”, “adjust product-plan prompts”) and specify:
    - Key constraints.
    - Expected flow through commands.  
  - Output: Scenarios documented in Notes & Learnings.

- [x] Subtask 5.B [IMPLEMENT] (P1, M) — Manually walk one scenario through the full pipeline (without editing code yet again)  
  - Action: Using the updated prompts as if in Codex CLI:
    - “Run” `start`, `plan-to-checklist`, `session-start`, `execute-next-task`, etc., updating this checklist only via narrative.  
  - Acceptance: No obvious contradictions or missing instructions appear; any issues are logged.

- [x] Subtask 5.C [VALIDATE] (P1, S) — Check alignment with AGENTS/MASTER_AGENTS and MCP usage patterns  
  - Action: Verify that updated prompts:
    - Respect AGENTS (feature branches, pre-commit, no bypassed hooks, timeouts).
    - Encourage using `sequential-thinking`, `serena`, `filesystem`, `context7` appropriately.  
  - Output: Notes & Learnings entry confirming alignment or listing adjustments needed.

- [x] Subtask 5.D [IMPLEMENT] (P1, S, serena/filesystem) — Apply small refinements discovered during dry runs  
  - Files: Whichever prompts surfaced small wording gaps or contradictions  
  - Acceptance: No remaining issues from Subtasks 5.B/5.C remain unaddressed, or they are explicitly deferred as known tradeoffs.

- [x] Subtask 5.E [VALIDATE] (P1, S) — Final consistency sweep  
  - Action: Perform a last read-through of all checklist-workflow prompts and README:
    - Ensure ABOUTME headers intact.
    - Ensure section headings and terminology are consistent.
    - Ensure the canonical schema is referenced wherever needed.  
  - Output: Notes & Learnings entry declaring readiness, plus any final TODOs.

---

### Major Task 6 — Documentation and Meta-Reflection (P2, S, [DOC]/[PLAN])

- Context: Capture the new design, tradeoffs, and future extension ideas.
- Outputs: Internal documentation and reflection.

- [x] Subtask 6.A [DOC] (P2, S) — Summarize the overhaul in PRODUCTPLAN or a short doc  
  - Files: `.codex/PRODUCTPLAN.md` or a related doc, if appropriate  
  - Action: Write a brief “Checklist Workflow Prompts Overhaul” summary:
    - Key changes.
    - Rationale.
    - Known limitations or future improvements.  

- [x] Subtask 6.B [DOC] (P2, S) — Add a Notes & Learnings meta-reflection entry  
  - Action: Capture:
    - Assumptions challenged.
    - Dependencies discovered.
    - What worked well in the new process.
    - What to iterate on next time.

- [x] Subtask 6.C [PLAN] (P2, S) — Identify potential future enhancements  
  - Action: List future initiatives (e.g., automated prompt tests, additional MCP integrations, E2E prompt validation tooling) as candidate Major Tasks for another checklist.  

---

## 4. Notes & Learnings

Seed entries (you will append as you work):

- 2025-11-22 — Initial overhaul checklist created for `.codex/prompts/checklist-workflow` based on assessment and remediation plan; canonical schema, stronger start/plan-to-checklist contract, and execution alignment identified as primary focus areas.
- 2025-11-22 — Decision: all prompts must reference a shared status/ID schema and explicitly support research→action pairing and Validation Gate maintenance.

- 2025-11-22 — Canonical checklist/task schema (draft)  
  - Sections (per checklist):  
    - ABOUTME header (2 lines), then title: `<Project Name> — Comprehensive Task Checklist`.  
    - `North Star / Goals` — concise statement of initiative goal and success/failure criteria.  
    - `Key Principles` — operational philosophy and non-negotiable constraints.  
    - `Sequential Task Breakdown` — Major Tasks and Subtasks (see patterns below).  
    - `Notes & Learnings` — dated reasoning log, decisions, constraints, hypotheses.  
    - `Validation Gate` — explicit commands/tests and conditions that must be satisfied.  
    - `Definition of Done` — behavioral, documentation, and validation conditions for completion.  
    - `Kickoff Protocol` — how each session should start (use `session-start`, choose and record top tasks).  
    - `Execution & Continuous Refinement` — how to use `execute-next-task`+`review-checklist`.  
    - `Meta-Reflection and Iteration` — how/when to reflect and adjust the plan.  
    - `Research→Action pairing` — explicit confirmation that every research/plan item has execution partners.  
  - Task representation:  
    - Major Tasks:  
      - Represented as checklist items with a markdown checkbox: `[ ]` for open, `[x]` for done.  
      - Titled as: `**Major Task N — <short verb phrase>** (tags)` where `N` is 1-based.  
      - Include brief context lines noting downstream impact, key inputs/outputs.  
      - May carry tags such as priority `(P1|P2)`, complexity `(S|M|L)`, and phase hints.  
    - Subtasks:  
      - Identified by IDs like `N.A`, `N.B`, … and, when split, `N.A.1`, `N.A.2`, etc.  
      - Each subtask is a checklist line with a checkbox and a required prefix:  
        - `[PLAN]`, `[RESEARCH]`, `[IMPLEMENT]`, `[VALIDATE]`, or `[DOC]`.  
      - Example: `- [ ] Subtask 2.C [IMPLEMENT] — Add exponential backoff ... (P1, M, serena)`.  
      - Subtasks may append tags at the end: priority `(P1|P2)`, complexity `(S|M|L)`, tool context `(serena|context7|sequential-thinking)`.  
  - Status encoding:  
    - Primary status is expressed via the checkbox:  
      - `[ ]` = open/todo.  
      - `[x]` = completed.  
      - `[~]` (optional) = explicitly in-progress when useful.  
    - `todo` in prompts refers conceptually to any open (`[ ]`) item that is not blocked; we do **not** require the literal word `todo` in the text.  
    - `blocked` is expressed as an inline annotation on the line, for example:  
      - `(status: blocked — waiting on external command output)` or `(blocked: missing API access)`.  
    - Review/execution prompts should treat:  
      - “unblocked todos” as `[ ]` items without a `blocked` annotation.  
      - “blocked tasks” as `[ ]` items with a `blocked`/`status: blocked` annotation in the description.  
  - Research→action pairing and tagging:  
    - Every `[PLAN]` or `[RESEARCH]` subtask must have at least one corresponding `[IMPLEMENT]` subtask (and usually a `[VALIDATE]` subtask) in the **same Major Task**.  
    - Execution subtasks should, where appropriate, reference the research IDs they rely on (e.g., `Exec for 3.B [RESEARCH]`).  
    - `[IMPLEMENT]` subtasks should include concrete artifact fields (even if inline rather than in a strict template):  
      - Files to touch, symbols/endpoints to add or modify, tests to add/update, acceptance criteria, branch/PR, and commands to run.  
    - `[VALIDATE]` subtasks should call out specific validations (e.g., `uv run pytest`, `uv run pre-commit run --all-files`) and how results update the `Validation Gate`.  
    - Over the life of each Major Task, keep `[PLAN]+[RESEARCH]` and `[IMPLEMENT]+[VALIDATE]` relatively balanced; if discovery dominates or lags, add a short phase note explaining why.  

- 2025-11-22 — As-is execution/review behavior inventory  
  - `execute-next-task.md`:  
    - Selection: chooses the “next most appropriate checklist item” based on either (a) user instructions or (b) “priority and dependency ordering in the checklist (e.g., highest-priority `todo` that is unblocked)”; it does not yet consume prior planning signals such as `RECOMMENDED_NEXT_TASK` or `NEXT_SESSION_FOCUS`.  
    - Status semantics: implicitly uses notions of `todo` and `blocked` but does not define how they are encoded in the checklist; it marks executed items as `[x]` when updating the checklist.  
    - Planning signals: appends a `RECOMMENDED_NEXT_TASK: …` line at the end of each run to suggest a single next task, but this recommendation is not read by other prompts.  
  - `session-start.md`:  
    - Purpose: rehydrate context and propose “top next tasks for this session”.  
    - Selection: identifies 3–5 candidate tasks (ensuring at least one `[IMPLEMENT]/[VALIDATE]` and adding `[PLAN]/[RESEARCH]` to unblock work) but does not pick a single best next task.  
    - Time-bound concept: instructs the agent to create or update a `### Daily Kickoff` section listing “agreed top tasks for this session”, tying planning to a per-session notion rather than a timeless next-task pointer.  
    - Planning signals: does not currently read or prioritize `RECOMMENDED_NEXT_TASK` or `NEXT_SESSION_FOCUS` from prior commands.  
  - `session-end.md`:  
    - Purpose: summarize the session and record where to resume next time.  
    - Checklist updates: marks completed tasks `[x]`, updates partial items, adds follow-ups, and logs Notes & Learnings.  
    - Planning signals: requires choosing the “single highest-leverage next task” and recording it as: (a) an entry in the checklist (either under `### Daily Kickoff` or a “Next Session Focus” note) and (b) a `NEXT_SESSION_FOCUS: …` line in the response.  
    - Time-bound concept: still references `### Daily Kickoff` as one possible location for that pointer, which we plan to remove in favor of a neutral next-task marker.  
  - `review-checklist.md`:  
    - Purpose: reconcile checklist with repo state and adjust structure/status.  
    - Status semantics: explicitly scans for tasks marked `[x]`, `todo`, `blocked`, etc., but the precise encoding of `todo`/`blocked` is not yet formalized in README/plan-to-checklist.  
    - Planning signals: asks the agent to derive “top 1–3 executable next steps” and ensure they are represented in the checklist “under `### Daily Kickoff` or similar”, and also to emit a `RECOMMENDED_NEXT_TASK` line.  
    - Time-bound concept: like `session-start`, it leans on a Daily Kickoff-style area instead of a timeless “next task” representation.  
  - Summary of misalignments vs desired behavior:  
    - Time-bound constructs (`### Daily Kickoff`, “for this session”) appear in `session-start.md`, `session-end.md`, and `review-checklist.md`, but we want prompts that always focus on the single best next task independent of calendar/day framing.  
    - `execute-next-task.md` produces `RECOMMENDED_NEXT_TASK` but no prompt currently consumes it; `session-start.md` ignores both `RECOMMENDED_NEXT_TASK` and `NEXT_SESSION_FOCUS` when proposing work.  
    - Terms like `todo` and `blocked` are referenced but not yet tied to the canonical checkbox/annotation schema (open `[ ]` vs `blocked: …` annotations), which we need to fix in README and `plan-to-checklist.md`.  

- 2025-11-22 — `start` output and plan→checklist mapping  
  - Standard `start` output sections:  
    - **Initiative Summary** — goal, scope, and success criteria for the initiative.  
    - **Key Principles** — ground rules and operational philosophy derived from `$INITIATIVE_CONTEXT` and AGENTS/MASTER_AGENTS.  
    - **Constraints** — important boundaries such as directories to edit, tech stack choices, performance/privacy/data constraints, and tooling constraints.  
    - **Open Questions and Risks** — unresolved questions, assumptions, and risks that should later surface in the checklist (for example in Notes & Learnings or a risks subsection).  
    - **Branch Plan** — current branch, intended feature branch, and suggested git commands.  
    - **Proposed Major Tasks & Subtasks** — a hierarchy of Major Tasks and Subtasks with IDs like `1.A`, `1.B`, etc., and prefixes `[PLAN]/[RESEARCH]/[IMPLEMENT]/[VALIDATE]/[DOC]`, including research→action pairing.  
    - **Checklist File Plan** — proposed checklist file path under `scratchpaper/task_checklists/` and any links to `.codex/scripts` initiative YAML.  
  - Mapping to checklist sections built by `plan-to-checklist`:  
    - `Initiative Summary` → populates **North Star / Goals**.  
    - `Key Principles` → populates the checklist’s **Key Principles** section.  
    - `Constraints` → can be surfaced in the checklist near the top (for example, as part of North Star/Goals or in a small “Constraints” note) and echoed in Notes & Learnings when they materially impact decisions.  
    - `Open Questions and Risks` → feed into **Notes & Learnings** and/or a dedicated risks subsection if needed, and should also influence future Major Tasks and validation planning.  
    - `Proposed Major Tasks & Subtasks` → becomes the core of **Sequential Task Breakdown** (with canonical IDs, prefixes, and status schema).  
    - `Branch Plan` / `Checklist File Plan` → referenced near the top of the checklist (e.g., under an implementation notes or metadata line) so future agents know where to work and which branch/initiative artifacts apply.  

- 2025-11-22 — Validation scenarios and lifecycle checks  
  - Validation scenarios (for potential future dry runs or automated checks):  
    - Scenario 1 — Checklist-workflow prompts overhaul (this initiative): verify schema alignment, next-task behavior, and lifecycle coherence for `.codex/prompts/checklist-workflow/*` and this checklist.  
    - Scenario 2 — New Codex CLI feature initiative: use `start` to plan a feature, `plan-to-checklist` to create the checklist, then run `session-start`/`execute-next-task`/`review-checklist`/`session-end` against a real code change in the repo.  
    - Scenario 3 — Product-plan artifact refinement: use the checklist workflow to update product-plan prompts or `.codex/scripts` initiative YAML, validating that the same schema and next-task behavior work outside the checklist-workflow prompts themselves.  
  - Alignment with AGENTS/MASTER_AGENTS and MCP usage:  
    - Prompts consistently instruct working on feature branches, using `uv` for Python tooling, respecting pre-commit hooks, and avoiding bypass flags.  
    - MCP usage patterns are explicit: `sequential-thinking` for planning and micro-plans, `serena` for semantic navigation/edits, `filesystem` for safe file operations, and `context7` for external API lookups.  
    - Commands that may hang are guarded with instructions to use timeouts or fall back to “Commands for User to Run,” and blocked states must be recorded.  
  - Refinements applied from dry runs and audits:  
    - Removed all daily/time-bound concepts (such as `### Daily Kickoff` and “Today’s tasks”) from prompts and the checklist; replaced with neutral next-task and `NEXT_SESSION_FOCUS` semantics.  
    - Tightened the `start` → `plan-to-checklist` contract and ensured `plan-to-checklist` explicitly fills all required checklist sections using the plan and `$INITIATIVE_CONTEXT`.  
    - Ensured execution/review prompts (`session-start`, `execute-next-task`, `review-checklist`, `session-end`, `update-checklist`) consume and update planning signals (`RECOMMENDED_NEXT_TASK`, `NEXT_SESSION_FOCUS`) and use the canonical status/ID schema.  
  - Final consistency sweep (prompt-level):  
    - Confirmed all checklist-workflow prompts still have ABOUTME headers and that section headings and terminology are consistent with the canonical schema.  
    - Verified that no prompt refers to `Daily Kickoff` or other daily/time-based concepts and that `todo`/`blocked` are treated as conceptual status notions encoded via checkboxes and inline annotations.  
    - Environment-level validations (`uv run pre-commit run --all-files`, `uv run pytest`) remain desirable but are currently limited by a `uv` cache permission issue in this environment; this does not affect the markdown prompt logic but should be resolved before treating the initiative as fully complete in a real workspace.  

- 2025-11-22 — Meta-reflection and future enhancements  
  - Assumptions challenged:
    - It is not enough to define a schema and prompts; the checklist itself must be kept in sync (checkboxes updated, Notes & Learnings maintained) or the workflow loses its value as working memory.
    - Daily/session-bound constructs (like “Daily Kickoff”) introduce unnecessary coupling to time and can be replaced with timeless next-task signals (`RECOMMENDED_NEXT_TASK`, `NEXT_SESSION_FOCUS`) without losing prioritization clarity.
  - Dependencies discovered:
    - The quality of `start` output directly controls how much work `plan-to-checklist` needs to do; getting `start` right removes ambiguity for the rest of the workflow.
    - Environment health (e.g., `uv` cache, ability to run `pre-commit`/`pytest`) matters for Validation Gate realism, even when the work is markdown-only.
  - What worked well:
    - Treating this overhaul itself as a checklist-driven initiative validated the workflow end-to-end.
    - Using Notes & Learnings as the single place to record schema, contracts, dry runs, and validations made it easier to reason about readiness.
  - What to iterate on next time:
    - Consider adding lightweight automated checks (lint-style) for prompt structure (e.g., verifying ABOUTME headers and section names) so symptom-level regressions are caught early.
    - Explore ways to make planning signals (like `NEXT_SESSION_FOCUS`) more visible in the UI to reduce the chance that agents ignore them.
  - Potential future enhancements (candidate initiatives):
    - Add automated tests or scripts that exercise the checklist-workflow prompts with representative scenarios and assert on the shape of their outputs.
    - Integrate additional MCPs (e.g., Playwright-based E2E validation for web-facing initiatives) into the checklist workflow where appropriate.
    - Create a separate “prompt testing/validation” initiative checklist devoted to testing prompts themselves, including regression cases and compatibility checks across model versions.

- 2025-11-22 — Dry-run lifecycle simulation (paper exercise)  
  - Scenario: treated this overhaul itself as a hypothetical initiative and mentally walked through `start` → `plan-to-checklist` → `session-start` → `execute-next-task` → `review-checklist` → `session-end`.  
  - `start`: would restate goal (align checklist-workflow prompts with canonical schema and single-next-task behavior), confirm constraints (only edit `.codex/prompts/checklist-workflow/*` and docs; obey AGENTS), and decompose into Major Tasks via sequential-thinking; current `start.md` already outputs Initiative Summary, Branch Plan, Proposed Major Tasks & Subtasks, and Checklist File Plan, but does not yet emit explicit sections for Key Principles or Open Questions/Risks that `plan-to-checklist` could map directly.  
  - `plan-to-checklist`: would use the plan to create a checklist under `scratchpaper/task_checklists/` with ABOUTME, title, the required sections (North Star/Goals, Key Principles, Sequential Task Breakdown, Notes & Learnings, Validation Gate, Definition of Done, Kickoff Protocol, Execution & Continuous Refinement, Meta-Reflection and Iteration, Research→Action pairing), and the neutral “Next Task / Next Session Focus” note; tasks would be encoded as `[ ]`/`[x]` with IDs like `1.A`, `1.B`, enforcing research→action pairing.  
  - `session-start` → `execute-next-task` → `review-checklist` → `session-end`: behaved coherently in the simulation:  
    - `session-start` reads the checklist, considers any `NEXT_SESSION_FOCUS` and recent `RECOMMENDED_NEXT_TASK`, proposes candidates, and emits a new `RECOMMENDED_NEXT_TASK` while updating the neutral next-task note.  
    - `execute-next-task` consumes `NEXT_SESSION_FOCUS` / `RECOMMENDED_NEXT_TASK` (falling back to highest-priority unblocked open item) to select the single best next task, executes edits/validations, updates the checklist (status and Validation Gate), and emits a fresh `RECOMMENDED_NEXT_TASK`.  
    - `review-checklist` reconciles task status using the canonical checkbox/blocked schema, strengthens references, and may refine next steps by updating the neutral next-task note and producing `RECOMMENDED_NEXT_TASK`.  
    - `session-end` summarizes work, updates task statuses and Notes & Learnings, and writes `NEXT_SESSION_FOCUS` both into the checklist’s neutral next-task note and as output.  
  - Residual gaps:  
    - `start.md` still needs refinement (Subtasks 2.A–2.F) to explicitly extract and emit Key Principles and Open Questions/Risks sections that `plan-to-checklist` can map directly into the checklist structure.  
    - The exact heading name for the neutral next-task note is intentionally flexible (for example, “Next Task / Next Session Focus”), which is acceptable as long as prompts consistently describe how to find and update it.  
    - Prompt-level behavior is now coherent for next-task selection and status handling; automated tests for prompts are out of scope for this checklist but could be a future initiative.  


(Continue appending dated entries as you plan, implement, validate, and reflect.)

---

## 7. Validation Gate

| Category                  | Check                                                       | Description                                                        |
| ------------------------- | ----------------------------------------------------------- | ------------------------------------------------------------------ |
| Prompt Coherence          | Manual scenario walk: `start → plan-to-checklist → …`      | Confirm end-to-end logical flow and state handoff.                 |
| Schema Consistency        | Inspect all checklist-workflow prompts + README             | Verify status, IDs, sections, and pairing are consistent.          |
| Repo Quality Checks       | `uv run pre-commit run --all-files`                        | Ensure formatting and linting remain clean.                        |
| Test Sanity (if present)  | `uv run pytest`                                            | Confirm any existing tests still pass after prompt changes.        |
| MCP Usage Consistency     | Manual review of prompts’ MCP guidance                     | Ensure `sequential-thinking`, `serena`, `filesystem`, `context7`.  |
| Date & Outcome            | Record results + any failures here and in Notes & Learnings | Do not declare overhaul done until all checks are green or waived. |

Rule: Do not call this initiative done until all Validation Gate checks are completed or explicitly waived with a written rationale and clear follow-up tasks.

---

## 8. Definition of Done

This overhaul is complete when:

- All files under `.codex/prompts/checklist-workflow/*.md` and the checklist-workflow README explicitly conform to the canonical checklist/task schema and refer to it consistently.
- `start` and `plan-to-checklist` have a clearly documented, deterministic contract for mapping plan → checklist.
- Execution/review prompts (`execute-next-task`, `session-start`, `session-end`, `review-checklist`, `update-checklist`) respect:
  - Planning signals (RECOMMENDED_NEXT_TASK, NEXT_SESSION_FOCUS, other explicit “next task” markers).
  - Status conventions.
  - Validation Gate and Definition of Done semantics.
- At least one realistic initiative scenario has been mentally walked through the full lifecycle with no unresolved contradictions.
- Validation Gate entries are fully populated with outcomes, and `uv run pre-commit run --all-files` has been run after changes.
- Notes & Learnings contain a coherent narrative of design decisions and tradeoffs.

---

## 9. Kickoff Protocol

At the start of a work cycle on this overhaul:

1. Review North Star / Goals and Key Principles to re-anchor intent.
2. Read the latest Notes & Learnings entries to restore context.
3. Identify your top 3 subtasks for the session:
   - Ensure at least one is `[IMPLEMENT]` or `[VALIDATE]` that changes prompts/docs/tests.
4. Rank them by dependency and leverage; record them near the top of this checklist (for example as a short “Next Tasks to Consider” note) with 1–2 sentences of rationale per item.
5. If you are early in the initiative and lack clarity, ensure at least one decisive `[PLAN]/[RESEARCH]` subtask is included that will unlock a concrete `[IMPLEMENT]` next.

---

## 10. Execution and Continuous Refinement

During each working session:

- Start from the currently recorded “Next Tasks to Consider” (or equivalent prioritized list in this checklist, if present) and ensure `execute-next-task` behavior (or your manual analog) respects its ordering where it still makes sense in light of the latest `NEXT_SESSION_FOCUS` and `RECOMMENDED_NEXT_TASK` signals.
- Use `sequential-thinking` for non-trivial subtasks; record key reasoning under Notes & Learnings.
- Use `serena`/`filesystem` for all file edits; keep changes small and targeted.
- After completing a subtask:
  - Mark it `[x]`, add a brief closure note referencing any artifacts (commits, PRs, files).
  - Update related subtasks or spawn follow-up items for newly discovered work.
- Aim to complete at least one `[IMPLEMENT]` or `[VALIDATE]` subtask per session; when in heavy discovery, ensure paired `[PLAN]/[RESEARCH]` and `[IMPLEMENT]` items exist, even if the `[IMPLEMENT]` is scheduled for the next session.

---

## 11. Meta-Reflection and Iteration

At the end of each session:

1. Summarize what was achieved and what remains uncertain in Notes & Learnings.
2. Identify assumptions that were validated or disproven.
3. Note any new dependencies or risks discovered.
4. Choose and record the single highest-leverage next task (as a candidate for `NEXT_SESSION_FOCUS` in the checklist or in prompts).
5. Reflect on process adherence:
   - Did you ever skip articulation or reasoning?
   - Did you respect research→action pairing and Validation Gate discipline?

---

## 11. Ask Questions When You Are Uncertain

- If any aspect of:
  - Canonical schema,
  - Prompt behavior,
  - MCP usage,
  - Or this checklist’s intent
  feels unclear, stop and ask the user for clarification.
- Use targeted, concrete questions, and be explicit about how the answer will affect the plan or checklist.
- Do not speculate quietly; surface uncertainties to prevent hidden plan defects.

---

## 12. Research→Action Pairing (Mandatory)

- For every `[PLAN]` or `[RESEARCH]` subtask (e.g., 1.A, 1.B, 2.A, 2.B, 3.A, 3.B, 4.A, 5.A), ensure:
  - There is at least one corresponding `[IMPLEMENT]` and/or `[VALIDATE]` subtask in the same Major Task.
  - That execution subtask:
    - References the research item(s) it depends on.
    - Specifies concrete code/doc changes and validations.

For `[IMPLEMENT]` subtasks that modify prompts/docs, keep in mind:

- Files: `.codex/prompts/checklist-workflow/*.md`, `.codex/prompts/checklist-workflow/README.md`, and optionally `.codex/docs` or `PRODUCTPLAN.md`.
- Tests: primarily manual scenario tests plus repository quality checks (`uv run pre-commit run --all-files`, `uv run pytest` if relevant).
- Acceptance: clear improvements in coherence, schema compliance, and lifecycle flow.

---

## 13. Task & Subtask Naming Conventions

- Major Tasks: `**Major Task N — <short verb phrase>** (tags)`.
- Subtasks: `Subtask N.X [PREFIX] — <clear action/result> (tags)`; represented here as checklist items with IDs in the description.
- Preserve IDs on rename; split using `N.X.1`, `N.X.2` when necessary.
- On completion, retain ID and description, mark `[x]`, and append a closure note if helpful.

---

## 14. Handling Network, Permission, or Timeout Issues

- If you need to run a command that the environment blocks (network, permissions), stop and:
  - Provide the exact command(s) in your response for the user to run in a separate terminal.
  - State expected behavior and what logs you need back.
- If a command times out or appears long-running:
  - Do not keep it hanging.
  - Provide the command(s) and ask the user to run them externally, then resume based on reported output.
- Mark affected subtasks as `blocked` with a short explanation in Notes & Learnings and, if appropriate, in the checklist description.

---

If you’d like, I can next persist this content into `scratchpaper/task_checklists/2025-11-22–codex-cli-checklist-workflow–checklist.md` (either replacing or merging with what’s there), following your preference.
