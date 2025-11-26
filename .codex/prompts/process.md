ABOUTME: Documents the end-to-end initiative prompt/plan/checklist workflow using a single INITIATIVE_NAME input.
ABOUTME: Specifies command paths by inlining $INITIATIVE_NAME; assumes one .md file per stage directory.

**NOTE**
- `INITIATIVE_NAME` value is repeated for each command.
- Each stage directory is expected to hold at most one `.md`, so the `*.md` globs remain unambiguous. After each creation/review step, confirm exactly one `.md` exists in that stage; resolve duplicates before proceeding.

## Create initiative scaffold

1) **IN TERMINAL 1** Run `bash ./scripts/initiative-scaffold.sh "$INITIATIVE_NAME"` to create the new initiative artifact scaffold directory
   - Verify scaffolded directories exist under `scratchpaper/initiatives/$INITIATIVE_NAME/` before continuing.


## Create optimized prompt

2) Write raw prompt yourself, select all, and ctrl-c to copy

3) **IN TERMINAL 1** Run `bash ./scripts/capture-raw-prompt.sh "$INITIATIVE_NAME"`
    - FYI --> alias'd as `save-raw-prompt "$INITIATIVE_NAME"`
    - Paste raw prompt into terminal when prompted and press enter
    - Type ctrl-d 2x to save the file as `./scratchpaper/initiatives/$INITIATIVE_NAME/prompts/raw/*.md` (creates new file)

4) **IN TERMINAL 1** Run `/prompts:improve-prompt INITIATIVE_NAME="$INITIATIVE_NAME"` within codex (creates optimized prompt under `./scratchpaper/initiatives/$INITIATIVE_NAME/prompts/optimized/`)
    
5) **SECOND OPINION = IN TERMINAL 2** Run `/prompts:prompt-doublecheck INITIATIVE_NAME="$INITIATIVE_NAME"` within codex  
    - Apply all approved remediations OR explicitly record any waived issues with rationale in Notes & Learnings for the initiative.  
    - Do not proceed until a single optimized prompt file exists in `./scratchpaper/initiatives/$INITIATIVE_NAME/prompts/optimized/`. If missing, copy the raw prompt there only after documenting any waivers.


## Create optimized plan

6) **IN TERMINAL 1** Run `/prompts:create-initiative-plan INITIATIVE_NAME="$INITIATIVE_NAME"` within codex (creates raw plan under `./scratchpaper/initiatives/$INITIATIVE_NAME/plans/raw/`)
    
7) **SECOND OPINION = IN TERMINAL 2** run `/prompts:plan-doublecheck INITIATIVE_NAME="$INITIATIVE_NAME"` within codex (creates optimized plan under `./scratchpaper/initiatives/$INITIATIVE_NAME/plans/optimized/`)
    - Apply all approved remediations OR explicitly record any waived issues with rationale in Notes & Learnings.  
    - Do not proceed until a single optimized plan file exists in `./scratchpaper/initiatives/$INITIATIVE_NAME/plans/optimized/`. If missing, copy the raw plan there only after documenting any waivers.


## Create optimized checklist

8) **IN TERMINAL 1** Run `/prompts:plan-to-checklist INITIATIVE_NAME="$INITIATIVE_NAME"` within codex (creates raw checklist under `./scratchpaper/initiatives/$INITIATIVE_NAME/checklists/raw/`)
    
9) **SECOND OPINION = IN TERMINAL 2** run `/prompts:checklist-doublecheck INITIATIVE_NAME="$INITIATIVE_NAME"` within codex (creates optimized checklist under `./scratchpaper/initiatives/$INITIATIVE_NAME/checklists/optimized/`)
    - Apply all approved remediations OR explicitly record any waived issues with rationale in Notes & Learnings.  
    - Do not proceed until a single optimized checklist file exists in `./scratchpaper/initiatives/$INITIATIVE_NAME/checklists/optimized/`. If missing, copy the raw checklist there only after documenting any waivers.


## Start developing

10) Run `/prompts:session-start` (requires optimized checklist, single-file check, and Major Task 0 branch readiness complete or explicitly blocked)
11) Enter execution loop: iterate `/prompts:execute-next-task` → `/prompts:update-checklist` → `/prompts:session-end`; run `/prompts:review-checklist` after meaningful increments or before merging. Perform scratchpad hygiene via `/prompts:scratchpad-review-and-cleanup` as needed.
