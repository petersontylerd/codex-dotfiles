---
description: Provide a second opinion of the raw plan for a single INITIATIVE_NAME, created from that initiative’s optimized prompt, and offer to save a refined copy to the initiative’s optimized plan directory
argument-hint: INITIATIVE_NAME=<initiative_name>  
---

You are an expert lead software engineer reviewing the work of a junior software engineer. Ground your review in this repository’s architecture, conventions, tests, and docs: identify where the artifact aligns or conflicts with existing patterns/modules/data contracts, what should be reused, and where gaps create risk. For every conflict or gap you flag, pair it with a concrete, repo-aligned remediation (reuse, refactor, relocate, add coverage). Highlight downstream impacts (maintainability, test coverage, integration points). Maintain the required structure, rules, and intent of this prompt while integrating your repository-informed judgment.

You are evaluating how effectively the junior engineer produced an `raw plan` from an `optimized prompt`, using a provided `instruction set`.

You will review the following artifacts:

- **Raw plan** `raw plan` developed by junior software engineer based on `optimized prompt`, following the `instruction set`. Read the **Raw plan** from the file at `./scratchpaper/initiatives/$INITIATIVE_NAME/plans/raw/*.md` (only one `.md` is expected in this directory)
- **Instruction set** that the junior engineer was asked to follow:
  `./.codex/prompts/create-initiative-plan.md`. Read this file to understand the instructions.
- **Optimized prompt** Read from the file at `./scratchpaper/initiatives/$INITIATIVE_NAME/prompts/optimized/*.md` (only one `.md` is expected in this directory). No changes or feedback needed for **Optimized prompt** - it is already optimized. Simply providing as a reference artifact.

Your assessment **must** include and confine feedback to these dimensions of quality and alignment (from `./.codex/prompts/create-initiative-plan.md`): structural compliance, completeness of required sections/fields, clarity and actionability of steps/dependencies, internal consistency (no contradictions or duplicated items), feasibility and ordering, explicit risks/assumptions/validation, and adherence to all constraints in the instruction set.

1. **Strengths**
   - Identify specific strengths in the `raw plan`.
   - Call out concrete examples where the junior engineer followed the `instruction set` well.

2. **Weaknesses & Remediations**
   - Only raise weaknesses when they represent critical gaps or material risks to structure, clarity, feasibility, or alignment.
   - For each weakness, propose a clear remediation:
     - Explain *why* it is a weakness.
     - Provide a concrete suggestion or example of how to fix it (e.g., revised wording, added constraints, improved structure).

3. **Deviations from the Instruction Set**
   - Only flag deviations that constitute critical gaps or material misalignments with the instruction set when using the `optimized prompt` and `instruction set` to create the `raw plan`.
   - Treat these as critical issues.
   - For each deviation:
     - Describe the deviation precisely.
     - Explain the impact (e.g., lost constraints, weaker guidance, increased ambiguity).
     - Propose a specific remediation, including example revisions to bring the `raw plan` into alignment with the `instruction set`.

4. **Overall Evaluation**
   - Provide a brief overall evaluation of the `raw plan`’s quality, clarity, and faithfulness to:
     - The original intent of the `optimized prompt`.
     - The requirements in the `instruction set`.

**Output format:**

Structure your response using clear sections with headings, for example:

- `Summary`
- `Strengths`
- `Weaknesses and Remediations`
- `Deviations from the Instruction Set (Critical) and Optimized Prompt (Critical), w/ Remediations`
- `Overall Evaluation`

Within each section, use bullet points or numbered lists for readability and concision.

At the end of your assessment, provide an outline of your recommended changes and then ask the user:

> Would you like me to save the updated plan (same filename) as a new `.md` file to `./scratchpaper/initiatives/$INITIATIVE_NAME/plans/optimized/`, adhering to the critical requirement that all changes strictly adhere to the structure, rules, and requirements of `./.codex/prompts/create-initiative-plan.md`?
