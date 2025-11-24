#!/usr/bin/env bash
set -euo pipefail

# Usage: ./initiative-scaffold.sh <initiative-name>
# Example: ./initiative-scaffold.sh sample-initiative

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <initiative-name>"
  exit 1
fi

INITIATIVE_NAME="$1"

# Root the scaffold at the repository that contains this script.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
BASE_DIR="${PROJECT_ROOT}/scratchpaper/initiatives/${INITIATIVE_NAME}"

mkdir -p "${BASE_DIR}/checklists/raw"
mkdir -p "${BASE_DIR}/checklists/optimized"
mkdir -p "${BASE_DIR}/plans/optimized"
mkdir -p "${BASE_DIR}/plans/raw"
mkdir -p "${BASE_DIR}/prompts/optimized"
mkdir -p "${BASE_DIR}/prompts/raw"

echo "✅ Created initiative directory tree at: ${BASE_DIR}"
