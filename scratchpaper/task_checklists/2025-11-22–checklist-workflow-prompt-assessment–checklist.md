ABOUTME: Task checklist for evaluating .codex/prompts/checklist-workflow prompts.
ABOUTME: Serves as living execution blueprint and action queue for this assessment.

# Checklist Workflow Prompt Assessment — Comprehensive Task Checklist

## 1. North Star / Goals

- Produce a thorough, objective assessment of all files in `.codex/prompts/checklist-workflow`, focusing on logical coherence, referential integrity, and alignment with Codex CLI usage patterns.
- Identify and clearly articulate the strengths of the current prompts so that future improvements preserve what already works well.
- Identify weaknesses, gaps, inconsistencies, and verbosity issues, and propose concrete, actionable remediation strategies without yet modifying any prompt files.
- Ensure the assessment is structured and detailed enough that future implementation work (prompt rewrites/edits) can proceed with minimal re-discovery or re-reading.
- Define explicitly what failure looks like: missed files, shallow or hand-wavy conclusions, untested assumptions about workflows, or remediation proposals that are vague or not actionable.

## 2. Key Principles

- Plan deeply, execute cleanly: invest heavily in upfront decomposition and articulation so that the assessment and any future edits are straightforward.
- Every unclear step is a hidden risk: whenever a prompt behavior, variable, or workflow edge case is ambiguous, stop and either reason it out carefully or ask for clarification.
- Reflection before iteration: periodically reassess whether the current understanding of the checklist-workflow prompts is correct and complete before layering on more analysis.
- Obey scope and constraints: limit assessment strictly to `.codex/prompts/checklist-workflow` and avoid considering or referencing any other repository files.
- Balance planning/research with implementation/validation: pair analytical work with concrete written artifacts (sections of the final assessment) and internal consistency checks.

## 3. Sequential Task Breakdown

- [ ] **Major Task 1 — Establish scope and mental model of checklist-workflow prompts** (P1, M, [RESEARCH])

  - Context: Understand the boundaries, file inventory, and intended workflow before diving into file-level analysis; this enables correct, targeted assessment downstream.
  - Inputs required: `.codex/prompts/checklist-workflow` directory contents, `README.md`. Outputs expected: complete file inventory, initial workflow sketch, and updated Notes & Learnings.

  - [x] Subtask 1.A [PLAN] — Confirm assessment scope and constraints (only `.codex/prompts/checklist-workflow`, no edits yet, evaluation and proposals only). (P1, S, [PLAN], (sequential-thinking))
  - [x] Subtask 1.B [RESEARCH] — List directory contents of `.codex/prompts/checklist-workflow` (files and subdirectories) and classify each by presumed role (entry, planning, execution, reflection, etc.). (P1, S, [RESEARCH], (filesystem))
  - [x] Subtask 1.C [RESEARCH] — Read `README.md` deeply to extract intended workflow, typical usage patterns, and explicit design goals/constraints for the checklist workflow. (P1, M, [RESEARCH])
  - [x] Subtask 1.D [PLAN] — Build a structured workflow model (entry points, transformations, execution steps, iteration loops) based on `README.md` and the file inventory, and write this model into **Notes & Learnings**. (P1, M, [PLAN], (sequential-thinking))
  - [x] Subtask 1.E [VALIDATE] — Cross-check the workflow model against any examples or descriptions in `README.md` to ensure there are no contradictions or missing steps; refine the model until it is coherent. (P1, S, [VALIDATE])
  - [x] Subtask 1.F [IMPLEMENT] — Draft the “Overview and workflow summary” portion of the final assessment, applying outputs of 1.A–1.E (Exec for 1.A–1.D [PLAN]/[RESEARCH]). (P1, M, [IMPLEMENT])
  - [ ] Subtask 1.G [VALIDATE] — Review the drafted overview for fidelity to `README.md` and the observed file inventory, confirming it does not rely on assumptions from outside `.codex/prompts/checklist-workflow`. (P1, S, [VALIDATE])

- [ ] **Major Task 2 — Analyze critical prompts (`start`, `plan-to-checklist`, `execute-next-task`) in depth** (P1, L, [RESEARCH])

  - Context: These three prompts are central to the workflow: `start.md` for context ingestion and initial planning, `plan-to-checklist.md` for transforming context into a working-memory checklist, and `execute-next-task.md` for thorough execution and next-step selection.
  - Inputs required: `start.md`, `plan-to-checklist.md`, `execute-next-task.md`, workflow model from Major Task 1. Outputs expected: detailed per-file analysis, including strengths, weaknesses, and preliminary remediation ideas.

  - [x] Subtask 2.A [RESEARCH] — Read `start.md` carefully and break it into logical sections (role definition, context usage, planning behavior, output format, tool usage, guardrails). (P1, M, [RESEARCH])
  - [x] Subtask 2.B [RESEARCH] — Evaluate how `start.md` uses all available context variables; identify any underused or unused inputs and note them in **Notes & Learnings**. (P1, M, [RESEARCH])
  - [x] Subtask 2.C [RESEARCH] — Read `plan-to-checklist.md` and extract its expectations for inputs, the structure of the produced checklist, and the rules for decomposing tasks into checklist items. (P1, M, [RESEARCH])
  - [x] Subtask 2.D [RESEARCH] — Read `execute-next-task.md` and identify how it selects the next checklist item, guides execution (including tool usage), updates state, and advises the single next task to perform. (P1, M, [RESEARCH])
  - [x] Subtask 2.E [PLAN] — Define explicit evaluation criteria for these three prompts (e.g., context utilization, logical coherence, clarity of responsibilities, robustness of output specification) and record them in **Notes & Learnings**. (P1, S, [PLAN], (sequential-thinking))
  - [x] Subtask 2.F [IMPLEMENT] — Write a detailed strengths-and-weaknesses analysis for `start.md`, using findings from 2.A–2.B and criteria from 2.E (Exec for 2.A–2.B [RESEARCH] + 2.E [PLAN]). (P1, M, [IMPLEMENT])
  - [x] Subtask 2.G [IMPLEMENT] — Write a detailed strengths-and-weaknesses analysis for `plan-to-checklist.md`, using findings from 2.C and criteria from 2.E (Exec for 2.C [RESEARCH] + 2.E [PLAN]). (P1, M, [IMPLEMENT])
  - [x] Subtask 2.H [IMPLEMENT] — Write a detailed strengths-and-weaknesses analysis for `execute-next-task.md`, using findings from 2.D and criteria from 2.E (Exec for 2.D [RESEARCH] + 2.E [PLAN]). (P1, M, [IMPLEMENT])
  - [ ] Subtask 2.I [VALIDATE] — Review all three analyses to ensure they explicitly connect back to the evaluation criteria from Subtask 2.E and reference concrete prompt behaviors rather than general impressions. (P1, S, [VALIDATE])
  - [ ] Subtask 2.J [PLAN] — Identify and note any cross-cutting themes or tensions between the three prompts (e.g., verbosity differences, conflicting instructions) for use in later cross-file analysis. (P2, S, [PLAN])

- [ ] **Major Task 3 — Map variables, interfaces, and cross-file coherence (including other prompts)** (P1, L, [RESEARCH])

  - Context: Treat each prompt as a function with input/output contracts; ensure variables, expectations, and terminology are consistent across the entire checklist-workflow set, including files beyond the three critical prompts.
  - Inputs required: All prompt files in `.codex/prompts/checklist-workflow`, workflow model, and per-file notes from Major Tasks 1 and 2. Outputs expected: a variable/contract map, coherence analysis, and identification of any mismatches or gaps.

  - [x] Subtask 3.A [RESEARCH] — Enumerate all variables/placeholders used across every prompt file (e.g., `{{...}}` or equivalent syntax), noting where each appears and whether it is treated as input or output. (P1, M, [RESEARCH])
  - [x] Subtask 3.B [RESEARCH] — For each prompt, derive an explicit “signature” (inputs expected, outputs produced, side-effects like checklist updates) and record these signatures in **Notes & Learnings**. (P1, L, [RESEARCH])
  - [x] Subtask 3.C [VALIDATE] — Check that the outputs of upstream prompts (especially `start` and `plan-to-checklist`) match the input expectations of downstream prompts (`execute-next-task` and any others that depend on the checklist). (P1, M, [VALIDATE])
  - [x] Subtask 3.D [RESEARCH] — Analyze all non-critical prompts in the directory (e.g., reflection, update, summarize commands if present) to understand their roles and how they rely on or mutate the checklist working memory. (P2, M, [RESEARCH])
  - [ ] Subtask 3.E [PLAN] — Identify and document any variable naming inconsistencies, undocumented expectations, or contract mismatches between prompts, including their potential impact on Codex CLI behavior. (P1, M, [PLAN])
  - [ ] Subtask 3.F [DOC] — Draft a cross-file coherence section for the final assessment, describing how data and control flow through the prompts, and calling out specific strengths and weaknesses in interface design. (P1, M, [IMPLEMENT])
  - [ ] Subtask 3.G [VALIDATE] — Reconcile the cross-file description with individual file analyses to ensure there are no contradictions or missing prompts in the narrative. (P1, S, [VALIDATE])
  - [ ] Subtask 3.H [PLAN] — Note any areas where cross-file behavior is logically sound but fragile (e.g., reliant on implicit assumptions) and flag them for potential hardening in remediation proposals. (P2, S, [PLAN])

- [ ] **Major Task 4 — Assess verbosity, concision, and clarity; design remediation strategies** (P2, M, [PLAN])

  - Context: The prompts must be mission-critical yet efficient; the goal is to identify where text can be safely trimmed or clarified without reducing effectiveness, and where more detail is needed to avoid ambiguity.
  - Inputs required: All prompts, per-file analyses, and cross-file coherence notes. Outputs expected: categorized verbosity findings and a set of remediation strategies (per-file and system-wide).

  - [ ] Subtask 4.A [RESEARCH] — Identify repetitive or low-signal sections within and across prompts (e.g., duplicated rules, overly long explanations) and list them in **Notes & Learnings**. (P2, M, [RESEARCH])
  - [ ] Subtask 4.B [RESEARCH] — Identify under-specified or ambiguous instructions that could benefit from short, precise clarifications, especially in the three critical prompts. (P1, M, [RESEARCH])
  - [ ] Subtask 4.C [PLAN] — For each verbose region, define a concise “target shape” (e.g., bullets instead of prose, centralized shared guidance) that would preserve or improve effectiveness. (P2, M, [PLAN])
  - [ ] Subtask 4.D [PLAN] — For each ambiguity, specify the minimum additional detail needed to make behavior unambiguous and robust across model variants. (P1, M, [PLAN])
  - [ ] Subtask 4.E [DOC] — Draft a verbosity and concision recommendations section for the final assessment, structured per prompt and system-wide, including concrete examples of proposed simplifications. (P2, M, [IMPLEMENT])
  - [ ] Subtask 4.F [VALIDATE] — Review recommendations to ensure they do not remove critical guardrails or weaken safety/quality constraints, revising as necessary. (P1, S, [VALIDATE])
  - [ ] Subtask 4.G [PLAN] — Group remediation ideas into logical themes (e.g., “context maximization for start”, “checklist schema tightening”, “execution protocol clarity”) in preparation for a future implementation phase. (P2, S, [PLAN])

- [ ] **Major Task 5 — Synthesize full assessment and prepare for future implementation** (P1, M, [DOC])

  - Context: Combine all analyses into a single, coherent assessment that answers the mandate (strengths, weaknesses, remediation, verbosity) and sets up a future editing pass if/when requested.
  - Inputs required: Outputs from Major Tasks 1–4. Outputs expected: final assessment response to the user and a roadmap-style outline for implementing changes later.

  - [ ] Subtask 5.A [PLAN] — Define the structure of the final assessment response (e.g., Overview, File-by-file analysis, Cross-file coherence, Verbosity & Concision, Remediation proposals, Prioritization). (P1, S, [PLAN])
  - [ ] Subtask 5.B [DOC] — Write the strengths summary section, clearly distinguishing per-file strengths from system-level strengths. (P1, M, [IMPLEMENT])
  - [ ] Subtask 5.C [DOC] — Write the weaknesses section, categorizing issues into logical/structural, interface/variable, clarity/ambiguity, and verbosity/redundancy. (P1, M, [IMPLEMENT])
  - [ ] Subtask 5.D [DOC] — Write the remediation proposals section, mapping each significant weakness to concrete remediation actions and noting expected impact and difficulty. (P1, M, [IMPLEMENT])
  - [ ] Subtask 5.E [PLAN] — Prioritize remediation proposals into High/Medium/Low based on risk and importance, and outline a potential future implementation order. (P1, S, [PLAN])
  - [ ] Subtask 5.F [VALIDATE] — Cross-check the final assessment against the original mandate to ensure all questions are fully answered and no required dimension is missing. (P1, S, [VALIDATE])
  - [ ] Subtask 5.G [PLAN] — Define a follow-up “implementation phase” Major Task (in a future checklist) that would cover actually editing prompts, adding tests if applicable, and validating behavior in Codex CLI. (P2, S, [PLAN])

## 4. Notes & Learnings

- 2025-11-22 — Implementation of prompt changes (editing `.codex/prompts/checklist-workflow` files) is intentionally deferred; current work is limited to assessment and remediation proposals. Any future [IMPLEMENT] work that modifies prompt files is blocked pending explicit user request. (Blocker noted for future implementation phase.)
- 2025-11-22 — Assessment scope is strictly limited to `.codex/prompts/checklist-workflow`; references to behavior or constraints must come from these files and the user’s instructions, not from other repository files. 
- 2025-11-22 — Subtasks 1.A–1.C completed: scope confirmed, directory inventory gathered for `.codex/prompts/checklist-workflow`, and `README.md` read to capture intended workflow, usage patterns, and design goals.
- 2025-11-22 — Initial structured workflow model drafted from `README.md` and cross-checked against the “Command lifecycle and state handoff” section: `start` → `plan-to-checklist` → `session-start` → `execute-next-task` → `review-checklist` → `session-end` → `scratchpad-review-and-cleanup`, with planning signals (`RECOMMENDED_NEXT_TASK`, `NEXT_SESSION_FOCUS`) flowing among `execute-next-task`, `review-checklist`, `session-end`, and `session-start` while the checklist remains the authoritative working memory.
 - 2025-11-22 — Subtasks 2.A–2.D completed: `start.md`, `plan-to-checklist.md`, and `execute-next-task.md` analyzed for structure and responsibilities. `start` focuses on ingesting `$INITIATIVE_CONTEXT`, clarifying goals/constraints, proposing a branch, and emitting a structured plan; `plan-to-checklist` consumes that plan plus checklist path info to either create or update a canonical checklist with standard sections; `execute-next-task` operates in the execution loop, selecting a single best checklist subtask based on signals and priorities, performing real edits and validations, updating the checklist, and emitting `RECOMMENDED_NEXT_TASK`.
 - 2025-11-22 — Subtask 1.F [IMPLEMENT] completed: drafted an Overview and workflow summary (below) that explains how Codex CLI uses `start`, `plan-to-checklist`, `session-start`, `execute-next-task`, `review-checklist`, `session-end`, and `scratchpad-review-and-cleanup` together, grounded entirely in `.codex/prompts/checklist-workflow/README.md`.
 - 2025-11-22 — Subtasks 2.F–2.H [IMPLEMENT] completed: drafted per-file strengths-and-weaknesses analyses for `start.md`, `plan-to-checklist.md`, and `execute-next-task.md` (below), explicitly tying observations to how each prompt uses context, defines responsibilities, and specifies outputs.
 - 2025-11-22 — Subtasks 3.A–3.D completed: enumerated variables and signatures across all prompts and validated cross-file contracts. Inputs: `$INITIATIVE_CONTEXT` (start), `$CHECKLIST_PATH` and `$FEATURE_BRANCH` (session-start), planning signals (`RECOMMENDED_NEXT_TASK`, `NEXT_SESSION_FOCUS`), and checklist path from session context (plan-to-checklist, update-checklist, review-checklist, execute-next-task, session-end, scratchpad-review-and-cleanup). Outputs align with README: `start` emits structured planning sections and a checklist file plan; `plan-to-checklist` creates/updates the markdown checklist; `session-start` emits a status summary plus `RECOMMENDED_NEXT_TASK`; `execute-next-task` emits concrete edits/validation summaries plus `RECOMMENDED_NEXT_TASK`; `review-checklist` emits reconciled checklist updates plus a `RECOMMENDED_NEXT_TASK`; `session-end` emits a session summary plus `NEXT_SESSION_FOCUS`; `scratchpad-review-and-cleanup` emits classification plus proposed commands. No file expects an input that is never produced elsewhere; planning signals and checklist path are the main shared state and are used consistently.

### Draft Overview and Workflow Summary (Exec for 1.A–1.E → 1.F)

- The checklist workflow is a command set for Codex CLI that turns high-level initiative context into a durable checklist acting as working memory, then drives iterative execution and reflection against that checklist.
- `start` is the entry point: it consumes `$INITIATIVE_CONTEXT`, clarifies goals, constraints, ground rules, and branch strategy, and emits a structured plan with proposed Major Tasks/Subtasks and a checklist file plan, but does not touch files.
- `plan-to-checklist` converts that plan (plus any user context) into a concrete markdown checklist under `scratchpaper/task_checklists/`, scaffolding all standard sections (North Star, Key Principles, Sequential Task Breakdown, Notes & Learnings, Validation Gate, Definition of Done, Kickoff, Execution & Continuous Refinement, Meta-Reflection, Research→Action pairing, and a neutral next-task note).
- `session-start` rehydrates state from the checklist and planning signals (`RECOMMENDED_NEXT_TASK`, `NEXT_SESSION_FOCUS`), summarizes current progress and constraints, and proposes a single best next task for the current session without time-based framing.
- `execute-next-task` runs the execution loop: it selects one checklist subtask using planning signals and priorities, builds a micro-plan via `sequential-thinking`, performs real edits through `serena`/`filesystem`, runs validations, updates the checklist (statuses, Notes & Learnings, Validation Gate), and emits an updated `RECOMMENDED_NEXT_TASK`.
- `review-checklist` periodically reconciles checklist vs repository reality: it adjusts task structure and statuses, marks blocked/unblocked items, refines upcoming work, and may update `RECOMMENDED_NEXT_TASK` based on what actually exists in the repo.
- `session-end` closes a working session by summarizing accomplishments, decisions, and validation outcomes, updating the checklist and Notes & Learnings, and setting `NEXT_SESSION_FOCUS` so that the next `session-start` can resume quickly.
- `scratchpad-review-and-cleanup` is a hygiene command used later in the lifecycle to review `scratchpaper/` artifacts, promote valuable content into durable docs or `.codex/scripts` product-plan YAML, and propose safe cleanup commands so that initiative scratch does not accumulate indefinitely.
- Throughout the flow, MCP tools have clear roles: `sequential-thinking` for planning and reasoning, `serena` for semantic code/prompt navigation and edits, `filesystem` for checklist and scratch file operations, and `context7` for external API documentation; the checklist is the single source of truth for initiative state, and skipping checklist updates is explicitly defined as a process violation.

### Draft Per-File Analyses for Critical Prompts (Exec for 2.A–2.E → 2.F–2.H)

**`start.md` — strengths**
- Strongly emphasizes clarifying goals, constraints, and non-negotiable ground rules before any planning, with explicit instructions to restate inputs and ask targeted clarifying questions, which reduces misalignment risk.
- Clearly defines `$INITIATIVE_CONTEXT` as the sole input variable and uses it to infer initiative name and branch slug, avoiding unnecessary variable prompts and aligning with README’s variable model.
- Integrates `sequential-thinking` explicitly in the High-Level Initiative Analysis section, pushing the agent to decompose work into Major Themes/Workstreams and to surface risks, dependencies, and testing requirements early.
- Provides a concrete, structured list of final deliverables (Initiative Summary, Key Principles, Constraints, Open Questions and Risks, Branch Plan, Proposed Major Tasks & Subtasks, Checklist File Plan) that map cleanly into `plan-to-checklist`’s expectations.
- Explicitly forbids creating or modifying files, delegating that responsibility to `plan-to-checklist` and thereby keeping the planning command side-effect-free and easy to reason about.

**`start.md` — weaknesses / risks**
- Branch handling assumes the agent should always ask for repository root and current branch; in Codex CLI contexts where `cwd` and branch are already known, this can introduce redundant questioning and verbosity.
- There is no explicit mention of `RECOMMENDED_NEXT_TASK` or `NEXT_SESSION_FOCUS` signals, even though `start`’s plan structure will eventually feed into those concepts through the checklist; this is logically okay but slightly under-emphasizes their role.
- It does not explicitly constrain the number of Major Tasks/Subtasks proposed beyond 3–6/5–10, which is reasonable, but it could better emphasize completeness relative to initiative scope rather than numeric ranges.
- The prompt relies on the user to surface all tool and directory constraints; it suggests using `serena`/`filesystem` for repo inspection but does not spell out how to reconcile those findings back into constraints if the initial context was incomplete.

**`plan-to-checklist.md` — strengths**
- Treats the checklist as the “canonical working memory” and explicitly calls letting it drift a process violation, which aligns with README and enforces seriousness around checklist maintenance.
- Clearly defines checklist file identification/creation logic under `scratchpaper/task_checklists/`, including reuse vs creation, ABOUTME headers, and standard section structure, ensuring consistency across initiatives.
- Maps inputs from `start` directly into checklist sections (North Star, Key Principles, Sequential Task Breakdown, Notes & Learnings, Validation Gate, Definition of Done, Kickoff, Execution & Continuous Refinement, Meta-Reflection, Research→Action pairing), which maximizes reuse of prior planning work.
- Enforces strong research→action pairing and requires that every Major Task have at least 5 Subtasks, with a balanced mix of `[PLAN]/[RESEARCH]` and `[IMPLEMENT]/[VALIDATE]`, pushing the agent toward actionable, testable work.
- Emphasizes surgical file updates via `filesystem` and `serena`, preferring patch-style edits and preserving existing IDs, prefixes, Notes & Learnings, and Validation Gate entries, which reduces risk of accidental data loss in the checklist.

**`plan-to-checklist.md` — weaknesses / risks**
- While it describes all major sections, it leaves some leeway on how detailed each must be; for mission-critical flows, more explicit minimum expectations (e.g., number and granularity of goals, examples of Validation Gate entries) might improve consistency.
- The section list includes a neutral next-task note via a nested bullet (“A neutral note or mini-section…”) that is slightly mis-indented (looks like a sub-bullet of Research→Action pairing), which could cause some models to under-emphasize or misplace it.
- It assumes that the plan from `start` is always present and well-structured; it lightly mentions user context as an alternate source but does not fully specify the fallback behavior when `start` was not used.
- The balance requirement between planning/research and implementation/validation is mentioned qualitatively but could be made more explicit (for example, by giving numeric or structural guidance similar to the user-provided checklist framework).

**`execute-next-task.md` — strengths**
- Strongly biases toward concrete action: it states explicitly that the job is to select a task, micro-plan it, execute it with tools, validate, and update the checklist, preferring doing over narrating whenever environment constraints allow.
- Implements a clear task-selection hierarchy: user-specified task → planning signals (`NEXT_SESSION_FOCUS`, `RECOMMENDED_NEXT_TASK`) → priority and dependency ordering in the checklist, which aligns with README’s planning signal semantics.
- Integrates `sequential-thinking` as a mandatory step for non-trivial tasks, enforcing a 3–7 step micro-plan that covers context gathering, design decisions, edits, tests, and updates, which helps avoid impulsive, unplanned edits.
- Provides explicit guidance on handling blocked commands (network, permissions, timeout) by emitting a Commands for User to Run section and marking tasks as blocked, mirroring the global repo rules about long-running commands and environment constraints.
- Closes the loop by requiring checklist and Notes & Learnings updates, including status changes, artifact references (files, tests, commits/PRs), and a one-line `RECOMMENDED_NEXT_TASK` recommendation grounded in dependencies and momentum.

**`execute-next-task.md` — weaknesses / risks**
- It assumes that the checklist path is already in session context but does not specify what to do if that context is unexpectedly missing or stale beyond “read it without re-prompting unless the path is missing”; more explicit fallback behavior could improve robustness.
- Validation guidance is fairly generic (e.g., `uv run pytest`, `uv run ruff check`) and does not tie directly into the initiative-specific Validation Gate defined in the checklist, other than a brief mention about updating that Gate; stronger linkage might prevent drift between per-task validations and overall definition of done.
- The prompt does not explicitly remind the agent to maintain the research→action pairing at the subtask level when adding follow-up subtasks (it suggests adding follow-ups for new work but not that they also need balanced implementation/validation items).
- While it references `context7` for external API checks, it does not specify how to log those findings in the checklist’s Notes & Learnings in a structured way (e.g., standardized “Context7 lookup summary” entries), which could lead to inconsistent documentation.

## 5. Planning and Sequential Thinking

- Use the **Sequential Thinking MCP** to refine decomposition (especially in Major Tasks 2–4), verify that no significant analysis path is missed, and periodically reassess sequence and completeness.
- Before starting new clusters of work (e.g., deep-diving a specific prompt), run a short sequential-thinking cycle to clarify goals, dependencies, and intended outputs.
- Capture key sequential-thinking insights or plan revisions in **Notes & Learnings** with dates so that reasoning remains traceable over time.

## 6. Code Awareness and Semantic Precision (Serena MCP)

- For this assessment, Serena MCP is not expected to be heavily used because the focus is on prompt content rather than application code, but keep it in reserve if symbol-level insight into any referenced scripts or commands becomes necessary.
- If Serena is used (e.g., to understand how Codex CLI invokes these prompts in code), record what was queried and how it informed the assessment in **Notes & Learnings**.

## 7. Contextual Grounding (Context7 MCP)

- External library or API documentation is unlikely to be central for this prompt-focused evaluation, but if any prompt refers to specific library behaviors or versions, use Context7 MCP to confirm those details.
- When Context7 is used, log the library/version, API, and takeaway under **Notes & Learnings** as a “Context7 lookup summary.”

## 8. Validation Gate

- Category: Conceptual Integrity Check — Confirm that all prompts in `.codex/prompts/checklist-workflow` have been inspected and that no file is omitted from the assessment.
- Category: Contract Consistency — Verify that the variable and interface mapping (Major Task 3) shows consistent inputs/outputs between prompts, or explicitly calls out mismatches.
- Category: Mandate Coverage — Before finalizing, confirm that the final assessment explicitly answers: strengths, weaknesses with remediation, and verbosity/concision opportunities.
- Rule: Do not consider this assessment “done” while any of the above gates fail; address gaps via the relevant Major Tasks/Subtasks before closing.

## 9. Quality Standards (“Definition of Done” for this Assessment)

- The checklist structure in this file is fully populated with meaningful Major Tasks and Subtasks that cover the full scope of the prompt evaluation, not just the minimum counts.
- Each Major Task includes a balanced mix of `[PLAN]/[RESEARCH]` and `[DOC]/[VALIDATE]` work, with clear pairings between analysis and written artifacts.
- All prompt files in `.codex/prompts/checklist-workflow` are explicitly covered by at least one Subtask in the breakdown.
- The final written assessment (delivered to the user) includes: a workflow overview, per-file analysis for critical prompts, cross-file coherence analysis, verbosity/concision recommendations, and a prioritized remediation plan.
- Notes & Learnings contain dated reasoning entries that explain key decisions and constraints, including why implementation edits are deferred.

## 10. Kickoff Protocol

### Daily Kickoff — 2025-11-22

1. **Subtask 1.B [RESEARCH] — Directory inventory and classification.** This is the foundation for all later analysis and ensures no prompt file is missed.
2. **Subtask 1.C [RESEARCH] — Deep read of `README.md`.** Understanding intended usage patterns and goals is critical before interpreting individual prompts.
3. **Subtask 1.D [PLAN] — Workflow model in Notes & Learnings.** Capturing the workflow model early provides a stable reference that later per-file analyses can align with.

Rationale: These three tasks build a reliable mental model and boundary before committing to detailed assessments, reducing the risk of misinterpreting prompt responsibilities.

## 11. Execution and Continuous Refinement

- At the start of each working session on this assessment, review this checklist and **Notes & Learnings**, then update status boxes for any completed subtasks.
- Regularly ask: “Am I skipping articulation?” If any step was executed without being clearly written down, retroactively document it under the relevant Subtask and in Notes & Learnings.
- Aim to complete at least one `[DOC]` or `[VALIDATE]` subtask in each session so that research and planning are consistently converted into durable artifacts and checks.

## 12. Meta-Reflection and Iteration

- End each session by briefly answering:
  - What assumptions about the checklist-workflow prompts did I challenge or validate today?
  - What new dependencies or cross-file relationships emerged?
  - What next step will have the highest leverage for improving the assessment or remediation proposals?
  - Where can I increase precision, structure, or articulation quality in this checklist or in the final assessment?

## 13. Research→Action Pairing (Mandatory)

- For every `[PLAN]` or `[RESEARCH]` Subtask in Major Tasks 1–4, ensure there is at least one paired `[DOC]` or `[VALIDATE]` Subtask that applies the findings (e.g., writing specific sections of the assessment, updating the workflow model, or verifying consistency).
- If a research/planning item cannot yet be paired with execution (for example, edits to prompt files), log a blocker entry in **Notes & Learnings** with the condition “await explicit user request to modify prompts” and, if relevant, an ETA once unblocked.
- Treat written assessment sections (Overview, per-file analyses, coherence, remediation) as execution artifacts: they are the deliverables that consume and apply the research work.

## 14. Task & Subtask Naming and Hygiene

- Maintain stable IDs for Major Tasks and Subtasks (e.g., “Subtask 2.C [RESEARCH]”) even if descriptions are refined; if splitting a Subtask, create child IDs such as `2.C.1` and `2.C.2`.
- When updating a title, retain the prefix and ID, modifying only the descriptive text so that history remains traceable.
- On completion of a Subtask, mark `[x]` and add a one-line Closure Note in **Notes & Learnings** referencing any concrete artifacts (e.g., “2025-11-22 — Subtask 2.F completed: per-file analysis for `start.md` captured in final assessment draft.”).
- For any new `[PLAN]` or `[RESEARCH]` Subtask added in the future, add a same-session `[DOC]` or `[VALIDATE]` Subtask or log an explicit blocker in **Notes & Learnings** explaining why execution must wait.

## 15. Handling Network, Permission, or Timeout Issues

- If a tool or command ever requires network access or elevated permissions beyond what is available, pause and either:
  - Ask the user for permission to run the command in their environment, or
  - Provide the exact command(s) for the user to run in a separate terminal, then incorporate their reported output into the assessment.
- If a long-running command times out, capture the command and any partial output, then provide the exact command(s) and context for the user to rerun with appropriate settings; resume analysis once their results are available.
- Record any such events in **Notes & Learnings** so that environment-related constraints on validation are explicitly documented.

### Guiding Mantra

> “A weak plan executed perfectly still fails.  
> A strong plan, documented completely, never loses its path.”
