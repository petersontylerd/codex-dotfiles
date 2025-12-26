## Objective
Conduct a comprehensive audit and update of all project documentation to ensure accuracy, remove deprecated content, and enhance educational value.

## Scope
Review and update the following documentation files:
- All files in `docs/` directories
- All `README.md` files throughout the repository
- `AGENTS.md` (if present)
- Any other documentation files you discover

## Process

### 1. Discovery Phase
- Create a complete inventory of all documentation files in the repository
- List files by location and type for systematic review

### 2. Audit Criteria
For each file, evaluate:
- **Accuracy**: Does it reflect current functionality?
- **Completeness**: Are there gaps in critical information?
- **Staleness**: Are there deprecated features or outdated references?
- **Clarity**: Is the content easy to understand and follow?
- **Relevance**: Is the content still necessary? You may remove passage or entire doc files as needed.

### 3. Update Guidelines

#### Content Quality
- **Be educational, not exhaustive**: Focus on helping users understand, not listing every detail
- **Explain the "why"**: Include purpose and context, not just "how-to" steps
- **Show relationships**: Explain how components fit into the broader system

#### Formatting & Structure
- Use clear headings and logical organization
- Add visuals where they clarify concepts:
  - Flowcharts for processes
  - Diagrams for architecture
  - Tables for comparisons
- Include code snippets that demonstrate key concepts
- Keep examples practical and relevant

#### Critical Requirements
- **Remove all stale/deprecated content** - Outdated information creates risk of serious errors
- **Verify all code examples** - Ensure they work with current codebase
- **Update version references** - Remove references to old versions or deprecated APIs

## Deliverables
1. Updated documentation files (commit-ready)
2. Summary of changes made to each file
3. List of any discovered issues that need separate attention

## Success Criteria
- All documentation accurately reflects current state
- No deprecated features or outdated references remain
- Documentation is clear, educational, and properly structured
- Code examples are tested and functional