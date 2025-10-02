#!/bin/bash
# ABOUTME: Synchronizes repository Codex prompts into the CLI cache under ~/.codex.
# ABOUTME: Mirrors prompt files and ensures latest instructions are available locally.
set -euo pipefail

shopt -s nullglob

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
if [ -n "${REPO_ROOT:-}" ]; then
  REPO_ROOT="$REPO_ROOT"
elif REPO_ROOT=$(git -C "$SCRIPT_DIR" rev-parse --show-toplevel 2>/dev/null); then
  :
else
  REPO_ROOT=$(cd "$SCRIPT_DIR/../.." && pwd)
fi

PROMPT_SOURCE="$REPO_ROOT/.codex/prompts"
DEST_DIR="$HOME/.codex/prompts"

echo "Syncing Codex prompts to $DEST_DIR"

mkdir -p "$DEST_DIR"

source_files=("$PROMPT_SOURCE"/*.md)
if [ ${#source_files[@]} -eq 0 ]; then
  echo "No *.md prompts found in $PROMPT_SOURCE; nothing to sync."
  exit 0
fi

added_prompts=()
updated_prompts=()
unchanged_prompts=()

for src_path in "${source_files[@]}"; do
  base_name=$(basename "$src_path")
  dest_path="$DEST_DIR/$base_name"

  if [ ! -f "$dest_path" ]; then
    cp "$src_path" "$dest_path"
    chmod 644 "$dest_path"
    added_prompts+=("$base_name")
    continue
  fi

  if cmp -s "$src_path" "$dest_path"; then
    unchanged_prompts+=("$base_name")
    continue
  fi

  cp "$src_path" "$dest_path"
  chmod 644 "$dest_path"
  updated_prompts+=("$base_name")
done

if [ ${#added_prompts[@]} -gt 0 ]; then
  echo "Added prompts:"
  printf '  %s\n' "${added_prompts[@]}"
fi

if [ ${#updated_prompts[@]} -gt 0 ]; then
  echo "Updated prompts:"
  printf '  %s\n' "${updated_prompts[@]}"
fi

if [ ${#unchanged_prompts[@]} -gt 0 ]; then
  echo "Unchanged prompts:"
  printf '  %s\n' "${unchanged_prompts[@]}"
fi

if [ ${#added_prompts[@]} -eq 0 ] && [ ${#updated_prompts[@]} -eq 0 ]; then
  echo "No prompt changes detected."
fi

echo "Prompt sync complete"
