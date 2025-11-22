# `/start`

You are beginning work on a **new initiative**.

Your objectives in this command:

- Understand and frame the initiative such that you return a carefully-crafted, richly-detailed, and high-quality plan.
- Align on **scope, constraints, success criteria, and boundaries**.
- Produce an **structured plan** that will later be transformed into a checklist file.

Inputs: This command consumes $INITIATIVE_CONTEXT (the user’s narrative covering goals, principles, constraints, advisements). This is essential, critical context for your task, and it must be understood deeply. Additionally, use this context to infer the initiative name and propose a feature-branch slug; do not request additional variables for naming.

---

## 1. Confirm Inputs and Constraints

1. Restate, in your own words:
   - The initiative’s **goal** and **business/technical value**.
   - Any **explicit constraints** (directories you may edit, tech stack, performance, privacy, etc.).
   - Any **non-negotiable ground rules** the user provided.
2. Ask targeted clarifying questions if:
   - Scope feels ambiguous.
   - Success/failure criteria are not explicit.
   - Directory/test/tool constraints are unclear.
   - There is anything else you feel is essential to clarify.
   
As you do this, begin to extract three structured outlines that will be used later:

- **Key Principles** (operational philosophy and ground rules you must follow for this initiative).
- **Constraints** (paths, tools, performance/privacy requirements, data constraints, etc.).
- **Open Questions and Risks** (unknowns, assumptions, and risks that need to be resolved or mitigated).

Do not proceed until you have a crisp understanding of scope and constraints.

---

## 2. Establish Branch and Repo Context

1. First, infer from session or environment context:
   - The **repository root**.
   - The **current branch** and whether a new feature branch is already in use.
   Only ask the user for these details if they are missing or conflicting.
2. If no feature branch exists yet:
   - Propose a branch name like `feat/<initiative-slug>` or `fix/<initiative-slug>`.
3. Record the intended branch name in your plan so it can be reflected in the checklist.

---

## 3. High-Level Initiative Analysis (using `sequential-thinking`)

Use the **Sequential Thinking MCP** to perform a first-pass analysis (summarize outputs for later Notes & Learnings):

1. Decompose the initiative into **Major Themes or Workstreams**.
2. For each, identify:
   - Desired outcomes (behavior, user impact, API changes, etc.).
   - Key risks or unknowns that may require research or spikes.
   - Likely repositories/directories impacted.
3. Explicitly note:
   - Dependencies on other initiatives or external systems.
   - Any obvious testing or validation requirements (unit, integration, E2E).

Update your structured outlines as you go:

- Add or refine items in **Key Principles**, **Constraints**, and **Open Questions and Risks** based on this analysis and on $INITIATIVE_CONTEXT.

If the initiative involves specific external libraries or versions, use `context7` to pull API docs before drafting tasks and note relevant findings. If you need to inspect current repo layout, use `serena`/`filesystem` to skim directories without making changes.

Assemble this analysis in a richly-detailed, structured outline; this will later map to **Major Tasks**.

---

## 4. Draft Initial Major Tasks and Subtasks

Based on your analysis:

1. Propose an initial set of **3–6 Major Tasks** with clearly defined scopes.
2. Under each Major Task, sketch **at least 5–10 candidate Subtasks**:
   - Tag each as `[PLAN]`, `[RESEARCH]`, `[IMPLEMENT]`, `[VALIDATE]`, or `[DOC]`.
   - Assign each subtask a stable ID like `N.A`, `N.B`, and, when split, `N.A.1`, `N.A.2`, etc., where `N` is the Major Task number.
   - Include a short clause about expected files/areas (even if approximate).
3. Ensure **research→action pairing**:
   - For each `[PLAN]`/`[RESEARCH]` item you propose, include a paired `[IMPLEMENT]`/`[VALIDATE]` item that will apply its findings.

You are **not** writing the final checklist file yet; you are drafting the structure that will be converted in the next step.

---

## 5. Propose Checklist File and Integration

1. Suggest a checklist filename under `scratchpaper/task_checklists/`:
   - Format: `<YYYY-MM-DD>–<initiative-or-feature-name>–checklist.md`.
   - Create `scratchpaper/task_checklists/` in the project root if it doesn't exist already.
2. Output:
   - The proposed checklist file path.

---

## 6. Deliverables

At the end of this command, output:

- A short **“Initiative Summary”** section:
  - Goal, scope, and success criteria.
- A **“Key Principles”** section:
  - Bullet list of the key principles and ground rules you must follow (derived from $INITIATIVE_CONTEXT, `AGENTS.md`, and your analysis).
- A **“Constraints”** section:
  - Bullet list of important constraints (directories you may edit, tech stack requirements, performance/privacy constraints, data constraints, tooling constraints).
- An **“Open Questions and Risks”** section:
  - Bullet list of unresolved questions, assumptions, and risks that should later appear in the checklist (for example under Notes & Learnings or a dedicated risks subsection).
- A **“Branch Plan”** section:
  - Current branch, intended feature branch name, and suggested `git` commands.
- A **“Proposed Major Tasks & Subtasks”** section:
  - Draft hierarchy with IDs and prefixes/tags (for example, Major Task 1 with subtasks `1.A`, `1.B`, etc.), ready to be turned into a checklist that uses the canonical schema.
- A **“Checklist File Plan”** section:
  - Proposed checklist path, how it fits under `scratchpaper/task_checklists/`.

Do **not** create or modify files in this command.
