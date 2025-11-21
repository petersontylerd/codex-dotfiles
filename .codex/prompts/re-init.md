We need to update all of our AGENTS.md files throughout our project directory based on the current state of our project. 

Consider:
- Refinements (additions, changes, deletes) you want to add to the root AGENTS.md
- Refinements (additions, changes, deletes) for additional existing AGENTS.md files throughout the project
- Any additional subdirectories that would benefit from AGENTS.md files tailored to the subdirectory purpose, and the contents of those AGENTS.md files to help assure that purpose is achieved.

You have the MCP servers available to you. Integrate the appropriate tools from following MCP servers into your workflow:

* **`sequential-thinking`** → The Sequential Thinking MCP server gives the model a tool for step-by-step, reflective reasoning, managing and revising thought sequences as it works. In Codex, this helps with complex coding by externalizing the planning loop—decomposing tasks, checking intermediate steps, and producing more reliable solutions.

* **`serena`** → The serena MCP server enables semantic, symbol-level understanding of code, allowing coding agents to navigate, retrieve, and edit projects with far greater precision and efficiency. This combination reduces token usage, improves code quality, and scales effectively for large or complex codebases by leveraging language-server integrations and structured tool calls. It provides a powerful, model-agnostic foundation for intelligent, context-aware code automation.

* **`context7`** → The Context7 MCP server fetches version-specific documentation and code examples straight from upstream sources and injects them into the model’s context. This is valuable for Codex because the agent can consult the exact API for the library/version you’re using, reducing hallucinated APIs and enabling up-to-date, working code.

Present your comprehensive and thorough plan to for review prior to executing anything. You are writing this plan for yourself to function as a checklist. We are not coordinating with stewards or external parties, so there is no need to describe tasks related to third-party communication or leavebehind documentation. This is our documentation, and this is our communication. It helps you keep track of the full plan, work completed, and work remaining. So tailor its format to server your needs optimally.