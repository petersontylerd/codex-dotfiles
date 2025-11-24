# Create initiative scaffolf

1) **IN TERMINAL 1** Run `bash ./scripts/initiative-scaffold.sh <initiative-name>` to create the new initiative artifact scaffold directory


# Create optimized prompt

2) Write raw prompt yourself, select all, and ctrl-c to copy

3) **IN TERMINAL 1** Run `bash ./scripts/capture-raw-prompt.sh`
    - FYI --> alias'd as `save-raw-prompt`
    - Paste raw prompt into terminal when prompted and press enter
    - Type ctrl-d 2x to save the file as `./scratchpaper/initiatives/<initiative-name>/prompts/raw/*.md` (creates new file)

4) **IN TERMINAL 1** Run `/prompts:improve-prompt` within codex, providing:
    - Raw prompt .md file path as `RAW_PROMPT_PATH="./scratchpaper/initiatives/<initiative-name>/prompts/raw/*.md"`
    - Optimized prompt .md *destination directory* as `OPTIMIZED_PROMPT_DESTINATION="./scratchpaper/initiatives/<initiative-name>/prompts/optimized/"` (creates new file)
    
5) **SECOND OPINION = IN TERMINAL 2** Run `/prompts:prompt-doublecheck` within codex, providing:
    - Raw prompt .md file path as `RAW_PROMPT_PATH="./scratchpaper/initiatives/<initiative-name>/prompts/raw/*.md"`, and 
    - Optimized prompt .md file path as `OPTIMIZED_PROMPT_PATH="./scratchpaper/initiatives/<initiative-name>/prompts/optimized/*.md"` (no new file created - changes applied in place)


# Create optimized plan

6) **IN TERMINAL 1** Run `/prompts:create-initiative-plan` within codex, providing:
    - Optimized prompt .md file path as `OPTIMIZED_PROMPT_PATH="./scratchpaper/initiatives/<initiative-name>/prompts/optimized/*.md"`, and
    - Raw plan .md *destination directory* as `RAW_PLAN_DESTINATION="./scratchpaper/initiatives/<initiative-name>/plans/raw/"` (creates new file)
    
7) **SECOND OPINION = IN TERMINAL 2** run `/prompts:plan-doublecheck` within codex, providing:
    - Optimized prompt .md file path as `OPTIMIZED_PROMPT_PATH="./scratchpaper/initiatives/<initiative-name>/prompts/optimized/*.md"`, and
    - Raw plan .md file path as `RAW_PLAN_PATH="./scratchpaper/initiatives/<initiative-name>/plans/raw/*.md"`, and
    - Optimized plan .md *destination directory* as `OPTIMIZED_PLAN_DESTINATION="./scratchpaper/initiatives/<initiative-name>/plans/optimized/"` (creates new file)


# Create optimized checklist

6) **IN TERMINAL 1** Run `/prompts:plan-to-checklist` within codex, providing:
    - Optimized plan .md file path as `OPTIMIZED_PLAN_PATH="./scratchpaper/initiatives/<initiative-name>/plans/optimized/*.md"`, and
    - Raw checklist .md *destination directory* as `RAW_CHECKLIST_DESTINATION="./scratchpaper/initiatives/<initiative-name>/checklists/raw/"` (creates new file)
    
7) **SECOND OPINION = IN TERMINAL 2** run `/prompts:checklist-doublecheck` within codex, providing:
    - Optimized plan .md file path as `OPTIMIZED_PLAN_PATH="./scratchpaper/initiatives/<initiative-name>/plans/optimized/*.md"`, and
    - Raw checklist .md file path as `RAW_CHECKLIST_PATH="./scratchpaper/initiatives/<initiative-name>/checklists/raw/*.md"`, and
    - Optimized checklist .md *destination directory* as `OPTIMIZED_CHECKLIST_DESTINATION="./scratchpaper/initiatives/<initiative-name>/checklists/optimized/"` (creates new file)


# Start developing

10) Run `/prompts:session-start`
