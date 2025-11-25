ABOUTME: Documents the end-to-end initiative prompt/plan/checklist workflow using a single INITIATIVE_NAME input.
ABOUTME: Specifies command paths by inlining $INITIATIVE_NAME; assumes one .md file per stage directory.

**NOTE**
- `INITIATIVE_NAME` value is repeated for each command.
- Each stage directory is expected to hold at most one `.md`, so the `*.md` globs remain unambiguous.

## Create initiative scaffold

1) **IN TERMINAL 1** Run `bash ./scripts/initiative-scaffold.sh "$INITIATIVE_NAME"` to create the new initiative artifact scaffold directory


## Create optimized prompt

2) Write raw prompt yourself, select all, and ctrl-c to copy

3) **IN TERMINAL 1** Run `bash ./scripts/capture-raw-prompt.sh "$INITIATIVE_NAME"`
    - FYI --> alias'd as `save-raw-prompt "$INITIATIVE_NAME"`
    - Paste raw prompt into terminal when prompted and press enter
    - Type ctrl-d 2x to save the file as `./scratchpaper/initiatives/$INITIATIVE_NAME/prompts/raw/*.md` (creates new file)

4) **IN TERMINAL 1** Run `/prompts:improve-prompt INITIATIVE_NAME="$INITIATIVE_NAME"` within codex (creates optimized prompt under `./scratchpaper/initiatives/$INITIATIVE_NAME/prompts/optimized/`)
    
5) **SECOND OPINION = IN TERMINAL 2** Run `/prompts:prompt-doublecheck INITIATIVE_NAME="$INITIATIVE_NAME"` within codex  
    - If remediations are approved, let the agent save the updated optimized prompt.  
    - If no changes are applied, explicitly confirm an optimized prompt file exists in `./scratchpaper/initiatives/$INITIATIVE_NAME/prompts/optimized/`; if it does not, copy the raw prompt there so downstream steps have a source.


## Create optimized plan

6) **IN TERMINAL 1** Run `/prompts:create-initiative-plan INITIATIVE_NAME="$INITIATIVE_NAME"` within codex (creates raw plan under `./scratchpaper/initiatives/$INITIATIVE_NAME/plans/raw/`)
    
7) **SECOND OPINION = IN TERMINAL 2** run `/prompts:plan-doublecheck INITIATIVE_NAME="$INITIATIVE_NAME"` within codex (creates optimized plan under `./scratchpaper/initiatives/$INITIATIVE_NAME/plans/optimized/`)
    - If remediations are approved, let the agent save the updated optimized plan.  
    - If no changes are applied, explicitly confirm an optimized plan file exists; if missing, copy the raw plan to `plans/optimized/` before proceeding.


## Create optimized checklist

8) **IN TERMINAL 1** Run `/prompts:plan-to-checklist INITIATIVE_NAME="$INITIATIVE_NAME"` within codex (creates raw checklist under `./scratchpaper/initiatives/$INITIATIVE_NAME/checklists/raw/`)
    
9) **SECOND OPINION = IN TERMINAL 2** run `/prompts:checklist-doublecheck INITIATIVE_NAME="$INITIATIVE_NAME"` within codex (creates optimized checklist under `./scratchpaper/initiatives/$INITIATIVE_NAME/checklists/optimized/`)
    - If remediations are approved, let the agent save the updated optimized checklist.  
    - If no changes are applied, explicitly confirm an optimized checklist file exists; if missing, copy the raw checklist to `checklists/optimized/` so session-start has an input.


## Start developing

10) Run `/prompts:session-start`
