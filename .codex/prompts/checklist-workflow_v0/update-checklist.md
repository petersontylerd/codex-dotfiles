POST-REVIEW SYNCHRONIZATION PROMPT

Your next task is to **synchronize the checklist** with everything discovered during the review and then propose the most logical next execution step.

You are transitioning from reflection back into methodical action.

---

### 1. UPDATE THE CHECKLIST STRUCTURE

Reopen or modify the Markdown checklist directly.
Perform the following, in order:

1. **Reopen prematurely checked items**

   * For any task flagged ⚠️ or “potentially incomplete,” change `[x]` back to `[ ]` and append a short comment:

     > “Reopened after review — verification incomplete as of YYYY-MM-DD.”

2. **Add new tasks or subtasks**

   * Insert new items surfaced during the review under their appropriate major task.
   * Use consistent tagging (`(P1)`, `(S/M/L)`, `([RESEARCH], [IMPLEMENT])`, etc.) **and preserve the existing Task/Subtask naming conventions** when updating, adding research, and completing items (do not introduce new naming patterns).
   * Provide 1–2 sentences of context beneath each new subtask:

     > “Added after mid-execution review to address missing validation of edge cases.”
   * **Pair planning/research with execution:** For every planning or `[RESEARCH]` task/subtask added or updated, add a corresponding `[IMPLEMENT]` task/subtask that executes the outcome of that research (e.g., “Execute: implement X based on Y findings”), and link the pair via naming or a short cross-reference.

3. **Reorder tasks if dependencies have shifted**

   * Adjust sequence to reflect the true dependency chain.
   * Annotate the top of the checklist with:

     > “Checklist reordered after review on YYYY-MM-DD — reflects updated task flow.”

4. **Add Review Notes**

   * At the end of the **Notes & Learnings** section, insert:

     ```
     ### Mid-Execution Review Summary — YYYY-MM-DD
     - Alignment verdict
     - Key strengths to preserve
     - Weaknesses addressed
     - Tasks reopened / added / reordered
     ```
   * Keep the reflection concise but explicit.

5. **Confirm Validation Gate status**

   * If any validations were deemed incomplete, mark them as “Pending Recheck.”
   * Document any new verification commands or conditions.

---

### 2. VERIFY CONSISTENCY

After updates, quickly sanity-check that:

* All open items are logically sequenced.
* Each major task has clear subtasks (no vague placeholders).
* The number of actionable items reflects the expanded scope.
* Notes, tags, and timestamps are consistent.
* **Every planning/`[RESEARCH]` item has a clearly named, paired execution task/subtask with a concrete verb and acceptance/verification criteria.**
* **Task and Subtask names strictly follow the existing naming conventions across the checklist.**

If inconsistencies remain, resolve them before resuming execution.

---

### 3. PROPOSE THE NEXT EXECUTION STEP

Once the checklist reflects the current reality:

1. Identify the **next best task to execute** — the one with the highest leverage, dependency clearance, or risk reduction (prefer the action paired to the most recent research, where applicable).
2. Present it to the user as:
