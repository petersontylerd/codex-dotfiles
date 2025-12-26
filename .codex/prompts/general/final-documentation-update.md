# Pre-Commit Documentation Audit

Before committing and merging to main, perform a comprehensive documentation review to ensure all project files accurately reflect our recent changes.

## Evaluation Criteria

For each file category below, systematically check whether our recent implementation requires updates. Identify:
1. **Outdated information** - Content that contradicts new implementations
2. **Missing information** - New features, APIs, or configurations not documented
3. **Incorrect examples** - Code samples that no longer work or reference deprecated patterns
4. **Broken references** - Links to renamed/moved files or removed functionality

## Files to Review

### High Priority
- [ ] **README.md** - Installation, setup, usage instructions, feature list
- [ ] **AGENTS.md** - AI agent context, project structure, development guidelines
- [ ] **CHANGELOG.md** / **HISTORY.md** - Version history and notable changes

### Documentation Directory
- [ ] **./docs/** - All markdown files, especially:
  - Architecture diagrams
  - API documentation
  - Configuration guides
  - Deployment instructions
  - Troubleshooting guides

### Code-Level Documentation
- [ ] **Inline comments** - Docstrings, function headers, complex logic explanations
- [ ] **package.json** / **pyproject.toml** / - Dependencies, scripts, metadata
- [ ] **Environment files** - .env.example, config templates

## Output Format

For each file requiring changes, provide:
```
File: [path/to/file]
Issue: [What's outdated/missing]
Current State: [Brief description or quote of current content]
Required Update: [Specific change needed]
Priority: [High/Medium/Low]
```

If no changes are needed, respond with: "✓ All documentation is current and accurate."

## Final Step

After proposing updates, ask: "Should I proceed with implementing these documentation changes?"