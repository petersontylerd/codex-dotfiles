---
description: Evaluate implementation completeness, quality, sensibility, and safety against plan
argument-hint: PLAN_PATH=<plan-path> BRANCH_NAME=<branch-name> OUTPUT_PATH=<output_path>
---

# Code Review: Implementation Evaluation

Please perform a thorough evaluation of all work completed on the provided branch (committed and uncommitted changes) in this repository against the implementation plan located at $PLAN_PATH. 

## Task Context and Permissions

**This is an evaluation task, not new development.** You have explicit permission to:
- Evaluate the branch specified in $BRANCH_NAME without creating a new feature branch

## Review Prioritization Strategy

**Time-boxed review approach:**
1. **First 15 minutes**: Skim all commit messages and changed file list to get overview
2. **Next 30 minutes**: Deep dive on critical paths (security, data integrity, core business logic)
3. **Next 30 minutes**: Review tests and error handling
4. **Next 15 minutes**: Check documentation and configuration
5. **Final 15 minutes**: Look for code quality issues, duplication, style

**Risk-based focus areas (prioritize in this order):**
1. 🔴 **Security-sensitive code**: Authentication, authorization, input validation, cryptography
2. 🔴 **Data integrity**: Database operations, file I/O, state mutations
3. 🟡 **Error handling**: Exception paths, failure modes, recovery mechanisms
4. 🟡 **External interfaces**: APIs, CLI, configuration, protocols
5. 🟢 **Internal logic**: Business logic, algorithms, utilities
6. 🟢 **Code quality**: Style, duplication, organization

**If short on time, you can skip:**
- Cosmetic issues (formatting, naming) unless egregious
- Minor optimizations that don't affect correctness
- Overly detailed test reviews (just verify coverage exists)

## Exploration Methodology

Follow this systematic approach to explore and evaluate the work:

### Phase 1: Understanding the Plan
1. Read the entire plan document at $PLAN_PATH
2. **Read `AGENTS.md` to understand project conventions**: This file contains critical guidance on tooling, commands, and workflows used in this project. Following these conventions ensures your recommendations are executable and aligned with project standards.
3. Extract and list all specific deliverables, requirements, and success criteria from the plan
4. Note any architectural decisions, constraints, or dependencies mentioned
5. Create a mental checklist of what should be implemented

### Phase 2: Discovering Changes
1. **Identify the comparison baseline**: Determine the base branch (likely `main` or `master`)
2. **List all changed files**: Use `git diff --name-status <base-branch>...$BRANCH_NAME` to see what files were added, modified, or deleted
3. **Review commit history**: Use `git log <base-branch>..$BRANCH_NAME --oneline` to understand the development narrative
4. **Create a commit map**: Use `git log <base-branch>..$BRANCH_NAME --name-status` to see which files were changed in which commits
5. **Check for uncommitted changes**: Use `git status` and `git diff` to see work in progress
6. **Identify new dependencies**: Check for changes in package files (package.json, requirements.txt, go.mod, etc.)
7. **Look for configuration changes**: Examine config files, environment templates, or settings

### Phase 3: Deep Dive Analysis with Commit Tracking
For each area mentioned in the plan:

1. **Map plan items to code changes**: Cross-reference each requirement with actual file changes
2. **Read the actual code**: Don't just look at diffs—read complete files to understand context
3. **Track commit provenance**: For each file or section of interest, use `git log -p <base-branch>..$BRANCH_NAME -- <file-path>` to see when and how it changed
4. **Identify line-level origins**: Use `git blame <file-path>` or `git log -L <start>,<end>:<file-path>` to find which commit introduced specific lines
5. **Trace execution paths**: Follow how new code integrates with existing code
6. **Check for tests**: Look in test directories for new or modified test files
7. **Review documentation**: Check README files, comments, and doc changes
8. **Examine related files**: If a module was changed, check its imports, dependents, and related components

### Phase 3.5: Cross-File Consistency Analysis
Check for consistency issues that span multiple files:

**API Contracts:**
- Function signatures match between definition and all call sites
- Parameter types/names consistent across interfaces
- Return value handling matches what functions actually return

**Configuration Consistency:**
- Environment variable names match between docs, code, and config files
- Default values consistent across all references
- Required vs optional settings documented and enforced consistently

**Documentation Sync:**
- README examples match actual API/CLI signatures
- Inline comments reflect actual behavior
- API documentation matches implementation

**Naming Consistency:**
- Same concepts use same terminology throughout codebase
- Variable/function naming follows project conventions across all new files

Git commands to help:
```bash
# Find all files that reference a specific function/variable
git grep -n "function_name" $(git diff --name-only <base>..$BRANCH_NAME)

# Check for inconsistent patterns across changed files
git diff <base>..$BRANCH_NAME | grep -E "(TODO|FIXME|XXX|HACK)"
```

### Phase 3.6: Documentation Synchronization Check

For every changed file, check if related documentation was updated:

**Documentation Types to Check:**
1. **README.md**: Examples, installation steps, usage instructions
2. **API docs**: Docstrings, OpenAPI/Swagger specs, generated docs
3. **Configuration docs**: Environment variables, config file examples
4. **CHANGELOG.md**: Entry for user-visible changes
5. **Migration guides**: If breaking changes exist
6. **Inline comments**: Especially for complex logic

**Detection Method:**
```bash
# Find code files changed without doc updates
git diff --name-only <base>..$BRANCH_NAME '*.py' '*.js'
git diff --name-only <base>..$BRANCH_NAME '*.md' 'docs/*'

# Check if function signatures changed but docstrings didn't
git diff <base>..$BRANCH_NAME -U5 | grep -A5 "^[+-]def "
```

**Common Documentation Gaps:**
- New CLI flags not in --help text or README
- New config options not in config.example or docs
- Changed error messages not reflected in troubleshooting guides
- New dependencies not in installation instructions
- Modified APIs not reflected in API documentation

### Phase 3.7: Code Hygiene Check

**Dead Code Detection:**
- Unused imports in new/modified files
- Functions/classes defined but never called
- Commented-out code blocks (should be removed, not commented)
- TODO/FIXME comments without issue references
- Debug print statements or logging left in

**Duplication Detection:**
- Similar code blocks that could be extracted to shared functions
- Copy-pasted logic that should be abstracted
- Redundant error handling patterns

**Tools to Use:**
```bash
# Find unused imports (Python example, adapt for your language)
ruff check --select F401 <files>

# Find TODO/FIXME without tracking
git diff <base>..$BRANCH_NAME | grep -E "(TODO|FIXME)" | grep -v "#[0-9]"

# Find debug statements that shouldn't be committed
git diff <base>..$BRANCH_NAME | grep -E "(console\.log|print\(|debugger|pdb)"
```

### Phase 4: Exploration Questions to Answer
As you explore, actively seek answers to:

- What problem does each change solve?
- Which commit introduced each change?
- Are there alternative approaches that were considered?
- What edge cases are handled? What edge cases might be missing?
- How does this change interact with existing functionality?
- What could break because of this change?
- Are there performance implications?
- What happens if this code fails?
- Is there adequate logging and observability?
- Could this introduce security issues?
- When was this code last modified, and did that modification improve or degrade it?
- Are there inconsistencies across related files?
- Was related documentation updated?

## Commit Attribution Guidelines

For every issue and strength you identify, track its source:

### For Issues:
- **First Appearance**: Identify the commit that introduced the problematic code
  - Use: `git log -p <base-branch>..$BRANCH_NAME -- <file-path>` to find when lines were added
  - Use: `git blame <file-path>` to see commit hash for specific lines
  - For logic errors, trace back to the commit where the flawed logic was implemented
  
- **Uncommitted Issues**: If the problem exists in uncommitted changes, note this explicitly

### For Strengths:
- **Implementation or Fix Commit**: Identify the commit where the good practice was implemented or where a problem was fixed
  - Use: `git log --all --source --full-history -- <file-path>` to see complete history
  - For multi-commit features, identify the most recent commit that solidified the strength
  - Note if the strength evolved across multiple commits

### Helpful Git Commands:
```bash
# Find which commit last modified specific lines
git blame -L <start-line>,<end-line> <file-path>

# See all changes to a file with commit hashes
git log --oneline <base-branch>..$BRANCH_NAME -- <file-path>

# See detailed changes in a specific commit
git show <commit-hash>

# Find when specific lines were added/modified
git log -L <start-line>,<end-line>:<file-path>

# See which commits touched a file and what changed
git log -p <base-branch>..$BRANCH_NAME -- <file-path>

# List all commits with their changed files
git log <base-branch>..$BRANCH_NAME --name-status
```

## Evaluation Criteria

Assess the implementation across the following dimensions:

### 1. Completeness
- Are all planned changes implemented?
- Are there any missing features, functions, or components from the plan?
- Are there incomplete implementations or TODO comments that need addressing?
- Were any requirements from the plan overlooked?
- Are there partially implemented features that need completion?

### 2. Quality
- Code clarity and readability
- Proper error handling and edge case coverage
- Appropriate use of design patterns and best practices
- Code organization and modularity
- Documentation quality (comments, docstrings)
- Test coverage (if applicable)
- Performance considerations
- Consistency with existing codebase style

### 2.5. Test Quality (if tests exist)
Beyond checking if tests exist, evaluate:
- **Coverage Metrics**: What percentage of new code is covered? Use coverage tools if available
- **Test Isolation**: Do tests have external dependencies (databases, APIs, files)?
- **Test Clarity**: Are test names descriptive? Is the arrange-act-assert pattern clear?
- **Edge Cases**: Do tests cover error conditions, boundary values, null/empty inputs?
- **Test Data Quality**: Are test fixtures realistic? Are magic numbers explained?
- **Brittleness**: Will tests break if implementation details change slightly?
- **Performance**: Do tests run quickly or introduce CI/CD slowdowns?

Example finding format:
```
**Weak Test Coverage for Error Paths**
- Commit: a1b2c3d
- Files: tests/test_worker.py:45-67
- Issue: Tests only cover happy path; missing timeout, connection failure, invalid input cases
- Coverage: 45% of new code (below 80% project standard)
```

### 3. Sensibility
- Do the implementation choices align with the plan's intent?
- Are the solutions appropriate for the problems being solved?
- Is there unnecessary complexity or over-engineering?
- Are there simpler or more maintainable alternatives?
- Does the code follow the project's existing conventions and patterns?
- Are abstractions at the right level?

### 4. Safety
- Security vulnerabilities (injection attacks, authentication issues, etc.)
- Data validation and sanitization
- Proper handling of sensitive information
- Race conditions or concurrency issues
- Resource leaks (memory, file handles, connections)
- Potential for crashes or undefined behavior
- Error propagation and recovery mechanisms

### 5. Additional Considerations
- Breaking changes or backward compatibility issues
- Dependencies introduced (are they necessary and well-vetted?)
- Impact on existing functionality
- Configuration or environment requirements
- Deployment considerations
- Potential technical debt introduced
- Migration or upgrade paths needed

### 5.5. Breaking Changes Analysis

Create a matrix of potential breaking changes:

| Change Type | Location | Commit | Impact | Migration Path |
|-------------|----------|--------|---------|----------------|
| API signature | file.py:L45 | a1b2c3d | External callers break | Deprecated old, add new |
| Config schema | config.yml | b2c3d4e | Existing configs invalid | Migration script needed |
| Database schema | schema.sql | c3d4e5f | Data migration required | Add migration in deploy docs |

**Breaking Change Categories to Check:**
- ❌ Removed public functions/classes/methods
- ❌ Changed function signatures (params, return types)
- ❌ Renamed public APIs or CLI commands
- ❌ Changed configuration file formats or required fields
- ❌ Modified database schemas without migrations
- ❌ Changed environment variable names/meanings
- ❌ Altered API response formats
- ❌ Modified file formats or data serialization
- ❌ Changed default behaviors that users depend on

### 5.6. Configuration & Environment Issues

**Configuration Validation:**
- [ ] All required environment variables documented
- [ ] Default values sensible and secure (no default passwords/tokens)
- [ ] Config files internally consistent (no contradictory settings)
- [ ] Example configs provided and tested
- [ ] Secrets not hardcoded or committed
- [ ] Config validation on startup (fail-fast if misconfigured)

**Environment Assumptions:**
- What OS/platform is assumed?
- What file permissions are needed?
- What network access is required?
- What external services must be available?
- Are paths hardcoded or configurable?

Example finding format:
```
**Hardcoded File Path Assumes Linux**
- Commit: d4e5f6g
- File: src/loader.py:78
- Issue: `/var/lib/app/data` hardcoded, fails on Windows/macOS
- Fix: Use `pathlib` or config variable
```

## Output Format

Provide your evaluation as:

### 1. Executive Summary
Brief overview of the implementation status (2-3 paragraphs)

### 2. Commit Overview
Provide a summary of the commit history on this branch:
- Total number of commits
- Commit hash range (earliest to latest)
- Brief description of the development narrative based on commit messages

Example:
```
**Branch Commit Summary**
- Commits: 12 commits from a1b2c3d to x9y8z7w
- Development flow: Initial semantic pipeline setup → Schema changes → Integration work → Bug fixes
- Key commits:
  - a1b2c3d: "Add semantic analysis pipeline structure"
  - b2c3d4e: "Implement classification workers"
  - x9y8z7w: "Fix CLI argument handling"
```

### 3. Plan Coverage Matrix
For each major requirement from the plan:
- Status: ✅ Complete / ⚠️ Partial / ❌ Missing / ➕ Extra (not in plan)
- **Commit(s)**: Hash(es) where this was implemented
- Brief note on implementation

Example:
```
**Semantic Pipeline Integration**
- Status: ⚠️ Partial
- Commit(s): a1b2c3d, b2c3d4e
- Note: Core structure implemented but CLI flags mismatched
```

### 4. Critical Issues (Blocking Before Merge)
For each critical issue, provide:

**Issue Title**: Brief description

- **Severity**: Critical
- **First Appeared In**: Commit hash where the problem was introduced (or "Uncommitted" if in working directory)
- **Commit Details**: Brief commit message and date
- **Files Affected**: List with line numbers
- **Current State**: Show relevant code snippet demonstrating the problem
- **Expected State**: Show what the code should look like based on the plan
- **Why It's Critical**: Impact and risk if not fixed
- **Fix Complexity**: Simple / Moderate / Complex
- **Verification Steps**: How to test that the fix works

**IMPORTANT**: When showing code examples, use literal placeholder values or descriptive text in angle brackets. Do NOT use shell variable syntax with dollar signs, as these may be interpreted as variables to resolve.
- ✅ Good: `--taxonomy /path/to/taxonomy.yml` or `--taxonomy <taxonomy-file>`

Example format:
```
**Mismatched CLI Flags in Semantic Scripts**
- **Severity**: Critical
- **First Appeared In**: b2c3d4e
- **Commit Details**: "Add semantic script integration" (2024-01-15)
- **Files**: scripts/pipeline-e2e.sh:535-547, scripts/semantic/generate_metric_catalog_seed.py:121-151
- **Current State**: 
  ```bash
  generate_metric_catalog_seed.py --taxonomy-path <file> --output-path <file>
  ```
- **Expected State**:
  ```bash
  generate_metric_catalog_seed.py --taxonomy <file> --out <file>
  ```
- **Why It's Critical**: E2E harness will fail immediately at semantic stage
- **Fix Complexity**: Simple (argument name changes)
- **Verification**: Run `scripts/pipeline-e2e.sh --until semantic` and verify it completes
```

### 5. Detailed Findings by Severity
Organize remaining issues as: High / Medium / Low

For each issue:
- **Issue**: Brief title
- **Severity**: High/Medium/Low
- **First Appeared In**: Commit hash (or "Uncommitted")
- **Commit Message**: Brief message from the commit
- **Files**: Paths and line numbers
- **Current Behavior**: What happens now
- **Expected Behavior**: What should happen per plan
- **Code Context**: Relevant snippets (keep brief, 5-10 lines max)
- **Suggested Fix**: Concrete approach to resolve

### 6. Cross-File Consistency Issues
List any inconsistencies found across related files:

**Issue**: Brief description of inconsistency
- **Files Affected**: List of files with line numbers
- **Commits**: Where each conflicting version was introduced
- **Inconsistency Details**: Specific differences found
- **Impact**: How this affects functionality or maintainability
- **Recommended Resolution**: Which version should be canonical and why

Example:
```
**Mismatched Function Signature Across Module Boundary**
- **Files**: src/api/endpoints.py:45, src/services/user.py:123
- **Commits**: a1b2c3d (endpoints), c3d4e5f (service)
- **Inconsistency**: endpoint passes `user_id` as string, service expects integer
- **Impact**: Runtime type errors when calling service
- **Resolution**: Update endpoint to cast to int or service to accept string
```

### 7. Documentation Gaps
List documentation that should have been updated but wasn't:

**Gap**: What documentation is missing or outdated
- **Related Changes**: Commits that introduced code requiring documentation
- **Files Needing Updates**: Which docs should be modified
- **Impact**: How lack of documentation affects users/developers
- **Suggested Content**: What should be documented

Example:
```
**New CLI Flags Undocumented**
- **Related Changes**: b2c3d4e added --parallel flag, c3d4e5f added --retry-limit
- **Files Needing Updates**: README.md, docs/cli-reference.md
- **Impact**: Users won't discover new functionality
- **Suggested Content**: Add flag descriptions, examples, and default values
```

### 8. Breaking Changes Identified
If any breaking changes were found, list them:

**Change**: Description of breaking change
- **First Appeared In**: Commit hash
- **Type**: API / Config / Schema / CLI / Behavior
- **Affected Users**: Who will be impacted
- **Migration Path**: What users need to do to upgrade
- **Backward Compatibility**: Possible to maintain compatibility?

### 9. Configuration & Environment Concerns
List any configuration or environment issues:

**Concern**: Brief description
- **Files**: Configuration files or code with environment assumptions
- **Commit**: Where introduced
- **Issue**: Specific problem (hardcoded paths, missing validation, etc.)
- **Platform Impact**: Which platforms/environments affected
- **Fix**: How to make it more robust

### 10. Code Hygiene Issues
List dead code, duplication, or cleanup items:

**Issue**: Brief description
- **Type**: Dead Code / Duplication / Debug Statements / TODOs
- **Files**: Where found
- **Commit**: When introduced
- **Cleanup Action**: What should be done

### 11. Implementation Strengths
Highlight what was done well or better than expected. For each strength:

**Strength Title**: Brief description

- **Quality Aspect**: Code Quality / Architecture / Testing / Documentation / Performance
- **Implemented In**: Commit hash where this strength was introduced or most recently improved
- **Commit Details**: Brief commit message and date
- **Files**: Relevant files demonstrating the strength
- **What Was Done Well**: Specific description
- **Example**: Brief code snippet or explanation showing the good practice
- **Impact**: How this benefits the project

Example:
```
**Comprehensive Error Handling in Worker Pool**
- **Quality Aspect**: Code Quality, Safety
- **Implemented In**: c3d4e5f
- **Commit Details**: "Add robust error handling to worker pool" (2024-01-16)
- **Files**: src/workers/pool.py:45-78
- **What Was Done Well**: Implemented graceful degradation with proper logging and retry logic
- **Example**: 
  ```python
  try:
      result = worker.process(task)
  except WorkerException as e:
      _logger.error("Worker failed: %s", e)
      if retry_count < MAX_RETRIES:
          queue.put_back(task)
      else:
          failed_tasks.add(task)
  ```
- **Impact**: Ensures pipeline continues even with transient failures, improving reliability
```

### 12. Test Quality Assessment
If tests exist, evaluate their quality:

**Overall Test Quality**: Excellent / Good / Adequate / Poor

**Strengths:**
- What's done well in testing
- Good coverage areas
- Well-written test examples

**Weaknesses:**
- Coverage gaps (with specific percentages if available)
- Test isolation issues
- Missing edge cases
- Brittle or unclear tests

**Specific Test Issues:**
- **Issue**: Description
- **Files**: Test files affected
- **Commit**: When test was added
- **Problem**: What's wrong
- **Fix**: How to improve

### 13. Fix Implementation Roadmap

Provide a sequenced list of fixes with **accurate dependency analysis**:

**For each fix, explicitly state:**
- **Fix Name**: Brief title
- **Associated Commit**: Which commit introduced the problem
- **Dependencies**: What it depends on (be specific - which other fixes must complete first?)
- **Unblocks**: What depends on it (what becomes unblocked after this fix?)
- **Parallelizable With**: What can be done in parallel with other fixes?
- **Estimated Effort**: Time/complexity estimate

**Example:**
```
**Phase 1 - Foundation Fixes**

**Fix: Semantic CLI Flags**
- **Associated Commit**: b2c3d4e
- **Dependencies**: None (can start immediately)
- **Unblocks**: E2E pipeline testing, semantic integration tests
- **Parallelizable With**: Contribution parallelism, classification fail-fast
- **Estimated Effort**: 30 minutes (simple find-replace)

**Fix: Contribution Parallelism**  
- **Associated Commit**: d4e5f6g
- **Dependencies**: None (independent of semantic fixes)
- **Unblocks**: Performance testing, load testing
- **Parallelizable With**: Classification fail-fast, semantic CLI fix
- **Estimated Effort**: 2 hours (requires thread-pool implementation)
```

### 14. File Operations Checklist
List specific file operations needed with commit context:

**Files to Modify**:
- `path/to/file.py` (last modified in commit a1b2c3d) - Fix CLI flags on lines 121-151
- `path/to/other.py` (last modified in commit b2c3d4e) - Add fail-fast logic to worker pool

**Files to Create**:
- `path/to/new/file.py` - Implement missing semantic bundle integration (addresses gap from commit c3d4e5f)

**Files to Delete**:
- `path/to/obsolete.py` (introduced in commit d4e5f6g) - No longer needed after refactor

**Configuration Changes**:
- Update `config.yml` section X to add parameter Y (original config from commit e5f6g7h)

### 15. Testing & Verification Plan

**IMPORTANT**: All commands, examples, and verification steps must follow project conventions documented in `AGENTS.md`. For example:
- If the project uses `uv` for Python, use `uv run` instead of `python`
- Follow the project's testing framework conventions
- Use project-specific environment setup commands

For each major fix, provide:

**Fix**: [Issue name]
**Related Commit**: [Hash where issue was introduced]
**Test Command**: `command to run` (following AGENTS.md conventions)
**Expected Output**: What success looks like
**Failure Signs**: What indicates it's still broken

### 16. Approval Status
- ✅ Ready to merge (may have minor suggestions)
- ⚠️ Needs revisions (specific issues must be addressed)
- ❌ Requires major rework (fundamental problems)

**Rationale**: Brief explanation of the approval decision based on:
- Number and severity of issues found
- Completeness of implementation vs. plan
- Quality of code in commits examined
- Safety and reliability concerns
- Test coverage and quality
- Documentation completeness

## Important Guidelines for Code Examples

- **Follow project conventions**: All command examples must align with `AGENTS.md` guidance (e.g., use `uv run` if the project uses uv, not `python`)
- **Show, don't just tell**: Include actual code snippets from the files
- **Keep snippets focused**: 5-10 lines showing the specific problem
- **Use before/after format**: Make it obvious what needs to change
- **Include context**: Add a line or two before/after to orient the reader
- **Be specific about fixes**: Don't say "fix the bug", show the exact change needed
- **Track origins**: Always note which commit introduced the code being discussed

## Commit Tracking Best Practices

1. **Be Precise**: Use full commit hashes (first 7-8 characters minimum) to avoid ambiguity
2. **Cross-Reference**: When an issue affects multiple files, note if they were changed in the same or different commits
3. **Evolution Awareness**: If code was modified across several commits, note the progression
4. **Uncommitted Changes**: Clearly distinguish between committed and uncommitted problems
5. **Blame Constructively**: Use commit tracking to understand context, not to assign blame
6. **Pattern Recognition**: If multiple issues stem from the same commit, note this pattern

## Appendix A: Example of High-Quality Issue Report

To ensure consistency and thoroughness, here's an example of the detail level expected:

**Missing Input Validation in API Endpoint**
- **Severity**: High
- **First Appeared In**: f6g7h8i
- **Commit Details**: "Add user creation endpoint" (2024-01-18)
- **Files**: src/api/users.py:156-178
- **Current Behavior**: 
  ```python
  def create_user(request):
      username = request.json['username']  # No validation
      user = User(username=username)
      db.save(user)
      return {"id": user.id}
  ```
- **Expected Behavior**: Should validate username format, length, uniqueness before creating
- **Code Context**:
  ```python
  # Lines 156-178 in src/api/users.py
  @app.route('/users', methods=['POST'])
  def create_user(request):
      # Missing: auth check, input validation, error handling
      username = request.json['username']
      user = User(username=username)
      db.save(user)  # Could raise exception
      return {"id": user.id}
  ```
- **Why It's High Severity**: 
  - SQL injection possible via username field
  - No duplicate username detection
  - Unhandled exceptions crash the endpoint
  - No authentication check allows anonymous user creation
- **Suggested Fix**:
  ```python
  @app.route('/users', methods=['POST'])
  @require_auth
  def create_user(request):
      try:
          # Validate input
          username = request.json.get('username', '').strip()
          if not username or len(username) > 50:
              return {"error": "Invalid username"}, 400
          if not re.match(r'^[a-zA-Z0-9_]+$', username):
              return {"error": "Username contains invalid characters"}, 400
          
          # Check uniqueness
          if User.query.filter_by(username=username).first():
              return {"error": "Username already exists"}, 409
          
          # Create user
          user = User(username=username)
          db.save(user)
          db.commit()
          return {"id": user.id}, 201
          
      except KeyError:
          return {"error": "Missing username field"}, 400
      except DatabaseError as e:
          logger.error("Failed to create user: %s", e)
          return {"error": "Internal server error"}, 500
  ```
- **Verification Steps**:
  ```bash
  # Test missing field
  curl -X POST /users -d '{}' # Should return 400
  
  # Test invalid username
  curl -X POST /users -d '{"username":"../etc/passwd"}' # Should return 400
  
  # Test duplicate username
  curl -X POST /users -d '{"username":"alice"}' # First: 201, second: 409
  
  # Test valid creation
  curl -X POST /users -d '{"username":"alice"}' # Should return 201 with id
  ```
- **Dependencies**: None
- **Estimated Effort**: 1 hour

---

Write your full response to $OUTPUT_PATH as a .md file.