# Style and Conventions
- Language: Python 3.12; follow AGENTS/MASTER_AGENTS rules (no shortcuts, thorough planning).
- Naming: descriptive, no abbreviations; avoid temporal terms; follow snake_case for Python; ABOUTME 2-line header required when syntax allows.
- Lint/format: use `ruff` (configured target-version py312); formatting by ruff format. Type hints encouraged; mypy configured with `ignore_missing_imports = true`.
- Security/quality: bandit and pip-audit available (dev deps). Non-negotiable testing ethos: unit/integration/E2E; TDD preferred per instructions.
- Comments: describe current behavior only; keep concise. Preserve existing comments unless provably false.
- Branch/VC: feature branches, small atomic commits, no destructive resets; respect scope limits defined by user instructions.
