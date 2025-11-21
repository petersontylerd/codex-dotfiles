---

APPLY THE PRECEDING CHECKLIST REVIEW — UPDATE THE CHECKLIST

You are not executing code right now — you are **updating the checklist** using the **preceding checklist review** as your primary input.

**Objective:** Thoughtfully incorporate the review to keep the checklist balanced (careful, smart planning **and** concrete implementation), and ensure thorough references to notes and work accomplished so far.

---

### 0) INPUTS (treat as authoritative)

* **Preceding Checklist Review (PCR):** alignment notes, strengths, weaknesses/risks, adjustments, and priority next steps.
* **Current Checklist (CC).**
* **Repository changes to date** (branches/commits/PRs, files added/modified) as context for references.

---

### 1) INCORPORATE THE REVIEW

* Apply each relevant PCR recommendation to the CC:

  * **Add / reopen / reorder** tasks and subtasks as directed by PCR.
  * Where PCR flags gaps, **create the missing items** with clear scope and acceptance.
* Append a short “**Review→Checklist Update Summary**” noting what was added/reopened/reordered (timestamped).

---

### 2) GUARD AGAINST OVERPLANNING DRIFT

* For every `[PLAN]` or `[RESEARCH]` item, ensure a paired, concrete follow-through:

  * If missing, **add** a corresponding `[IMPLEMENT]` (or `[VALIDATE]`) subtask that changes code/tests.
  * **Prohibited:** `[IMPLEMENT]` items that merely “implement the plan” without touching code/tests.
* Keep balance: planning/research remain **first-class**, but ensure delivery is unblocked and represented.

**`[IMPLEMENT]` micro-template (include inline):**
`Files: … | Symbols/Endpoints: … | Tests: … | Acceptance: … | Branch/PR: … | Commands: …`

---

### 3) REFERENCE & ARTIFACT HYGIENE

For each task/subtask that produced work or requires it:

* **Note files:** add full paths to any notes/specs referenced or created.
* **Code paths:** list file paths and symbols to be added/edited.
* **Branches/Commits/PRs:** include IDs/links if they exist; otherwise specify the intended branch name.
* If PCR indicates missing references, **supplement them now**.

---

### 4) STRUCTURE & NAMING

* Preserve existing **IDs and prefixes** (`[PLAN]`, `[RESEARCH]`, `[IMPLEMENT]`, `[VALIDATE]`, `[DOC]`).
* When splitting, use suffixed children (`2.C.1`, `2.C.2`).
* Apply priority/complexity tags `(P1|P2, S|M|L)` as appropriate.
* Keep the checklist logically ordered per PCR; add “⚠️” to items reopened for re-inspection.

---

### 5) PRIORITY NEXT MOVES

* From PCR “Priority Next Steps,” create **top 1–3 executable** entries (at least one `[IMPLEMENT]` or `[VALIDATE]`), each with:

  * File paths / symbols,
  * Tests to add/update,
  * Acceptance criteria,
  * Branch/PR reference (or intended branch name).

Place these at the top under `### Daily Kickoff` (or equivalent).

---

### 6) LOG THE UPDATE

* Under **Notes & Learnings**, add a dated entry:
  `YYYY-MM-DD — Incorporated Mid-Execution Review into checklist; summary of changes; links to notes/commits/PRs.`

---

### 7) OUTPUT

* Save changes **in place** to the checklist file, preserving format.
* Do **not** execute code; deliver the updated checklist and the “Review→Checklist Update Summary.”

---

**Tone:** Precise, lean, and delivery-aware — **respect the value of planning and research**, while ensuring the checklist drives tangible implementation and links to real artifacts.
