# Suggested Commands
- Setup: `uv sync` (install dependencies from pyproject/uv.lock).
- Lint/format/type: `uv run pre-commit run --all-files` (runs ruff, mypy, etc. per hooks).
- Tests: `uv run pytest` (if/when tests exist); follow TDD per instructions.
- Security: `uv run bandit -r .`, `uv run pip-audit` (dev deps available).
- Tooling: `uv run` as prefix for repo Python scripts (per AGENTS guidance).
- Git hygiene: `git status`, `git checkout -b feat/<slug>`, `git add <paths>`, `git commit -m "type(scope): message"`, merge via PR then delete branch.
- Utilities (Linux): `ls`, `find`, `rg`, `cat`, `sed`, `awk` for navigation/search.
