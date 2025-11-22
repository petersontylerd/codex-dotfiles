# Codebase Structure (High Level)
- Root: `pyproject.toml`, `uv.lock`, `config.toml`, `.pre-commit-config.yaml`, `AGENTS.md`, `MASTER_AGENTS.md`.
- `.codex/`: product planning and prompt assets (PRODUCTPLAN.md, docs, prompts, templates, scripts).
- Tool caches: `.ruff_cache`, `.mypy_cache`; virtual env `.venv`; Serena state `.serena`.
- No primary application source tree present; repo mainly hosts configuration, prompts, and planning artifacts.
