#!/usr/bin/env bash
# ABOUTME: Fetches Codex dotfiles from the remote master branch and stages them into the target project.
# ABOUTME: Invoked by local create_github_repo.sh when the --codex flag is supplied.

set -euo pipefail

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'
log()  { printf "${GREEN}[INSTALL]${NC} %s\n" "$*"; }
oops() { printf "${RED}[ERROR]${NC} %s\n" "$*" >&2; exit 1; }

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
if [[ ! -d "$DEST_DIR" ]]; then
  oops "Destination directory does not exist: $DEST_DIR"
fi

command -v curl >/dev/null || oops "curl not found."
command -v tar  >/dev/null || oops "tar not found."

TMP_DIR="$(mktemp -d)"
cleanup() {
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT

TARBALL_PATH="$TMP_DIR/codex-dotfiles.tar.gz"
EXTRACT_DIR="$TMP_DIR/codex-dotfiles"
mkdir -p "$EXTRACT_DIR"

log "Downloading Codex dotfiles from $TARBALL_URL"
curl -fsSL "$TARBALL_URL" -o "$TARBALL_PATH"

tar -xzf "$TARBALL_PATH" -C "$EXTRACT_DIR" --strip-components=1
SOURCE_DIR="$EXTRACT_DIR"

if [[ ! -d "$SOURCE_DIR" ]]; then
  oops "Extracted Codex dotfiles not found at: $SOURCE_DIR"
fi

FILES_TO_COPY=(
  "AGENTS.md"
  "MASTER_AGENTS.md"
)

DIRECTORIES_TO_COPY=(
  ".codex"
)

log "Copying files..."
for file in "${FILES_TO_COPY[@]}"; do
  SOURCE_FILE="$SOURCE_DIR/$file"
  DEST_FILE="$DEST_DIR/$file"
  if [[ -f "$SOURCE_FILE" ]]; then
    if [[ -e "$DEST_FILE" ]]; then
      oops "Destination file already exists: $DEST_FILE"
    fi
    log "  - $file"
    mkdir -p "$(dirname "$DEST_FILE")"
    cp "$SOURCE_FILE" "$DEST_FILE"
  else
    oops "Missing $file in archive"
  fi
done

log "Copying directories..."
for directory in "${DIRECTORIES_TO_COPY[@]}"; do
  SOURCE_PATH="$SOURCE_DIR/$directory"
  DEST_PATH="$DEST_DIR/$directory"
  if [[ -d "$SOURCE_PATH" ]]; then
    if [[ -e "$DEST_PATH" ]]; then
      oops "Destination directory already exists: $DEST_PATH"
    fi
    log "  - $directory"
    mkdir -p "$(dirname "$DEST_PATH")"
    cp -a "$SOURCE_PATH" "$DEST_PATH"
  else
    oops "Missing $directory in archive"
  fi
done

log "Dotfiles installed into $DEST_DIR"
