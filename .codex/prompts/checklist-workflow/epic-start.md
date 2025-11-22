ABOUTME: Kick off a new epic/feature workflow.
ABOUTME: Capture goals, constraints, scope, and branch, then plan.

# `checklist-workflow/epic-start`

You are beginning work on a **new or existing epic/feature** using the checklist workflow.

Your objectives in this command:

- Understand the epic in enough detail to drive a high-quality checklist.
- Align on **scope, constraints, success criteria, and boundaries** (directories, tests, data).
- Establish or confirm a **feature branch** for the epic.
- Produce an initial, **structured plan** that can later be transformed into a checklist file.

---

## 1. Confirm Inputs and Constraints

1. Restate, in your own words:
   - The epic’s **goal** and **business/technical value**.
   - Any **explicit constraints** (directories you may edit, tech stack, performance, privacy, etc.).
   - Any **non-negotiable ground rules** the user provided.
2. Ask targeted clarifying questions if:
   - Scope feels ambiguous.
   - Success/failure criteria are not explicit.
   - Directory/test/tool constraints are unclear.

Do not proceed until you have a crisp understanding of scope and constraints.

---

## 2. Establish Branch and Repo Context

1. Ask the user for:
   - The **repository root** (if not obvious from context).
   - The **current branch** and whether a new feature branch is expected.
2. If no feature branch exists yet:
   - Propose a branch name like `feat/<epic-slug>` following `AGENTS.md`.
   - Output the exact `git` commands for the user to run (do **not** run them yourself):
     - `git checkout -b feat/<epic-slug>`
3. Record the intended branch name in your plan so it can be reflected in the checklist.

If you are uncertain about branch naming or existing branch state, ask before proposing commands.

---

## 3. High-Level Epic Analysis (using `sequential-thinking`)

Use the **Sequential Thinking MCP** to perform a first-pass analysis:

1. Decompose the epic into **Major Themes or Workstreams**.
2. For each, identify:
   - Desired outcomes (behavior, user impact, API changes, etc.).
   - Key risks or unknowns that may require research or spikes.
   - Likely repositories/directories impacted.
3. Explicitly note:
   - Dependencies on other epics or external systems.
   - Any obvious testing or validation requirements (unit, integration, E2E).

Summarize this analysis in a structured list; this will later map to **Major Tasks**.

---

## 4. Draft Initial Major Tasks and Subtasks

Based on your analysis:

1. Propose an initial set of **3–6 Major Tasks** with clearly defined scopes.
2. Under each Major Task, sketch **at least 5–10 candidate Subtasks**:
   - Tag each as `[PLAN]`, `[RESEARCH]`, `[IMPLEMENT]`, `[VALIDATE]`, or `[DOC]`.
   - Include a short clause about expected files/areas (even if approximate).
3. Ensure **research→action pairing**:
   - For each `[PLAN]`/`[RESEARCH]` item you propose, include a paired `[IMPLEMENT]`/`[VALIDATE]` item that will apply its findings.

You are **not** writing the final checklist file yet; you are drafting the structure that `epic-plan-to-checklist` will convert.

---

## 5. Propose Checklist File and Integration

1. Suggest a checklist filename under `scratchpaper/task_checklists/`:
   - Format: `<YYYY-MM-DD>–<epic-or-feature-name>–checklist.md`.
2. If relevant epic YAML exists under `.codex/scripts/development/epic-*`:
   - Ask whether to link this epic to a specific `epic.yaml` and record that reference.
3. Output:
   - The proposed checklist file path.
   - A short summary of how this epic’s checklist should reference product-plan artifacts (epic IDs, YAML paths).

---

## 6. Deliverables of `epic-start`

At the end of this command, output:

- A short **“Epic Summary”** section:
  - Goal, scope, constraints, success criteria.
- A **“Branch Plan”** section:
  - Current branch, intended feature branch name, and suggested `git` commands.
- A **“Proposed Major Tasks & Subtasks”** section:
  - Draft hierarchy with prefixes/tags, ready to be turned into a checklist.
- A **“Checklist File Plan”** section:
  - Proposed checklist path and any links to `.codex/scripts` epic YAML.

Do **not** create or modify files in this command; that is the responsibility of `epic-plan-to-checklist`.

