ABOUTME: Checklist for tests around checklist-workflow prompt consumers.
ABOUTME: Plan and track test-focused follow-on initiative.

# Checklist-Workflow Consumer Tests — Comprehensive Task Checklist

## 1. North Star / Goals

- Ensure that any code which consumes `.codex/prompts/checklist-workflow/*.md` is covered by meaningful automated tests (unit, integration, and, where possible, end-to-end).
- Protect the refined checklist-workflow prompts from regressions by validating their integration points in the wider toolchain.
- Keep testing scope disciplined and high-value, focusing on behaviors and workflows that matter most for Codex CLI reliability.

## 2. Key Principles

- Treat the existing checklist-workflow prompts as stable inputs; tests should exercise consumers, not rewrite the prompts.
- Prefer high-signal tests over sheer quantity; focus on behaviors that would meaningfully impact users if broken.
- Maintain clear links between tests and the prompts or flows they protect (files, symbols, and scenarios).

## 3. Sequential Task Breakdown

### Major Task 1 — Discover and map prompt-consumer code paths (P1, M, [PLAN]/[RESEARCH])

- Context: Identify exactly where and how checklist-workflow prompts are loaded, parsed, and used in the codebase before designing tests.

- [x] Subtask 1.A [RESEARCH] — Identify prompt-consumer modules and entrypoints (P1, M, [RESEARCH])
  - Files: N/A (discovery only; target paths to be recorded in Notes & Learnings)
  - Symbols/Endpoints: N/A
  - Tests: N/A
  - Acceptance: Notes & Learnings contain a list of modules, scripts, or services that read or interpret `.codex/prompts/checklist-workflow/*.md`, with paths and short descriptions.
  - Branch/PR: N/A
  - Commands: N/A (this checklist does not execute code; discovery is via future initiative runs).

- [x] Subtask 1.B [IMPLEMENT] → 1.A [RESEARCH] — Capture discovered prompt-consumer paths in this checklist (P1, S, [IMPLEMENT])
  - Files: `scratchpaper/task_checklists/2025-11-22–checklist-workflow-consumer-tests–checklist.md`
  - Symbols/Endpoints: N/A
  - Tests: N/A
  - Acceptance: A Notes & Learnings section lists each prompt-consumer path (files and key symbols) and how it uses the prompts; this content can drive test design in later tasks.
  - Branch/PR: `feat/checklist-workflow-consumer-tests`
  - Commands: apply_patch to update Notes & Learnings when discovery is later performed.

## 4. Notes & Learnings

- 2025-11-22 — This checklist was created as a follow-on initiative from the checklist-workflow evaluation, focused on adding tests for any code that consumes `.codex/prompts/checklist-workflow/*.md`.
- 2025-11-22 — Initial discovery (Subtasks 1.A, 1.B): a repository-wide search for references to `checklist-workflow` found only the prompt directories themselves (`.codex/prompts/checklist-workflow`, `.codex/prompts/checklist-workflow_v0`) and related scratchpaper checklists; no in-repo code modules currently load or interpret these prompts directly. This implies that the primary consumers are external (for example, Codex CLI or other tooling), and that in-repo automated tests for prompt consumption would need to be designed at the integration boundary with those external systems.

## 5. Validation Gate

- Command Summary:
  - For this initiative, validations will focus on the presence and behavior of tests around prompt-consumer code paths (to be defined).
- Validation Script:
  - To be specified once concrete tests and locations are known.
- Observations:
  - Use this section to record any gaps in test coverage relative to identified prompt-consumer paths.
- Artifacts:
  - Branch `feat/checklist-workflow-consumer-tests` and any associated PR IDs once tests are added.
- Date & Outcome:
  - To be filled in once tests are implemented and run.

## 6. Definition of Done

- All identified prompt-consumer code paths for checklist-workflow prompts have corresponding automated tests.
- Tests are stable, readable, and run as part of the standard test suite.
- The Validation Gate is updated with commands and outcomes for running these tests.

## 7. Kickoff Protocol

- At the start of work on this initiative:
  - Review this checklist’s North Star / Goals and Key Principles.
  - Confirm branch context (e.g., `feat/checklist-workflow-consumer-tests`).
  - Use a session command (e.g., `session-start`) with this checklist to select initial tasks.

## 8. Execution & Continuous Refinement

- Use `execute-next-task` to work through Subtasks one by one, updating this checklist and Notes & Learnings after each execution.

## 9. Meta-Reflection and Iteration

- Periodically reflect on whether the tests being added are genuinely protecting important behaviors and whether any prompt-consumer paths remain untested.

## 10. Research→Action Pairing

- For every `[RESEARCH]` subtask you add to this checklist, ensure there is a paired `[IMPLEMENT]` or `[VALIDATE]` subtask that adds or verifies tests for the discovered paths.

## 11. Task & Subtask Naming Conventions

- Follow the same naming and tagging conventions as the original checklist-workflow evaluation checklist (Major Task N, Subtask N.X [PREFIX], tags for priority/complexity/phase/tools).

## 12. Next Task / Next Session Focus

- Neutral note to record the single best next checklist subtask for upcoming work:
  - NEXT_SESSION_FOCUS: None — Initial discovery indicates there are no in-repo prompt-consumer modules; any further work on tests would need to focus on external systems (such as Codex CLI) or be defined as a broader initiative that explicitly includes those environments.
