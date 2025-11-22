# Comprehensive Personal Task Checklist Framework

**Purpose:**
Based on the context provided, you must create a task checklist. This checklist serves as both a **plan**, a **thinking surface**, and an **software development & action queue** — a working memory to ensure you never skip steps, never lose context, and never compromise quality or depth in your work. **Bias toward delivery, without diminishing planning/research:** research and planning are **first-class** activities that exist to enable **high-quality execution**; ensure both are well represented.

Your directive is to **think sequentially, document methodically, and execute meticulously**.
Nothing is left implicit. Everything is reasoned, written, and reviewed.

---

## 1. File Setup and Naming

**Path:**
`./scratchpaper/task_checklists/`

**Naming Convention:**
`<YYYY-MM-DD>–<project-or-feature-name>–checklist.md`
Examples:

* `2025-10-18–feature-redesign–checklist.md`
* `2025-11-08–cli-optimization–checklist.md`

**Rationale:**
Clear naming allows quick retrieval, preserves historical traceability, and reinforces discipline in workflow hygiene.

---

## 2. Core Purpose and Intent

This file functions as your **living execution blueprint**, not a summary artifact.
It ensures your work adheres to the **Non-Negotiable Ground Rules:**

* ✅ **No shortcuts in planning.** Every assumption, dependency, and risk must be surfaced.
* ✅ **No shortcuts in articulation.** Every step, substep, and rationale is explicitly written.
* ✅ **Sequential integrity.** Steps follow a logical, traceable progression.
* ✅ **Self-containment.** No external coordination or stakeholder dependencies — this is your execution guide.
* ✅ **Balanced delivery.** Pair thoughtful **`[PLAN]/[RESEARCH]`** with concrete **`[IMPLEMENT]/[VALIDATE]`**; execution must change the codebase, while planning/research must be rigorous enough to make that execution correct.

---

## 3. Required Sections

###

# <Project Name> — Comprehensive Task Checklist

## 1. North Star / Goals

* Define success in precise, measurable terms.
* Articulate *why* this work matters and *what failure looks like*.
* Include 2–4 bullets that serve as guiding coordinates throughout execution.

## 2. Key Principles

* Reaffirm your operational philosophy.
  Examples:

  * “Plan deeply, execute cleanly.”
  * “Every unclear step is a hidden risk.”
  * “Reflection before iteration.”

## 3. Sequential Task Breakdown

Break complex objectives into **Major Tasks**, each with explicitly enumerated **Subtasks**, ensuring every actionable unit is captured.

**Balance rule (mandatory):** For each **Major Task**, maintain a healthy mix across phases. As a guideline, aim for **roughly 40–60% `[IMPLEMENT]/[VALIDATE]`** and **40–60% `[PLAN]/[RESEARCH]`** over the life of the task. Early discovery may skew toward `[PLAN]/[RESEARCH]`; once decisions are made, skew toward `[IMPLEMENT]/[VALIDATE]`. **Prohibited:** `[IMPLEMENT]` items that only “implement the plan” without changing code or tests.

Each **Major Task** must begin with at least 5 **Subtasks**. You may choose the appropriate number of **Subtasks** for each **Major Task** given the complexity of the **Major Task**.

Illustrative examples and naming conventions below:

* [ ] **Major Task 1** — Description of intent and scope.

  * Context: what this enables downstream.
  * Inputs required, outputs expected.
  * [ ] Subtask 1.A — specific deliverable, component to build, or verification.
  * [ ] Subtask 1.B — specific deliverable, component to build, or verification.
  * [ ] Subtask 1.C — specific deliverable, component to build, or verification.
  * [ ] Subtask 1.D — specific deliverable, component to build, or verification.
  * [ ] Subtask 1.E — specific deliverable, component to build, or verification.
  * [ ] Subtask 1.F — specific deliverable, component to build, or verification.
  * [ ] Subtask 1.G — specific deliverable, component to build, or verification.
  * [ ] Subtask 1.H — specific deliverable, component to build, or verification.
  * [ ] Subtask 1.I — specific deliverable, component to build, or verification.
  * [ ] Subtask 1.J — specific deliverable, component to build, or verification.

* [ ] **Major Task 2** — Description of scope and dependencies.

  * [ ] Subtask 2.A — specific deliverable, component to build, or verification.
  * [ ] Subtask 2.B — specific deliverable, component to build, or verification.
  * [ ] Subtask 2.C — specific deliverable, component to build, or verification.
  * [ ] Subtask 2.D — specific deliverable, component to build, or verification.
  * [ ] Subtask 2.E — specific deliverable, component to build, or verification.
  * [ ] Subtask 2.F — specific deliverable, component to build, or verification.
  * [ ] Subtask 2.G — specific deliverable, component to build, or verification.
  * [ ] Subtask 2.H — specific deliverable, component to build, or verification.
  * [ ] Subtask 2.I — specific deliverable, component to build, or verification.
  * [ ] Subtask 2.J — specific deliverable, component to build, or verification.

**For `[IMPLEMENT]` subtasks, include at minimum:** target file path(s), function/class signatures or CLI endpoints, tests to add/update, acceptance criteria, branch name, and intended command(s) to run (e.g., `uv run tdd-cycle`).

Use structured tags for clarity:

* Priority: `(P1)`, `(P2)`
* Complexity: `(S/M/L)`
* Phase: `([RESEARCH])`, `([IMPLEMENT])`, `([VALIDATE])`
* Tool Context: `(serena)`, `(context7)`, `(sequential-thinking)`

## 4. Notes & Learnings

* YYYY-MM-DD — Observation or insight and its implication.
* YYYY-MM-DD — Decision rationale.
* YYYY-MM-DD — Detected constraint or dependency.
* YYYY-MM-DD — Hypothesis to test or revisit.

---

## 4. Planning and Sequential Thinking

Use the **Sequential Thinking MCP** server to externalize and iterate through your reasoning.
Apply this process:

1. **Decompose the goal** → Identify the atomic tasks.
2. **Reflect on dependencies** → Note prerequisites for each step.
3. **Assess alternatives** → Compare efficiency, maintainability, and scope.
4. **Simulate outcomes** → Predict execution flow.
5. **Reassess the plan** → Correct sequence and completeness before execution.

Record intermediate reflections under **Notes & Learnings** with timestamps to build historical reasoning logs.

---

## 5. Code Awareness and Semantic Precision

Use the **Serena MCP** server to:

* Retrieve symbol-level insights about your codebase.
* Perform navigations and structured edits while maintaining semantic integrity.
* Log code-level findings, especially where automated retrieval reduces context drift.

Document each `serena` invocation or insight (what you retrieved and why it matters) under **Notes & Learnings**.

---

## 6. Contextual Grounding

Use the **Context7 MCP** server whenever your work involves external or versioned dependencies.
For each lookup:

* Record **library/version**, **API**, and **example reference**.
* Summarize how this context informs or corrects your implementation.
* Add a brief reflection under **Notes & Learnings** titled *“Context7 lookup summary.”*

---

## 7. Validation Gate

Create an explicit **checkpoint protocol** to prevent silent failure.

| Category                  | Check                                                                                          | Description                                           |
| ------------------------- | ---------------------------------------------------------------------------------------------- | ----------------------------------------------------- |
| Command Summary           | `hydrate`, `pytest`, `ruff`, `mypy`, etc.                                                      | Confirm environment readiness and integrity.          |
| Validation Script         | `uv run tdd-cycle`                                                                             | Core verification loop; ensures behavioral soundness. |
| Cache & Fixture Integrity | `UV_CACHE_DIR=.uv-cache PROJECT_NEEDLE_FIXTURE_ROOT=/home/ubuntu/data/project_needle/fixtures` | Confirm hydration process if tests fail to run.       |
| Observations              | Log outcome, unexpected behavior, environment drift, or runtime errors.                        |                                                       |
| Artifacts                 | Link the **branch/commit/PR IDs** associated with validations for traceability.                |                                                       |
| Date & Outcome            | Record exact date and verdict.                                                                 |                                                       |

**Rule:**
Do not proceed beyond any failed gate until remediation is complete and documented.

---

## 8. Quality Standards (“Definition of Done”)

Your checklist achieves completeness when:

* The file adheres to the structural format.
* Each task/subtask is **explicitly articulated** with measurable endpoints.
* At least **3 to 6 Major Tasks with 5+ Subtasks each** exist, capturing *full execution scope of the input plan*.
  - Do not simply create 3 Major Tasks because its the lowest number of tasks, or 6 because its the highest number of Major Tasks.
  - Further, do not create 5 Subtasks because its the lowest acceptable number of Subtasks
  - **YOU MUST CREATE THE NUMBER OF MAJOR TASKS AND SUBTASKS NECESSARY TO COMPLETELY COVER THE FULL SCOPE OF THE PLAN**
* **Per Major Task:** at least one **merged PR or committed code change** is linked to `[IMPLEMENT]` items (once the task has moved beyond discovery).
* Notes include **dated reasoning entries** — no missing context between days or phases.
* Validation Gate logs are fully populated with outcomes.

---

## 9. Kickoff Protocol

At the start of each cycle:

1. Identify your **top 3 tasks** for the day.
2. Rank them by logical dependency and execution order.
3. Briefly justify the ordering (why #1 precedes #2, etc.).
4. Record this reasoning at the top of the file under a `### Daily Kickoff` header.
5. **Ensure at least one of the top 3 is an `[IMPLEMENT]` or `[VALIDATE]` subtask that changes code/tests.** If you are in early discovery, note this explicitly and make the top 3 include a decisive `[PLAN]/[RESEARCH]` that unlocks execution next.

---

## 10. Execution and Continuous Refinement

Each working session must begin with:

* Reviewing prior notes and validation results.
* Updating statuses for all open items.
* Reflecting on process adherence: *Am I skipping articulation?*

When tasks are completed:

* Mark with `[x]` and record the closure reasoning.
* Summarize outcomes under **Notes & Learnings** with cause–effect clarity.
* **Aim to complete at least one `[IMPLEMENT]` *or* `[VALIDATE]` subtask per session; during discovery, complete at least one `[PLAN]/[RESEARCH]` with a clearly paired next-session `[IMPLEMENT]`.**

---

## 11. Meta-Reflection and Iteration

End every session by answering:

1. What assumptions did I challenge or validate today?
2. What dependencies emerged unexpectedly?
3. What next step will have the highest leverage tomorrow?
4. Where can I increase precision or articulation quality?

## 11. Ask Questions when you are uncertain

If you feel that any part of the context is unclear or ambiguous, or would benefit from more detail, you must immediately stop and ask me for my detail. Engage with me in iterative question & answer until you feel you have all information necessary to build the best plan and checklist possible.

---

---

## 12. Research→Action Pairing (Mandatory)

**Directive:** For every planning or research item you add (Major Task or Subtask), you must add a **paired execution item** that applies the preceding research/plan. This prevents over-researching without delivery **without devaluing research quality**.

**Rules:**

* Pairing format: place each execution **Subtask** within the same **Major Task** of its associated research item(s).
* Use explicit pairing labels:

  * **Research items:** prefix with `[RESEARCH]` or `[PLAN]`.
  * **Execution items:** prefix with `[IMPLEMENT]` and reference the research label (e.g., “Exec for 2.B [RESEARCH] API options”). **Execution items must describe concrete code work**, not “implement planning.”
* Each pair must specify:

  * **Input →** what artifact from research is being used (notes, decision, spec).
  * **Action →** the concrete operation (implement, refactor, run script, file PR, ship doc).
  * **Output →** measurable, verifiable result (e.g., “PR #123 opened,” “benchmark CSV saved at `./bench/2025-11-09.csv`,” “doc link added to Notes & Learnings”).

**`[IMPLEMENT]` micro-template (use verbatim fields):**

* Files: `path/to/file1.py`, `path/to/file2.test.py`
* Symbols/Endpoints: functions/classes/routes to add or modify
* Tests: cases to add/update, location
* Acceptance: observable behavior & assertions
* Branch/PR: `feat/<slug>` → PR link/ID
* Commands: how to run/build/test locally

**Example within a Major Task:**

* [ ] **Subtask 3.B [RESEARCH]** — Compare parsers A/B/C for streaming logs (criteria: throughput, memory, error handling).
* [ ] **Subtask 3.C [IMPLEMENT] → 3.B]** — Implement chosen parser; commit feature branch `feat/parser-choice`; attach benchmark table to Notes & Learnings.

**Validation:** A research/planning item is **not complete** until its paired execution item is also complete (and vice versa).

---

## 13. Task & Subtask Naming Conventions

Maintain clear, consistent naming as items are added, updated, researched, and completed.

**Prefixes (choose one):**

* `[PLAN]` for upfront structuring
* `[RESEARCH]` for investigation
* `[IMPLEMENT]` for direct action or build
* `[VALIDATE]` for tests, checks, reviews
* `[DOC]` for documentation and communication

**Structure:**

* **Major Task:** `**Major Task N — <short verb phrase>** (tags)`
  Example: `**Major Task 2 — Implement ingestion retries** (P1, M, [IMPLEMENT])`
* **Subtask:** `Subtask N.X [PREFIX] — <clear action/result>`
  Example: `Subtask 2.C [IMPLEMENT] — Add exponential backoff with jitter to worker`

**For `[IMPLEMENT]` subtasks, append artifact details:** `Files: … | Tests: … | Acceptance: … | Branch/PR: …`

**Tagging (append at end):**

* Priority `(P1|P2)`; Complexity `(S|M|L)`; Phase `([RESEARCH]|[IMPLEMENT]|[VALIDATE])`; Tool Context `(serena|context7|sequential-thinking)`

**Update Protocol:**

* When updating a title, **retain the prefix and ID**; modify only the description.
  Example: `Subtask 2.C [IMPLEMENT] — refine jitter bounds (from 100–300ms → 50–250ms)`
* When splitting a task: keep original ID and add suffixed children (`2.C.1`, `2.C.2`).
* On completion: mark `[x]` and add a one-line **Closure Note** referencing artifacts (commit, PR, file path, doc link).

**Checklist Hygiene Guardrail:**

* Any newly added `[RESEARCH]` or `[PLAN]` item must be accompanied by a same-session `[IMPLEMENT]` counterpart or an explicit blocker note under **Notes & Learnings** with an ETA and unblock condition.
* **Maintain balance:** over each Major Task, keep **`[IMPLEMENT]+[VALIDATE]` and `[PLAN]+[RESEARCH]` roughly peer-weighted**; if they diverge for more than two consecutive sessions, add a short *Phase Note* (Discovery/Build/Hardening) explaining why.

## 14. Properly mitigating network access issues, permission issues, or commands that timeout

If you experience network access at any point that disallows you from running a command you need to run, pause to either ask me permission to run the command within your environment, or provide the exact command(s) for me to copy and paste into a separate terminal with sufficient access. I will then notify you when the command completes, along with any stdout log I received. Then you will continue our work.

If you experience a long running command that times out, pause to provide the exact command(s) for me to copy and paste into a separate terminal with sufficient access. I will then notify you when the command completes, along with any stdout log I received. Then you will continue our work.

---

### ✅ Guiding Mantra

> “A weak plan executed perfectly still fails.
> A strong plan, documented completely, never loses its path.”
