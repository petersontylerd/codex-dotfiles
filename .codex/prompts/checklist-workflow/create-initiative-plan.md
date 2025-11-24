# `/create-initiative-plan`

You are beginning work on a **new initiative**.

Your objectives in this command:

- Understand and frame the **new initiative** such that you return a carefully-crafted, richly-detailed, and high-quality plan.
- Align on **scope, constraints, success criteria, and boundaries**.
- Produce an **structured plan** that will later be transformed into a checklist file.

Inputs: This command consumes $INITIATIVE_CONTEXT (the user’s narrative covering goals, principles, constraints, advisements). This is essential, critical context for your task, and it must be understood deeply. Read it carefully, then read it again. You must understand the user's stated goals, and also supplement the user's stated goals with your own knowledge of the space where you believe your supplemental knowledge is additive. The user relies on your subject matter expertise, technical expertise, and objectivity.

Additionally, use this context to infer the **new initiative** name and propose a feature-branch slug; do not request additional variables for naming.

---

## 1. Confirm Inputs and Constraints

1. Restate, in your own words:
   - The initiative’s **goal** and **business/technical value**.
   - Any **explicit constraints** (directories you may edit, tech stack, performance, privacy, etc.).
   - Any **non-negotiable ground rules** the user provided.
2. Ask targeted clarifying questions if:
   - Scope feels ambiguous.
   - Success/failure criteria are not explicit.
   - You detect contradictions.
   - Directory/test/tool constraints are unclear.
   - There is anything else you feel is essential to clarify.
   
As you do this, begin to extract three structured outlines that will be used later:

- **Key Principles** (operational philosophy and ground rules you must follow for this **new initiative**).
- **Constraints** (paths, tools, performance/privacy requirements, data constraints, etc.).
- **Open Questions and Risks** (unknowns, assumptions, and risks that need to be resolved or mitigated).

Do not proceed until you have a crisp understanding of scope and constraints.

---

## 2. Establish Branch and Repo Context

1. First, infer from session or environment context:
   - The **repository root**.
   - The **current branch** and whether a new feature branch is already in use.
   Only ask the user for these details if they are missing or conflicting.
   - Confirm there is an initialized git repo; if not, stop and ask whether to initialize.
2. If no feature branch exists yet:
   - Propose a branch name like:
      - `feat/<initiative-slug>`
      - `fix/<initiative-slug>`
      - `refactor/<initiative-slug>`
      - `chore/<initiative-slug>`
      - `hotfix/<initiative-slug>`
3. Record the intended branch name in your plan so it can be reflected in the checklist.

---

## 3. High-Level Initiative Analysis (using `sequential-thinking`)

Use the **Sequential Thinking MCP** to perform a first-pass analysis (summarize outputs for later Notes & Learnings):

1. Conduct a thorough review of the rest of the project repository files to indentify relevant and useful previously engineered functionality, and to discern overall project structure. Gather relevant context to enrich your planning of this **new initiative**.
2. Decompose the **new initiative** into **Major Themes or Workstreams**.
3. For each, identify:
   - Desired outcomes (behavior, user impact, API changes, etc.).
   - Key risks or unknowns that may require research or spikes.
   - Likely repositories/directories impacted.
4. Explicitly note:
   - Dependencies on other project repository functionality.
   - Any obvious testing or validation requirements (unit, integration, E2E).

Update your structured outlines as you go:

- Add or refine items in **Key Principles**, **Constraints**, and **Open Questions and Risks** based on this analysis and on $INITIATIVE_CONTEXT.

If the **new initiative** involves specific external libraries or versions, use `context7` to pull API docs before drafting tasks and note relevant findings. If you need to inspect current repo layout, use `serena`/`filesystem` to skim directories without making changes.

Assemble this analysis in a richly-detailed, structured outline; this will later map to **Major Tasks**.

---

## 4. Draft Initial Major Tasks and Subtasks

Based on your analysis:

1. Propose an initial set of **3–6 Major Tasks** with clearly defined scopes.
2. Under each Major Task, sketch **roughly 5–10 candidate Subtasks** (capture fewer only when the scope is genuinely small, but always ensure PLAN→IMPLEMENT→VALIDATE coverage):
   - Tag each as `[PLAN]`, `[RESEARCH]`, `[IMPLEMENT]`, `[VALIDATE]`, or `[DOC]`.
   - Assign each subtask a stable ID like `N.A`, `N.B`, and, when split, `N.A.1`, `N.A.2`, etc., where `N` is the Major Task number.
   - Include a short clause about expected files/areas (even if approximate).
3. Ensure **research→action pairing**:
   - For every `[PLAN]` or `[RESEARCH]` subtask, explicitly cite at least one `[IMPLEMENT]` subtask ID that will apply its findings. One `[IMPLEMENT]` may satisfy multiple upstream subtasks, but each pairing must be listed so that no research item is left without execution --> **FAILURE ON THIS STEP MEANS FAILING THE PROJECT**
   - For every `[IMPLEMENT]` subtask, specify at least one `[VALIDATE]` subtask (tests, artifact diffs, benchmarks, etc.) that will prove the change works. A `[VALIDATE]` subtask may cover multiple implementations, but it must explicitly cite every `[IMPLEMENT]` ID it verifies. --> **FAILURE ON THIS STEP MEANS FAILING THE PROJECT**
4. Treat the documentation-only pass (if requested) as the final sequencing step. All earlier Major Tasks must observe the subtask-level pairing rules above—no `[PLAN]`/`[RESEARCH]` item may exist without downstream `[IMPLEMENT]` coverage, and every `[IMPLEMENT]` must declare its verification path before the doc-only phase begins.

You are **not** writing the final checklist file yet; you are drafting the structure that will be converted in the next step.

---

## 4.1 Implementation Coverage Check

Before moving forward:

1. Build a mapping that lists:
   - Each `[PLAN]`/`[RESEARCH]` subtask alongside the `[IMPLEMENT]` IDs that fulfill it (one-to-many allowed, but no research item may lack at least one implementer).
   - Each `[IMPLEMENT]` subtask alongside the `[VALIDATE]` IDs that prove it (one `[IMPLEMENT]` may reference multiple validations, but zero is forbidden).
2. If any entry is missing either side of the mapping, revise the subtasks immediately. If the gap cannot be resolved due to missing information, stop and ask the user for clarification before proceeding.
3. Record both the mapping and the aggregate counts of `[PLAN]`/`[RESEARCH]` vs `[IMPLEMENT]`/`[VALIDATE]` so downstream prompts can audit coverage quickly. Note when a single `[VALIDATE]` entry covers multiple implementations and ensure each relationship is enumerated.

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
- A **“Proposed Major Tasks & Subtasks”** section:
  - Draft hierarchy with IDs and prefixes/tags (for example, Major Task 1 with subtasks `1.A`, `1.B`, etc.), ready to be turned into a checklist that uses the canonical schema.
- An **“Execution Readiness / Implementation Coverage”** section:
  - Provide both: (a) the aggregate counts of `[PLAN]`/`[RESEARCH]` vs `[IMPLEMENT]`/`[VALIDATE]` subtasks per Major Task, and (b) the explicit mapping showing which `[IMPLEMENT]` items fulfill each `[PLAN]`/`[RESEARCH]` item and which `[VALIDATE]` items prove each `[IMPLEMENT]` (calling out shared validations explicitly). Treat any gap as a blocker until resolved.
- A **“Checklist File Plan”** section:
  - Proposed checklist path, how it fits under `scratchpaper/task_checklists/`.

Do **not** create or modify files with this command.

## 7. MCP Servers

You have the MCP servers available to you. Integrate the appropriate tools from following MCP servers into your workflow:

* **`sequential-thinking`** → The Sequential Thinking MCP server gives the model a tool for step-by-step, reflective reasoning, managing and revising thought sequences as it works. In Codex, this helps with complex coding by externalizing the planning loop—decomposing tasks, checking intermediate steps, and producing more reliable solutions.

* **`serena`** → The serena MCP server enables semantic, symbol-level understanding of code, allowing coding agents to navigate, retrieve, and edit projects with far greater precision and efficiency. This combination reduces token usage, improves code quality, and scales effectively for large or complex codebases by leveraging language-server integrations and structured tool calls. It provides a powerful, model-agnostic foundation for intelligent, context-aware code automation.

* **`context7`** → The Context7 MCP server fetches version-specific documentation and code examples straight from upstream sources and injects them into the model’s context. This is valuable for Codex because the agent can consult the exact API for the library/version you’re using, reducing hallucinated APIs and enabling up-to-date, working code.

* **`filesystem`** → The Filesystem MCP server gives the model secure, bounded access to the local project tree—tools for listing directories, reading and searching files, writing or refactoring code, managing folders, and inspecting file metadata, all restricted to explicitly allowed roots with configurable access controls. In Codex, this lets the agent behave like a real project worker: scaffolding new projects, editing and reorganizing files across a repo, and persisting state between runs without custom glue code or unsafe direct disk access.
