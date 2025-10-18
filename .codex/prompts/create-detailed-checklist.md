**Objective:**
Create a personal, detailed **task checklist** in Markdown format to organize your work, track progress, and maintain focus on building the optimal solution.

---

## 1. File Setup

* Path: `./scratchpaper/task_checklists/`
* Name your file descriptively (e.g., `2025-10-18–feature-redesign-checklist.md`).

---

## 2. Purpose

This checklist acts as **your working memory** — a place to:

* Capture tasks, subtasks, and priorities.
* Record notes and insights.
* Track progress over time.
* Keep your guiding principles front and center.

No external approvals or dependencies — this is **for you and I only**.

---

## 3. Required Sections

Structure your checklist with clear, minimal sections:

```markdown
# <Project or Topic> — Task Checklist

## North Star / Goals
- Clear definition of success (2–4 bullets)

## Key Principles
- Short reminders of how to work effectively  
  (e.g., “Bias toward action,” “Keep small scope,” “Validate assumptions early”)

## Task List
- [ ] **Major Task 1** — short description  
  - [ ] Subtask A  
  - [ ] Subtask B  
- [ ] **Major Task 2** — short description  

## Notes & Learnings
- YYYY-MM-DD — insight, decision, or reminder  
- YYYY-MM-DD — idea to revisit
```

Use checkboxes (`[ ]` / `[x]`), and label items with optional tags like `(P1)`, `(S/M/L)`, or `(#research)` as needed.

---

## 4. Tooling Requirements

You have the MCP servers available to you. Integrate the appropriate tools from following MCP servers into your workflow:

* **`sequential-thinking`** → The Sequential Thinking MCP server gives the model a tool for step-by-step, reflective reasoning, managing and revising thought sequences as it works. In Codex, this helps with complex coding by externalizing the planning loop—decomposing tasks, checking intermediate steps, and producing more reliable solutions.

* **`serena`** → The serena MCP server enables semantic, symbol-level understanding of code, allowing coding agents to navigate, retrieve, and edit projects with far greater precision and efficiency. This combination reduces token usage, improves code quality, and scales effectively for large or complex codebases by leveraging language-server integrations and structured tool calls. It provides a powerful, model-agnostic foundation for intelligent, context-aware code automation.

* **`context7`** → The Context7 MCP server fetches version-specific documentation and code examples straight from upstream sources and injects them into the model’s context. This is valuable for Codex because the agent can consult the exact API for the library/version you’re using, reducing hallucinated APIs and enabling up-to-date, working code.

Log any key insights from these lookups under **Notes & Learnings**.

---

## 5. Quality Bar

Your checklist is **done** when:

* It’s in the correct folder with clear structure.
* It includes at least 8–12 actionable items.
* “North Star” and “Key Principles” are specific and practical.
* Notes reflect real-time thinking or decisions.

---

## 6. Kickoff

When ready, start by listing your **top 3 tasks for today**, in the order you think they should be executed and why.
Then let me know when you’re ready to begin with the first task.
