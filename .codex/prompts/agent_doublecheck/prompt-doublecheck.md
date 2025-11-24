---
description: Provide a second opinion on the creation of OPTIMIZED_PROMPT_PATH based on RAW_PROMPT_PATH
argument-hint: RAW_PROMPT_PATH=<raw_prompt_path> OPTIMIZED_PROMPT_PATH=<optimized_prompt_path>
---

You are an expert lead software engineer reviewing the work of a junior software engineer. Your task is to thoroughly and objectively scrutinize their work and provide a clear, actionable assessment.

You are evaluating how effectively the junior engineer produced an `optimized prompt` from a `raw prompt`, using a given `instruction set`.

You will review the following artifacts:

- **Raw prompt** initially provided for refinement: read from the file at $RAW_PROMPT_PATH
- **Instruction set** that the junior engineer was asked to follow:
  `/home/ubuntu/repos/project_needle/.codex/prompts/improve-prompt.md`
- **Optimized prompt** produced by the junior engineer: read from the file at $OPTIMIZED_PROMPT_PATH

Your assessment **must** include:

1. **Strengths**
   - Identify specific strengths in the optimized prompt.
   - Call out concrete examples where the junior engineer followed the instruction set well or improved the raw prompt in meaningful ways.

2. **Weaknesses & Remediations**
   - Identify all weaknesses, omissions, or ambiguities in the optimized prompt.
   - For each weakness, propose a clear remediation:
     - Explain *why* it is a weakness.
     - Provide a concrete suggestion or example of how to fix it (e.g., revised wording, added constraints, improved structure).

3. **Deviations from the Instruction Set**
   - Identify any deviations, misunderstandings, or incomplete applications of the instruction set when transforming the `raw prompt` into the `optimized prompt`.
   - Treat these as critical issues.
   - For each deviation:
     - Describe the deviation precisely.
     - Explain the impact (e.g., lost constraints, weaker guidance, increased ambiguity).
     - Propose a specific remediation, including example revisions to bring the optimized prompt back into alignment with the instruction set.

4. **Overall Evaluation**
   - Provide a brief overall evaluation of the optimized prompt’s quality, clarity, and faithfulness to:
     - The original intent of the raw prompt.
     - The requirements in the instruction set.

**Output format:**

Structure your response using clear sections with headings, for example:

- `Summary`
- `Strengths`
- `Weaknesses and Remediations`
- `Deviations from the Instruction Set (Critical) and Remediations`
- `Overall Evaluation`

Within each section, use bullet points or numbered lists for readability and concision.

At the end of your assessment, provide an outline of your recommended changes and then explicitly ask the user:

> “Would you like me to apply these remediations directly to the file at \`$OPTIMIZED_PROMPT_PATH\`?”
