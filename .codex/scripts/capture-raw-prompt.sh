#!/usr/bin/env bash
set -euo pipefail

# Usage: ./scripts/capture_raw_prompt.sh <INITIATIVE_NAME>
# Example: ./scripts/capture_raw_prompt.sh sample-initiative
#
# This will write to:
#   <project_root>/scratchpaper/initiatives/<INITIATIVE_NAME>/prompts/raw/

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <INITIATIVE_NAME>"
  exit 1
fi

INITIATIVE_NAME="$1"

# Figure out project root based on script location:
#   scripts/ -> project root = parent directory of scripts/
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

# Base dir for this initiative
INITIATIVES_ROOT="${PROJECT_ROOT}/scratchpaper/initiatives"
BASE_DIR="${INITIATIVES_ROOT}/${INITIATIVE_NAME}"
RAW_DIR="${BASE_DIR}/prompts/raw"

# Ensure target directory exists
mkdir -p "$RAW_DIR"

# Sanitize the initiative name for filesystem safety
SANITIZED_INITIATIVE_NAME="$(echo "$INITIATIVE_NAME" | tr ' ' '-' | tr -cd '[:alnum:]-_')"

# Timestamped filename
TIMESTAMP="$(date +"%Y%m%d%H%M%S")"
OUTFILE="${RAW_DIR}/${TIMESTAMP}-${SANITIZED_INITIATIVE_NAME}.md"

echo "➤ Initiative: ${INITIATIVE_NAME}"
echo "➤ Target directory: ${RAW_DIR}"
echo
echo "➤ Paste your markdown block below."
echo "➤ When you're done, press Ctrl-D (on a new line) to save."
echo

# Read stdin (your pasted block) into the file
cat > "$OUTFILE"

echo
echo "✅ Saved: $OUTFILE"
