---
description: Implement fixes identified in evaluation report
argument-hint: EVALUATION_REPORT=<path-to-evaluation-report> BRANCH_NAME=<branch-name>
---

# Implementation: Address Evaluation Findings

## Task Context and Permissions

**This is a fix implementation task following code review.** You have explicit permission to:
- Work directly on the branch specified in $BRANCH_NAME without creating a new feature branch
- Skip the "create feature branch from main" step mentioned in AGENTS.md
- Commit fixes directly to $BRANCH_NAME as you complete them

The normal branching workflow in AGENTS.md applies to new development. For this task, you are addressing issues identified in a code review on an existing branch.

---

## Your Mission

Read the evaluation report at $EVALUATION_REPORT and implement the fixes identified. Work systematically through the issues, prioritizing critical and high-severity problems first, while also addressing documentation gaps, test quality issues, and code hygiene items.

## Phase 1: Understand the Evaluation

1. **Read the evaluation report completely** at $EVALUATION_REPORT
2. **Read `AGENTS.md`** to ensure you follow project conventions (tooling, commands, testing)
3. **Extract key information from the report**:
   - All issues organized by severity (Critical/High/Medium/Low)
   - Cross-file consistency issues that span multiple files
   - Documentation gaps that need addressing
   - Test quality issues and coverage gaps
   - Code hygiene items (dead code, duplication, etc.)
   - Breaking changes identified
   - Configuration and environment concerns
   - Implementation strengths to preserve
   - Fix roadmap with dependencies
   - File operations checklist
4. **Note commit context**: Pay attention to which commits introduced each issue
5. **Understand the fix roadmap**: Review the dependency graph and parallelization opportunities
6. **Check for breaking changes**: Understand backward compatibility concerns

## Phase 2: Plan Your Approach

Before making any changes:

1. **Organize fixes by the roadmap**: Use the "Fix Implementation Roadmap" section from the evaluation
   - Identify fixes with no dependencies (can start immediately)
   - Note which fixes unblock other work
   - Understand what can be done in parallel vs. sequentially

2. **Group related changes**: Plan to fix related issues together
   - Cross-file consistency issues affecting the same feature
   - Documentation gaps for the same component
   - Test improvements for the same module
   - Code hygiene in the same file

3. **Identify non-code work**: Plan for:
   - Documentation updates (README, API docs, comments)
   - Test additions or improvements
   - Configuration file updates
   - Dead code removal
   - Breaking change migration guides (if needed)

4. **Preserve identified strengths**: Note the "Implementation Strengths" section
   - Understand what patterns are working well
   - Ensure your fixes don't regress these good practices
   - Emulate these patterns in your fixes

## Phase 3: Verify Current State

Before making changes:

1. **Confirm you're on the correct branch**: `git checkout $BRANCH_NAME`
2. **Check the current state**: `git status` and `git log --oneline -10`
3. **Review commit history**: Look at the commits mentioned in the evaluation
   ```bash
   # View specific commits that introduced issues
   git show <commit-hash>
   
   # See the development narrative
   git log --oneline <base-branch>..$BRANCH_NAME
   ```
4. **Verify the issues exist**: For each critical issue, confirm the problem is present in the code
5. **Run existing tests**: Establish a baseline (if tests exist)
   ```bash
   # Follow AGENTS.md conventions for running tests
   # Example: uv run pytest (if project uses uv and pytest)
   ```
6. **Check file structure**: Verify the "File Operations Checklist" aligns with actual state

## Phase 4: Implement Fixes Systematically

Work through fixes following the roadmap and priority levels:

### Priority 1: Critical Issues (Blocking)

Fix all critical issues first. For each:

1. **Read the issue details** from the evaluation report, including:
   - **First Appeared In**: The commit that introduced the problem
   - **Files Affected**: Exact paths and line numbers
   - **Current State** vs **Expected State**: What needs to change
   - **Verification Steps**: How to test the fix
   - **Dependencies**: What must be fixed first (if anything)

2. **Understand the context**: 
   - Review the commit that introduced the issue: `git show <commit-hash>`
   - Understand what the commit was trying to accomplish
   - This helps avoid breaking the original intent

3. **Check for related issues**: If the evaluation notes cross-file consistency problems, fix all related files together

4. **Implement the fix** following the "Expected State" guidance

5. **Test the fix** using the verification steps from the report
   - Follow AGENTS.md conventions for test commands
   - Run the specific verification command provided
   - Ensure the expected output is achieved

6. **Commit immediately** with a clear, detailed message:
   ```bash
   git add <affected-files>
   git commit -m "Fix: <brief description>
   
   Addresses critical issue from evaluation (commit <issue-source-commit>):
   <issue-title>
   
   Changes:
   - <specific change 1>
   - <specific change 2>
   - <specific change 3>
   
   Why this fixes the problem:
   <explanation of how changes resolve the issue>
   
   Verification: <command you ran>
   Result: <what happened - should match expected output>
   
   Related commits: <issue-source-commit>"
   ```

### Priority 2: High Severity Issues

After all critical issues are resolved, fix high-severity issues using the same process.

### Priority 3: Cross-File Consistency Fixes

The evaluation may have identified consistency issues across multiple files. Address these:

1. **Read the "Cross-File Consistency Issues" section** of the evaluation
2. **Fix all instances together** in a single commit to maintain consistency
3. **Verify consistency** by checking all affected call sites/references

Example:
```bash
# If evaluation found mismatched function signatures across module boundaries
# Fix all call sites and the definition together

git add src/api/endpoints.py src/services/user.py
git commit -m "Fix cross-file consistency: user_id type mismatch

Addresses consistency issue from evaluation.

Changes:
- src/api/endpoints.py:45: Cast user_id to int before passing to service
- src/services/user.py:123: Updated docstring to clarify int expected
- Added type hint to service function signature

All call sites now pass correct type to user service.

Verification: Ran integration tests, no type errors."
```

### Priority 4: Documentation Gaps

Address documentation gaps identified in the evaluation:

1. **Read the "Documentation Gaps" section** of the evaluation
2. **Update documentation** alongside or immediately after code fixes
3. **Common documentation updates**:
   - README.md: New features, CLI flags, configuration options
   - API documentation: Changed signatures, new endpoints
   - Inline docstrings: Complex functions, public APIs
   - CHANGELOG.md: User-visible changes
   - Migration guides: Breaking changes
   - Configuration examples: New environment variables

Example:
```bash
# Update README to document new CLI flags

git add README.md docs/cli-reference.md
git commit -m "Document new CLI flags for semantic pipeline

Addresses documentation gap from evaluation (related to commit <commit-hash>).

Added documentation for:
- --parallel: Enable parallel processing (default: false)
- --retry-limit: Maximum retry attempts (default: 3)

Updated:
- README.md: Usage examples section
- docs/cli-reference.md: Complete flag reference

Includes examples showing typical usage patterns."
```

### Priority 5: Test Quality Improvements

If the evaluation identified test quality issues:

1. **Read the "Test Quality Assessment" section**
2. **Add missing test coverage** for critical paths
3. **Fix brittle or unclear tests**
4. **Add edge case testing** where gaps were identified

Example:
```bash
# Add missing error path tests

git add tests/test_worker.py
git commit -m "Add error path test coverage for worker module

Addresses test quality issue from evaluation.

Added tests for:
- Worker timeout scenarios
- Connection failure handling
- Invalid input rejection
- Retry logic verification

Coverage improved from 45% to 87% for worker.py.

Verification: uv run pytest tests/test_worker.py -v
All new tests passing."
```

### Priority 6: Configuration & Environment Fixes

Address configuration and environment issues:

1. **Read "Configuration & Environment Concerns" section**
2. **Fix hardcoded values** with configurable options
3. **Add validation** for required configuration
4. **Update example configs** to reflect changes
5. **Document environment requirements**

Example:
```bash
# Replace hardcoded path with configurable option

git add src/loader.py config.example.yml
git commit -m "Make data directory configurable for cross-platform support

Addresses config issue from evaluation (commit <commit-hash>).

Changes:
- src/loader.py: Replaced hardcoded '/var/lib/app/data' with configurable path
- Uses pathlib for cross-platform path handling
- Falls back to './data' if not configured
- Added validation on startup

Config:
- Added DATA_DIR environment variable
- Updated config.example.yml with new option
- Works on Linux, macOS, and Windows

Verification: Tested on macOS and Linux, paths resolve correctly."
```

### Priority 7: Code Hygiene & Cleanup

Address code hygiene issues identified:

1. **Read "Code Hygiene Issues" section**
2. **Remove dead code** (unused functions, commented code)
3. **Eliminate duplication** through extraction
4. **Remove debug statements** not meant for production
5. **Address TODO comments** or link them to issues

Example:
```bash
# Clean up dead code and debug statements

git add src/utils/helpers.py src/api/debug.py
git commit -m "Remove dead code and debug statements

Addresses code hygiene items from evaluation.

Removed:
- src/utils/helpers.py: Unused format_legacy() function (never called)
- src/api/debug.py: Debug endpoint (commit <commit-hash>, not needed)
- All console.log statements in production code

TODOs:
- Converted 3 TODO comments to tracked issues (#123, #124, #125)
- Removed 2 TODOs that were already completed

Code is cleaner and easier to maintain."
```

### Priority 8: Medium and Low Issues

Fix these if time permits, or note them for follow-up.

## Phase 5: Handle Breaking Changes Carefully

If the evaluation identified breaking changes in the current implementation:

1. **Read "Breaking Changes Identified" section** carefully
2. **Understand the impact** on users/other systems
3. **Consider backward compatibility** options:
   - Can you maintain the old API while adding new?
   - Can you provide a deprecation period?
   - Is a migration script needed?

4. **If fixing a breaking change**:
   - Add backward compatibility if possible
   - Update migration documentation
   - Add deprecation warnings if phasing out old behavior
   - Test both old and new code paths

5. **Document breaking changes**:
   - Update CHANGELOG.md with clear migration instructions
   - Add migration guide if needed
   - Update version number appropriately

Example:
```bash
git add src/api/users.py CHANGELOG.md docs/migration-v2.md
git commit -m "Add backward compatibility for user creation endpoint

Addresses breaking change from evaluation (commit <commit-hash>).

Changes:
- Support both old parameter name 'user_name' and new 'username'
- Log deprecation warning when old parameter used
- Will remove old parameter in v3.0

Documentation:
- Added migration guide in docs/migration-v2.md
- Updated CHANGELOG.md with deprecation notice
- Set removal timeline for v3.0 (6 months)

Both old and new callers continue working."
```

## Phase 6: Preserve Implementation Strengths

As you make fixes, ensure you don't regress the good patterns identified:

1. **Review "Implementation Strengths" section** before modifying related code
2. **Maintain the same quality level** in your fixes
3. **Emulate good patterns** when adding new code
4. **Don't refactor working code** unless fixing an issue

For example, if the evaluation praised error handling in the worker pool, ensure your fixes to other modules use similarly robust error handling.

## Phase 7: Verification and Testing

After implementing fixes:

1. **Run all verification commands** specified in the evaluation report's "Testing & Verification Plan"

2. **Follow the verification plan** for each fix:
   ```bash
   # Example from evaluation report
   # Fix: Semantic CLI Flags
   # Test Command: ./scripts/pipeline-e2e.sh --until semantic
   # Expected Output: Semantic stage completes, seed file generated
   # Failure Signs: Script fails with "unrecognized arguments" error
   ```

3. **Run project test suite** (following AGENTS.md conventions):
   ```bash
   # Example: if project uses uv and pytest
   uv run pytest
   
   # Run with coverage if evaluation noted coverage gaps
   uv run pytest --cov=src --cov-report=term-missing
   ```

4. **Perform manual smoke tests** if applicable:
   - Test the main user workflows
   - Verify critical functionality still works
   - Check that fixes actually resolve the issues

5. **Check for regressions**:
   - Ensure fixes didn't break existing functionality
   - Verify that implementation strengths are preserved
   - Test edge cases and error paths

6. **Verify cross-file consistency**:
   - If you fixed consistency issues, verify all related files are aligned
   - Check all call sites and references

## Implementation Guidelines

### Code Quality Standards
- **Follow existing code style** and patterns in the project
- **Maintain consistency** with patterns praised in "Implementation Strengths"
- **Add comments** for complex logic (following project conventions)
- **Use meaningful variable/function names**
- **Handle edge cases** and errors appropriately (emulate good error handling from strengths)
- **Follow project conventions** from AGENTS.md rigorously
- **Write tests** for new code or modified behavior
- **Update documentation** alongside code changes

### Commit Message Best Practices

Each commit should reference the evaluation context:

```
<type>: <brief description>

Addresses <severity> issue from evaluation (commit <issue-source-commit>):
<issue-title from evaluation>

Changes:
- <specific change 1>
- <specific change 2>

Why this fixes the problem:
<explanation>

[Optional] Breaking changes:
<if applicable, describe and reference migration docs>

Verification: <command>
Result: <outcome>

Related commits: <issue-source-commit>
```

**Commit types:**
- `fix`: Bug fixes and error corrections
- `docs`: Documentation updates
- `test`: Test additions or improvements
- `refactor`: Code cleanup, dead code removal
- `config`: Configuration changes
- `chore`: Dependency updates, tooling

### When to Ask for Help

Stop and ask for clarification if:
- The evaluation report is ambiguous or contradictory
- The suggested fix would require architectural changes not mentioned in the plan
- You discover additional issues not in the report
- A fix would break existing functionality or regress implementation strengths
- You cannot reproduce the issue described
- The verification steps don't work as described
- You're unsure how to handle a breaking change
- Cross-file consistency fixes affect more files than mentioned
- Test coverage improvements would require significant time
- Documentation updates require domain knowledge you don't have

### Working with Commit Context

The evaluation provides "First Appeared In" commits for each issue. Use this:

1. **Understand the original intent**:
   ```bash
   git show <issue-source-commit>
   ```
   
2. **See what else changed** in that commit:
   ```bash
   git show <issue-source-commit> --stat
   ```

3. **Check if other files** from that commit need similar fixes:
   ```bash
   git diff <commit-hash>^..<commit-hash>
   ```

4. **Reference the source commit** in your fix commit message

This helps maintain a clear chain of reasoning in the git history.

### Handling Multiple Related Issues

If multiple issues stem from the same commit or affect the same component:

1. **Group related fixes** in a single commit
2. **Fix all instances** of a pattern together
3. **Test comprehensively** to ensure all variants are addressed

Example:
```bash
# Multiple CLI flag mismatches all from same commit
git add scripts/pipeline-e2e.sh scripts/semantic/generate_catalog.py scripts/semantic/analyze.py
git commit -m "Fix all CLI flag mismatches in semantic pipeline

Addresses 3 related issues from evaluation (all from commit a1b2c3d).

Changed all semantic scripts to use consistent flags:
- --taxonomy instead of --taxonomy-path
- --out instead of --output-path
- --config instead of --config-file

Files updated:
- scripts/pipeline-e2e.sh: E2E harness invocations
- scripts/semantic/generate_catalog.py: Catalog generator
- scripts/semantic/analyze.py: Analyzer script

All scripts now follow same flag convention.

Verification: Ran full pipeline end-to-end, all stages passed."
```

## Phase 8: Final Review and Summary

After completing fixes:

1. **Review your commits**: 
   ```bash
   git log --oneline origin/main..HEAD
   ```

2. **Check what changed**: 
   ```bash
   git diff origin/main...HEAD --stat
   ```

3. **Verify all critical issues addressed**: Cross-reference with evaluation report
   - Go through each critical issue and confirm it's fixed
   - Check each high-severity issue
   - Verify documentation gaps are filled
   - Confirm test improvements were made

4. **Run comprehensive verification**:
   - All verification commands from the evaluation report
   - Full test suite (if available)
   - Integration tests (if applicable)
   - Manual smoke tests of critical paths

5. **Check for regressions**:
   - Verify implementation strengths are preserved
   - Ensure no new issues introduced
   - Confirm backward compatibility maintained (if relevant)

6. **Review breaking changes** (if any):
   - Verify migration documentation is complete
   - Check backward compatibility measures are in place
   - Confirm deprecation warnings are added

## Phase 9: Create Comprehensive Summary

Create a detailed summary in `scratchpaper/fix_summary.md`:

```markdown
# Fix Implementation Summary

**Evaluation Report**: ${EVALUATION_REPORT}
**Branch**: $BRANCH_NAME
**Date**: <current date>
**Time Spent**: <approximate time>

## Executive Summary

<2-3 paragraph overview of what was accomplished>

## Issues Addressed

### Critical Issues Fixed
- [x] **Issue: <title>** (from commit <source-commit>)
  - Fix Commit: <commit-hash>
  - Files Changed: <list>
  - Verification: ✅ <result>
  - Notes: <any relevant details>

- [x] **Issue: <title>** (from commit <source-commit>)
  - Fix Commit: <commit-hash>
  - Files Changed: <list>
  - Verification: ✅ <result>

### High Severity Issues Fixed
- [x] **Issue: <title>** (from commit <source-commit>)
  - Fix Commit: <commit-hash>
  - Files Changed: <list>
  - Verification: ✅ <result>

### Cross-File Consistency Fixes
- [x] **Consistency: <description>**
  - Fix Commit: <commit-hash>
  - Files Changed: <list>
  - Verification: ✅ All instances now consistent

### Documentation Updates
- [x] **Gap: <description>**
  - Fix Commit: <commit-hash>
  - Files Updated: <list>
  - Content Added: <summary>

### Test Improvements
- [x] **Test Quality: <description>**
  - Fix Commit: <commit-hash>
  - Coverage: <before>% → <after>%
  - New Tests: <count and type>

### Configuration & Environment Fixes
- [x] **Config Issue: <description>**
  - Fix Commit: <commit-hash>
  - Changes: <summary>
  - Platform Support: <details>

### Code Hygiene
- [x] **Cleanup: <description>**
  - Fix Commit: <commit-hash>
  - Removed: <what was cleaned up>
  - Impact: <benefits>

### Medium/Low Issues Addressed
- [x] **Issue: <title>**
  - Fix Commit: <commit-hash>
  - Verification: ✅ <result>

### Issues Deferred
- [ ] **Issue: <title>**
  - Severity: <level>
  - Reason Deferred: <explanation>
  - Recommended Follow-up: <suggestion>

## Breaking Changes Handled

<If any breaking changes were addressed>

- **Change**: <description>
  - Backward Compatibility: <yes/no/partial>
  - Migration Guide: <path to documentation>
  - Deprecation Timeline: <if applicable>

## Implementation Strengths Preserved

The following patterns identified as strengths were maintained/emulated:

- **Strength**: <description>
  - Preserved in: <fixes that maintained this pattern>
  - Emulated in: <new code that followed this pattern>

## Testing Summary

### Verification Commands
All verification steps from evaluation report executed:
- ✅ Command 1: <result>
- ✅ Command 2: <result>
- ✅ Command 3: <result>

### Project Test Suite
- **Unit Tests**: ✅ Pass / ❌ Fail / ⚠️ Not Run
- **Integration Tests**: ✅ Pass / ❌ Fail / ⚠️ Not Run
- **E2E Tests**: ✅ Pass / ❌ Fail / ⚠️ Not Run

### Test Coverage
- **Before**: <percentage>
- **After**: <percentage>
- **Change**: +<difference>

### Manual Smoke Tests
- ✅ Test 1: <description and result>
- ✅ Test 2: <description and result>

### Regression Testing
- ✅ No regressions detected in existing functionality
- ✅ Implementation strengths preserved
- ✅ Backward compatibility maintained (if applicable)

## Commit Summary

Total commits: <count>

<list of all commit hashes with short descriptions>

```
a1b2c3d - Fix semantic CLI flags in E2E harness
b2c3d4e - Document new CLI flags
c3d4e5f - Add error path test coverage
d4e5f6g - Remove dead code and debug statements
e5f6g7h - Fix cross-file consistency: user_id type mismatch
f6g7h8i - Make data directory configurable
g7h8i9j - Add fix implementation summary
```

## Files Changed

<comprehensive list of all files modified, created, or deleted>

**Modified**:
- <file-path> (<commit-hash>) - <what changed>
- <file-path> (<commit-hash>) - <what changed>

**Created**:
- <file-path> (<commit-hash>) - <purpose>

**Deleted**:
- <file-path> (<commit-hash>) - <reason>

## Notes and Observations

### Unexpected Issues Found
- <Any issues discovered during implementation that weren't in the report>

### Implementation Challenges
- <Any difficulties encountered and how they were resolved>

### Recommendations for Future Work
- <Suggestions for follow-up improvements>
- <Technical debt to address>
- <Process improvements>

### Questions for Review
- <Any concerns or questions for code reviewers>

## Next Steps

1. <Immediate next action, e.g., "Push changes to remote">
2. <Follow-up work, e.g., "Address deferred medium-priority issues">
3. <Long-term, e.g., "Plan for v3.0 breaking changes">

## Acknowledgments

Evaluation report identified:
- <count> critical issues → all fixed
- <count> high severity issues → all fixed
- <count> cross-file consistency issues → all fixed
- <count> documentation gaps → all filled
- <count> test quality issues → all addressed
- <count> code hygiene items → all cleaned

Implementation strengths preserved: <count>
Total commits: <count>
Files changed: <count>
```

Commit the summary:
```bash
git add scratchpaper/fix_summary.md
git commit -m "Add comprehensive fix implementation summary

Summary includes:
- All issues addressed with commit references
- Complete testing and verification results
- Breaking changes handled
- Implementation strengths preserved
- Recommendations for follow-up work

All critical and high-severity issues from evaluation resolved."
```

## Important Reminders

- **Follow AGENTS.md conventions** for all commands (e.g., use `uv run` not `python` if that's the project standard)
- **Leverage commit context** - understand why problematic code was written that way
- **Follow the fix roadmap** - respect dependencies and sequencing
- **Address all issue categories** - not just code bugs, but docs, tests, config, hygiene
- **Preserve implementation strengths** - don't regress good patterns
- **Handle breaking changes carefully** - maintain backward compatibility when possible
- **Test comprehensively** - run all verification commands from evaluation
- **Commit frequently** - one logical fix at a time with detailed messages
- **Update documentation** - keep docs in sync with code changes
- **Stay focused** - fix what's in the report, avoid scope creep
- **Ask when uncertain** - it's better to ask than to make the wrong change

## Example Complete Workflow

```bash
# 1. Ensure you're on the right branch
git checkout $BRANCH_NAME
git status

# 2. Read the evaluation report thoroughly
cat ${EVALUATION_REPORT}

# 3. Read project conventions
cat AGENTS.md

# 4. Review the fix roadmap section
# Note dependencies and prioritization

# 5. Check commit context for first critical issue
git show <issue-source-commit>

# 6. Start with first critical issue (no dependencies)
# ... make changes to affected files ...

# 7. Test the fix using verification command from evaluation
uv run ./scripts/pipeline-e2e.sh --until semantic
# ✅ Semantic stage completed successfully

# 8. Commit with detailed message
git add scripts/pipeline-e2e.sh scripts/semantic/generate_metric_catalog_seed.py
git commit -m "Fix semantic CLI flag mismatch in E2E harness

Addresses critical issue from evaluation (commit b2c3d4e):
'Mismatched CLI Flags in Semantic Scripts'

Changes:
- scripts/pipeline-e2e.sh: Changed --taxonomy-path to --taxonomy
- scripts/pipeline-e2e.sh: Changed --output-path to --out
- Fixed taxonomy path from directory to actual file path
- scripts/semantic/generate_metric_catalog_seed.py: Verified flags match

Why this fixes the problem:
The E2E harness was using old CLI flag names that don't exist in the
actual script implementation. This caused immediate failure when running
the semantic stage. Now flags match the actual argument parser.

Verification: ./scripts/pipeline-e2e.sh --until semantic
Result: Semantic stage completed, seed file generated at expected path

Related commits: b2c3d4e"

# 9. Move to next issue (check roadmap for dependencies)
# ... repeat fix, test, commit cycle ...

# 10. Address cross-file consistency issues together
git add src/api/endpoints.py src/services/user.py
git commit -m "Fix cross-file consistency: user_id type mismatch

Addresses consistency issue from evaluation.

Changes:
- src/api/endpoints.py:45: Cast user_id to int before passing to service  
- src/services/user.py:123: Updated docstring to clarify int expected
- Added type hint: def get_user(user_id: int) -> User

All call sites now pass correct type to user service.

Verification: uv run pytest tests/integration/test_user_api.py -v
Result: All tests passing, no type errors"

# 11. Fix documentation gaps
git add README.md docs/cli-reference.md
git commit -m "docs: Document new CLI flags for semantic pipeline

Addresses documentation gap from evaluation (related to commit b2c3d4e).

Added documentation for:
- --taxonomy: Path to taxonomy YAML file (was undocumented)
- --out: Output path for generated seed file (was undocumented)
- --parallel: Enable parallel processing (default: false)

Updated:
- README.md: Usage examples section with complete flag reference
- docs/cli-reference.md: Full CLI documentation with examples

Includes examples showing typical usage patterns and common workflows."

# 12. Improve test coverage
git add tests/test_worker.py
git commit -m "test: Add error path coverage for worker module

Addresses test quality issue from evaluation.

Added tests for:
- Worker timeout scenarios (test_worker_timeout)
- Connection failure handling (test_worker_connection_failure)
- Invalid input rejection (test_worker_invalid_input)
- Retry logic verification (test_worker_retry_logic)

Coverage improved: 45% → 87% for src/workers/pool.py

Verification: uv run pytest tests/test_worker.py -v --cov=src/workers
Result: All 12 tests passing, coverage at 87%"

# 13. Clean up code hygiene items
git add src/utils/helpers.py src/api/debug.py
git commit -m "chore: Remove dead code and debug statements

Addresses code hygiene items from evaluation.

Removed:
- src/utils/helpers.py: format_legacy() function (never called, introduced in commit d4e5f6g)
- src/api/debug.py: Entire debug endpoint file (not needed in production)
- console.log statements in 3 files (left from development)

TODOs addressed:
- Converted 3 untracked TODO comments to GitHub issues (#123, #124, #125)
- Removed 2 completed TODOs

Impact: Cleaner codebase, easier maintenance, no confusion from unused code"

# 14. Run comprehensive testing
uv run pytest --cov=src --cov-report=term-missing
# ✅ All tests passing, coverage at 82%

# 15. Run all verification commands from evaluation
./scripts/pipeline-e2e.sh
# ✅ Complete pipeline runs successfully

# 16. Create summary
cat > scratchpaper/fix_summary.md << 'EOF'
# Fix Implementation Summary
... (complete summary as shown above) ...
EOF

git add scratchpaper/fix_summary.md
git commit -m "Add comprehensive fix implementation summary

Summary includes:
- 4 critical issues fixed
- 3 high severity issues fixed  
- 2 cross-file consistency issues fixed
- 3 documentation gaps filled
- 1 test quality improvement (45% → 87% coverage)
- 2 configuration issues resolved
- 3 code hygiene items cleaned

All critical and high-severity issues from evaluation resolved.
Implementation strengths preserved.
All verification tests passing."

# 17. Final review
git log --oneline origin/main..HEAD
git diff origin/main...HEAD --stat

# 18. Push changes (when ready)
git push origin $BRANCH_NAME
```

---

Now begin by reading the evaluation report and planning your approach. Show me your implementation plan before starting the fixes.