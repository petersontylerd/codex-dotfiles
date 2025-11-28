# ABOUTME: Copies agent doublecheck, checklist workflow, and misc-ops prompt files into a destination repo.
# ABOUTME: Keeps prompts in sync without recreating source subdirectories.

set -euo pipefail

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
repo_root=$(cd "$script_dir/../.." && pwd)

usage() {
  echo "Usage: $0 --destination-repo /path/to/repo" 1>&2
  exit 1
}

destination_repo=""

while [ $# -gt 0 ]; do
  case "$1" in
    --destination-repo)
      destination_repo=${2-}
      shift 2
      ;;
    --help|-h)
      usage
      ;;
    *)
      echo "Unknown argument: $1" 1>&2
      usage
      ;;
  esac
done

if [ -z "$destination_repo" ]; then
  echo "Missing required flag --destination-repo" 1>&2
  usage
fi

if [ ! -d "$destination_repo" ]; then
  echo "Destination repo does not exist: $destination_repo" 1>&2
  exit 1
fi

sources=(
  "$repo_root/.codex/prompts/agent_doublecheck"
  "$repo_root/.codex/prompts/checklist-workflow"
  "$repo_root/.codex/prompts/misc-ops"
)

dest_prompts="$destination_repo/.codex/prompts"
mkdir -p "$dest_prompts"

for src_dir in "${sources[@]}"; do
  if [ ! -d "$src_dir" ]; then
    echo "Source directory not found: $src_dir" 1>&2
    exit 1
  fi

  for file_path in "$src_dir"/*; do
    [ -f "$file_path" ] || continue
    base_name=$(basename "$file_path")
    cp -f "$file_path" "$dest_prompts/$base_name"
    echo "Copied $base_name to $dest_prompts"
  done
done

echo "Prompt sync complete."
