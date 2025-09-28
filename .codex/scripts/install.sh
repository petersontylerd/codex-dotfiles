#!/usr/bin/env bash
# ABOUTME: Fetches Codex dotfiles from the remote master branch and stages them into the target project.
# ABOUTME: Invoked by create_github_repo.sh when the --codex-code flag is supplied.

set -euo pipefail

REPO_URL="https://github.com/petersontylerd/codex-dotfiles"
TARBALL_URL="${REPO_URL}/archive/refs/heads/master.tar.gz"

usage() {
  printf 'Usage: %s <destination_directory>\n' "$(basename "$0")" >&2
}

if [[ $# -ne 1 ]]; then
  usage
  exit 1
fi

DEST_DIR="$1"
mkdir -p "$DEST_DIR"

TMP_DIR="$(mktemp -d)"
cleanup() {
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT

TARBALL_PATH="$TMP_DIR/codex-dotfiles.tar.gz"
EXTRACT_DIR="$TMP_DIR/codex-dotfiles"
mkdir -p "$EXTRACT_DIR"

printf '[install.sh] Downloading Codex dotfiles from %s\n' "$TARBALL_URL"
curl -fsSL "$TARBALL_URL" -o "$TARBALL_PATH"

tar -xzf "$TARBALL_PATH" -C "$EXTRACT_DIR" --strip-components=1
SOURCE_DIR="$EXTRACT_DIR"

FILES_TO_COPY=(
  "AGENTS.md"
  "MASTER_AGENTS.md"
)

DIRECTORIES_TO_COPY=(
  ".codex"
)

printf '[install.sh] Copying files...\n'
for file in "${FILES_TO_COPY[@]}"; do
  SOURCE_FILE="$SOURCE_DIR/$file"
  DEST_FILE="$DEST_DIR/$file"
  if [[ -f "$SOURCE_FILE" ]]; then
    if [[ -e "$DEST_FILE" ]]; then
      printf '  ! Destination file already exists: %s\n' "$DEST_FILE" >&2
      exit 1
    fi
    printf '  - %s\n' "$file"
    mkdir -p "$(dirname "$DEST_FILE")"
    cp "$SOURCE_FILE" "$DEST_FILE"
  else
    printf '  ! Missing %s in archive\n' "$file" >&2
    exit 1
  fi
done

printf '[install.sh] Copying directories...\n'
for directory in "${DIRECTORIES_TO_COPY[@]}"; do
  SOURCE_PATH="$SOURCE_DIR/$directory"
  DEST_PATH="$DEST_DIR/$directory"
  if [[ -d "$SOURCE_PATH" ]]; then
    if [[ -e "$DEST_PATH" ]]; then
      printf '  ! Destination directory already exists: %s\n' "$DEST_PATH" >&2
      exit 1
    fi
    printf '  - %s\n' "$directory"
    mkdir -p "$(dirname "$DEST_PATH")"
    cp -a "$SOURCE_PATH" "$DEST_PATH"
  else
    printf '  ! Missing %s in archive\n' "$directory" >&2
    exit 1
  fi
done

printf '[install.sh] Dotfiles installed into %s\n' "$DEST_DIR"
