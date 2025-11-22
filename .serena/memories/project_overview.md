# Project Overview
- Purpose: Codex CLI support repo containing configuration, prompts, and product-planning artifacts for agentic workflows ("codex-dotfiles" / Python package name `codex-git-ops`). Primary assets live under `.codex/` (docs, prompts, templates, scripts) plus root config (pyproject, config.toml). Note: domain-specific app code is not present here; focus is on workflow tooling.
- Tech stack: Python 3.12+; dependencies: pyyaml. Dev tooling: ruff, mypy, pre-commit, bandit, pip-audit. Tooling config in `pyproject.toml`. MCP servers configured in `config.toml` (sequential-thinking, memory, context7, filesystem, serena, figma).
- Key instructions: follow AGENTS/MASTER_AGENTS guidance (non-negotiable planning thoroughness, scope limits for other projects, ABOUTME headers on files where syntax allows, no shortcuts). Use feature branches; do not revert unrelated changes.
- Layout (high level):
  - `.codex/PRODUCTPLAN.md` and templates/docs/prompts for product planning.
  - `pyproject.toml`, `uv.lock`, `config.toml` at root.
  - Pre-commit config and tooling caches (`.ruff_cache`, `.mypy_cache`).
- Caution: No README present; assumptions about purpose based on structure and config.
