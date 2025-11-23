# Product Plan - Execution Sequence

## Standard Sequence
Run through the custom prompts in this sequence.

### Foundational Artifacts
/product-plan-brainstorm
/product-plan-vision
/product-plan-strategy
/product-plan-roadmap
/product-plan-personas
/product-plan-metrics
/product-plan-prd
/product-plan-development-considerations

After completing the Foundation Artifacts, run:

/product-plan-foundation-validation-check

### Development Artifacts
/product-plan-epics
/product-plan-features
/product-plan-user-stories

After completing the Development Artifacts, run:

/product-plan-foundation-validation-check

## Flexibility Options

### Managed Unknowns
- Use "TBD-[specific reason]" when information is genuinely unavailable
- Must include confidence assessment and follow-up tracking
- Identify workarounds to maintain forward momentum
- Forbidden to use TBD for information obtainable through better questioning

## Checklist Workflow Prompts Overhaul (summary)

- Scope: Overhauled `.codex/prompts/checklist-workflow/*` and the associated checklist structure so that initiatives are driven by a canonical checklist schema and a non-time-bound “single best next task” loop.
- Schema: Defined a shared status/ID convention (markdown checkboxes with blocked annotations, Major Task/ Subtask IDs like `N`, `N.A`, `N.A.1`, and prefixes `[PLAN]/[RESEARCH]/[IMPLEMENT]/[VALIDATE]/[DOC]`) and ensured all checklist-workflow prompts and checklists adhere to it.
- Planning & execution: Tightened the `start` → `plan-to-checklist` contract and updated `session-start`, `execute-next-task`, `review-checklist`, and `session-end` so they coordinate via `RECOMMENDED_NEXT_TASK` and `NEXT_SESSION_FOCUS`, always choosing a single best next task without relying on daily/session-specific concepts.
- Working memory: Made the checklist explicitly serve as working memory for each initiative (planning, execution, validations, and reasoning), with guardrails that treat a drifting or stale checklist as a process violation.
- Known limitations: Prompt behavior is aligned and validated via paper dry runs; environment-level checks like `uv run pre-commit run --all-files` and `uv run pytest` should still be run in a healthy local environment before treating any future checklist-workflow changes as fully approved.
