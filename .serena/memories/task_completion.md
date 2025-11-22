# Task Completion Checklist
- Ensure feature branch in use (`feat/<slug>`); keep scope limited and commits atomic.
- Run quality checks: `uv run pre-commit run --all-files`; add `uv run pytest` (or relevant tests) when applicable; consider `uv run bandit -r .` and `uv run pip-audit` if security-sensitive.
- Validate against instructions: adhere to AGENTS/MASTER_AGENTS, ABOUTME headers, naming rules, no shortcuts in planning/explanation.
- Confirm no changes outside allowed scope (as per user-specific constraints when provided).
- Update checklist/notes artifacts under `.codex` or scratchpaper as required; ensure append-only history and rationale captured.
- Verify git status clean; prepare PR/merge then delete branch after merge.
