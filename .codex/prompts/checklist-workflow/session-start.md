---
description: Begin executing initiative checklist currently in context
argument-hint: INITIATIVE_NAME=<initiative_name> FEATURE_BRANCH=<feature_branch>
---
# `/session-start`

You are starting a **new coding session** on an existing initiative.

Your goals:

- Rehydrate your context.
- Summarize current initiative and checklist state.
- Discern and propose the single best next task (and optionally a small set of backup candidates).

---

## 1. Rehydrate Context

Inputs for this command:
- $INITIATIVE_NAME — used to locate the authoritative checklist for this initiative at `./scratchpaper/initiatives/$INITIATIVE_NAME/checklists/optimized/*.md` (exactly one `.md` is expected in that directory).
- $FEATURE_BRANCH — current working branch.

1. Read the checklist at `./scratchpaper/initiatives/$INITIATIVE_NAME/checklists/optimized/*.md` and:
   - Summarize Major Tasks and their statuses.
   - Note any `blocked` items and their reasons.
   - Review the **Execution Readiness / Implementation Coverage** note to ensure PLAN→IMPLEMENT→VALIDATE mappings are intact; call out any gaps (missing `[IMPLEMENT]` for a `[PLAN]`, missing `[VALIDATE]` for an `[IMPLEMENT]`) before proceeding.
2. Validate that $FEATURE_BRANCH matches any referenced branch context; if conflicting signals appear, ask before proceeding.
   
If anything about branch or checklist state is unclear (or inputs conflict), ask before proposing work.
Use `filesystem` to read/update the checklist. If upcoming tasks depend on external APIs, plan a `context7` lookup and capture findings in Notes & Learnings.
Ensure checklist paths are within `list_allowed_directories`; use `edit_file` (with `dryRun` if uncertain) for updates.

---

## 2. Summarize Current Status

Produce a concise summary that includes:

- Initiative goal and key success criteria (from the checklist).
- Current branch (if known).
- A snapshot of:
  - Completed Major Tasks.
  - In-progress and blocked items.

Keep this summary focused but precise.

---

## 3. Discern the Single Best Next Task

1. Identify 3–5 candidate tasks from the checklist:
   - At least one `[IMPLEMENT]` or `[VALIDATE]` item that will change code/tests.
   - Include any `[PLAN]/[RESEARCH]` items needed to unblock execution.
2. For each candidate, include:
   - Task ID and description.
   - Why it is a good fit (leverage, dependencies, alignment with goals).
3. Using the candidates and existing planning context, choose the single best next task:
   - Prefer, in order:
     - Any explicit user instructions.
     - Otherwise, the highest-priority unblocked task in the checklist that best advances the North Star / Goals; explain if you intentionally skip a higher-priority item.
4. Describe your choice in plain language, and ask the user to confirm or adjust it if there is any doubt.

End with a short, explicit sentence naming the single next checklist subtask you are ready to execute.

## 4. MCP Servers

You have the MCP servers available to you. Integrate the appropriate tools from following MCP servers into your workflow:

* **`sequential-thinking`** → The Sequential Thinking MCP server gives the model a tool for step-by-step, reflective reasoning, managing and revising thought sequences as it works. In Codex, this helps with complex coding by externalizing the planning loop—decomposing tasks, checking intermediate steps, and producing more reliable solutions.

* **`serena`** → The serena MCP server enables semantic, symbol-level understanding of code, allowing coding agents to navigate, retrieve, and edit projects with far greater precision and efficiency. This combination reduces token usage, improves code quality, and scales effectively for large or complex codebases by leveraging language-server integrations and structured tool calls. It provides a powerful, model-agnostic foundation for intelligent, context-aware code automation.

* **`context7`** → The Context7 MCP server fetches version-specific documentation and code examples straight from upstream sources and injects them into the model’s context. This is valuable for Codex because the agent can consult the exact API for the library/version you’re using, reducing hallucinated APIs and enabling up-to-date, working code.

* **`filesystem`** → The Filesystem MCP server gives the model secure, bounded access to the local project tree—tools for listing directories, reading and searching files, writing or refactoring code, managing folders, and inspecting file metadata, all restricted to explicitly allowed roots with configurable access controls. In Codex, this lets the agent behave like a real project worker: scaffolding new projects, editing and reorganizing files across a repo, and persisting state between runs without custom glue code or unsafe direct disk access.
