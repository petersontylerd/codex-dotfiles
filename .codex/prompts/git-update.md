Here’s a clearer, safer, and more “agent-ready” version you can drop into Codex CLI. It keeps your original intent, tightens guardrails, and tunes the interaction/formatting for reliable execution.

```
ROLE
You are operating in an existing Git repository. Your task is to stage and commit current work safely, with a human-in-the-loop approval step.

GUARDRAILS
- Do NOT push, rebase, merge, force, or change remotes.
- Only run the commands explicitly listed in this prompt, in the order given.
- Respect .gitignore. Do not add ignored files.
- If a merge/rebase is in progress (conflicts present), stop and report that state instead of continuing.

OUTPUT STYLE
- Print concise, readable terminal output.
- For prompts, accept uppercase Y as approval; treat any other input as “n” (i.e., not approved).

STEPS

1) Inspect
   - Run: git status --porcelain=v1 -b
   - Capture this exactly as STATUS_OUTPUT.
   - If STATUS_OUTPUT indicates “nothing to commit” (no modified/added/removed files), print:
       “No changes detected. Nothing to commit.”
     Then stop.

2) Stage
   - Run: git add -A
   - Then run: git status --porcelain=v1 -b
   - Capture this as POST_ADD_STATUS for commit context.

3) Draft commit message
   - Compose GIT_COMMIT_MESSAGE (75–200 words).
   - It must be a conventionally informative, well-organized git commit message:
       • Start with an imperative, concise subject line (<= 50 chars if possible).
       • Follow with a body wrapped to ~72 chars/line, using short paragraphs or bullets.
       • Summarize what changed at a high level and why it was done.
       • Use concrete scope cues you can infer (e.g., filenames, feature areas) without listing every file.
       • Incorporate context from POST_ADD_STATUS (e.g., added/modified/removed counts, branch, ahead/behind) and what we accomplished this session.
       • Do NOT mention the commands you ran to assemble the message.
       • Avoid noisy details (build artifacts, generated locks) unless they are the change.
   - Ensure length bounds are met (>= 75 and <= 200 words).

4) Human approval loop
   - Print the draft as:
       ---- BEGIN COMMIT MESSAGE DRAFT ----
       <GIT_COMMIT_MESSAGE>
       ---- END COMMIT MESSAGE DRAFT ----
     Then ask exactly:
       Accept commit message? (Y/n)
   - If the response is “Y”:
       → Proceed to Step 5.
   - Otherwise (“n” or anything else):
       a) Ask: “How would you like to adjust the commit message?”
       b) Wait for the user’s guidance.
       c) Rewrite GIT_COMMIT_MESSAGE (<= 200 words), incorporating the guidance while preserving the requirements above.
       d) Show the new draft in the same BEGIN/END block and ask again:
            Accept commit message? (Y/n)
       e) Repeat this revise→confirm cycle until the user responds “Y”.

5) Commit
   - Run exactly (note: -m only, we already staged everything):
       git commit -m "$GIT_COMMIT_MESSAGE"
     (Ensure quotes/escaping so all lines and characters are preserved.)
   - After committing, print a brief summary:
       - Run: git show --quiet --stat --name-status --format=short HEAD

NOTES
- If some files cannot be staged (permissions/locks), report the filenames and continue the approval loop; do not commit until staging succeeds.
- If a commit hook blocks the commit, surface the hook’s output verbatim and stop.
```
