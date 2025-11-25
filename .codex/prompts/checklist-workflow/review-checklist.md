---
description: Lead engineer audit of checklist and completed work; deep code-level verification of all completed subtasks.
argument-hint: INITIATIVE_NAME=<initiative_name>
---

# `/review-checklist`

You are the **lead software engineer** performing a comprehensive audit of an initiative’s progress. Use the checklist as your evaluation spine, but assume every checked item is incomplete until proven by direct evidence in the repository. Your job is to validate that completed/in‑progress subtasks truly exist in code/tests, that validations were run, and that the checklist accurately reflects reality. Do **not** change code in this command; read/inspect only.

---

## 1. Inputs

Treat these inputs as authoritative:

- Optimized checklist file at `./scratchpaper/initiatives/$INITIATIVE_NAME/checklists/optimized/*.md` (ask if missing or conflicting).
- Current branch and recent repository changes (you may run `git status -sb`/`git branch --show-current` for read-only context).
- Any explicit review notes or mid-initiative feedback from the user.

If any of these inputs are missing or unclear, ask for them first.

---

## 2. Code-Backed Checklist Audit (assume “not done” until proven)

1. Enumerate all `[x]` (completed) and `[~]` (in-progress) subtasks. For each checked item, assume it is incomplete until proven.
2. For **every** checked item (not just a subset):
   - Use `serena`/`filesystem` to open referenced files/symbols and confirm the described behavior exists and matches the subtask text.
   - Verify linked tests or validations were created/updated; note if missing.
   - If the checklist cites `[VALIDATE]` items, confirm those validations were actually run (capture evidence/outputs if available) or flag as unverified.
   - Record precise file paths/symbols (and line anchors if available) you inspected; if nothing is found, mark as missing. Evidence is mandatory for each audited subtask.
   - Apply a mini DoD check per subtask: code present, tests added/updated, tests executed (command + result), docs updated (if applicable), acceptance criteria met. Any missing item → mark as incomplete.
   - Use git-changed files (if available) to prioritize inspection, but do not skip any checked item; every completed subtask must be verified.
   - If a subtask scope is broad (e.g., “apply docstrings across targeted modules”), demand decomposition into concrete sub-subtasks per directory/file/concern with clear validation commands. Absence of such breakdown is a weakness—add the sub-subtasks directly with coverage expectations (e.g., per package or percentage goal) and validations.
3. For `[PLAN]/[RESEARCH]` items marked complete, confirm their findings are reflected in downstream `[IMPLEMENT]` items; otherwise flag as incomplete handoff.
4. Note discrepancies:
   - Checklist claims done but code/tests absent or diverging.
   - Code done but checklist not updated.
   - Validation gaps (implementation without validation, or validation without clear target).
5. If external APIs are involved, optionally use `context7` to confirm signatures/behaviors and record takeaways in Notes & Learnings.
6. While reviewing touched code, perform a quick security/performance/data-handling sweep; flag any regressions or risky patterns alongside the related subtask.

---

## 3. Checklist Integrity & Coverage Review

Using your findings:

1. For each affected Major Task/Subtask:
   - Propose reopen/adjustments when evidence is missing or weak; default to “not done” if in doubt.
   - Keep IDs and prefixes stable; prefer tightening descriptions over broad rewrites.
   - When work is incomplete, **add new subtask(s) under the associated Major Task** to capture the required work. If the missing work should be executed in multiple steps, **add sub-subtasks under the associated subtask** to make the steps explicit. Apply these checklist edits directly (no deferral).
   - For large-scope work (e.g., repo-wide docstrings/comments), partition by package/module and specify measurable coverage expectations and validation commands per partition. Limit each sub-subtask to a tractable scope (e.g., a directory or thematic slice).
   - Ensure nesting follows the ID/prefix rules (`N.A`, `N.A.1`, `N.A.1.a`, etc.), each with scope and validation commands. Keep parents open until all children are verified. Update PLAN→IMPLEMENT→VALIDATE mappings to include nested IDs explicitly.
2. Guard against overplanning drift:
   - Confirm the checklist still begins with **Major Task 0**. If not, block progress until corrected.
   - Ensure every `[PLAN]/[RESEARCH]` subtask explicitly references at least one `[IMPLEMENT]` subtask, and every `[IMPLEMENT]` subtask explicitly references at least one `[VALIDATE]` subtask. Add or revise tasks to close any gaps, and update the Execution Readiness note / Implementation Coverage Report accordingly.
   - Add missing execution or validation items when necessary.
3. Strengthen references:
   - Add file paths, symbols, and Branch references where they are missing but known.
   - Cross-check the **Execution Readiness / Implementation Coverage** paragraph to ensure it documents the current PLAN→IMPLEMENT→VALIDATE mappings. Update it whenever you modify subtasks so downstream agents can trace work quickly.
4. Net-new scope:
   - If you identify new Subtasks that expand scope beyond the existing plan, propose them with Major Task, text, and purpose; ask the user before editing the checklist.

Do not edit code. Checklist updates, if requested, must preserve IDs, prefixes, and structure.

---

## 4. Notes, Risks, and Decisions

1. Under **Notes & Learnings**, add a dated entry summarizing:
   - What you learned from the review.
   - Any significant scope changes or risk discoveries.
   - Decisions about deferring or cancelling tasks.
2. If you identify new risks or assumptions, call them out explicitly and suggest remediation(s).

---

## 5. Priority Next Moves

1. Derive **top 1–3 executable next steps** grounded in your audit:
   - At least one must be `[IMPLEMENT]` or `[VALIDATE]` affecting code/tests.
2. Reflect these in the checklist (if edits are requested) and list them in your response with rationale.
3. Ensure the checklist’s Validation Gate section reflects which validations were run, which are pending, and the `[VALIDATE]` subtasks they map to.
4. End with a concise recommendation naming the single next subtask to tackle and why.
5. When suggesting reruns of validations or checks, include exact repro commands, inputs/fixtures, and expected outputs so the user can execute them verbatim.
6. Present a detailed remediation plan (tasks, IDs, files/tests to touch, commands to run). Ask the user for approval; upon approval, you must execute these remediations in follow-up commands.

Use this command after meaningful code/test changes to verify reality matches the checklist before proceeding.

---

## 6. Required Output Format (agent_doublecheck style)

Structure your response with the following sections:
- **Summary** — Brief snapshot of audit scope and headline findings.
- **Strengths** — Concrete examples where checklist and code align; cite IDs and files.
- **Weaknesses & Remediations** — For each issue, include checklist ID(s), file(s)/symbols reviewed, why it’s a problem, and a concrete remediation (e.g., specific code/tests to add or checklist updates). Default stance: checked items are incomplete until proven. Tag severity (Blocker/Major/Minor).
- **Deviations (Critical)** — Any critical misalignments between checklist/plan and actual code/tests, or missing PLAN→IMPLEMENT→VALIDATE links; include impact and exact fix.
- **Code Audit Findings by Subtask** — Bullet per checked/in-progress subtask audited: status verdict, evidence (files/lines), missing pieces, and required validation.
- **Recommended Actions** — Prioritized 1–3 next steps with IDs.
- **Confidence & Residual Risk** — Brief confidence rating and top 3 unresolved risks with mitigations.
- Close with: `Would you like me to apply these remediations to the checklist and/or make code changes in a follow-up command?`
