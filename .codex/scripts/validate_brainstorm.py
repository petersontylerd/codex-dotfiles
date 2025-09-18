#!/usr/bin/env python3
import re, sys, json, pathlib
from typing import Tuple
import yaml  # PyYAML
from jsonschema import Draft202012Validator

BRAINSTORM_MD = pathlib.Path("./.codex/product-plan/foundation/product-plan-brainstorm.md")
SCHEMA_PATH = pathlib.Path("./.codex/schemas/brainstorm-summary.schema.json")
PLACEHOLDER_RE = re.compile(r"\b(TBD|TBA|N/?A|\\?\\?\\?|lorem ipsum)\b", re.IGNORECASE)

def extract_yaml(md_text: str) -> Tuple[str, str]:
    """
    Returns (yaml_text, non_yaml_noise)
    Ensures exactly one fenced yaml block and nothing else but whitespace/comments.
    """
    fences = list(re.finditer(r"```yaml\\s*(.*?)```", md_text, flags=re.DOTALL | re.IGNORECASE))
    if len(fences) != 1:
        raise ValueError(f"Expected exactly one fenced yaml block, found {len(fences)}.")
    yaml_text = fences[0].group(1).strip()
    before = md_text[:fences[0].start()].strip()
    after = md_text[fences[0].end():].strip()
    non_yaml_noise = "\\n".join([s for s in (before, after) if s])
    return yaml_text, non_yaml_noise

def fail(msg: str) -> None:
    print(f"❌ {msg}", file=sys.stderr)
    sys.exit(1)

def main():
    if not BRAINSTORM_MD.exists():
        fail(f"File not found: {BRAINSTORM_MD}")

    md_text = BRAINSTORM_MD.read_text(encoding="utf-8")
    try:
        yaml_text, noise = extract_yaml(md_text)
    except ValueError as e:
        fail(str(e))

    if noise:
        fail("Markdown must contain only a single fenced yaml block and no extra prose.")

    try:
        data = yaml.safe_load(yaml_text)
    except Exception as e:
        fail(f"YAML parse error: {e}")

    # Placeholder scan across all strings
    def scan_placeholders(obj, path=""):
        if isinstance(obj, dict):
            for k, v in obj.items():
                scan_placeholders(v, f"{path}.{k}" if path else k)
        elif isinstance(obj, list):
            for i, v in enumerate(obj):
                scan_placeholders(v, f"{path}[{i}]")
        elif isinstance(obj, str):
            if PLACEHOLDER_RE.search(obj):
                fail(f'Placeholder text found at "{path}": "{obj}"')

    scan_placeholders(data)

    try:
        schema = json.loads(SCHEMA_PATH.read_text(encoding="utf-8"))
    except Exception as e:
        fail(f"Schema read error: {e}")

    validator = Draft202012Validator(schema)
    errors = sorted(validator.iter_errors(data), key=lambda e: e.path)

    if errors:
        print("❌ Schema validation failed:", file=sys.stderr)
        for err in errors:
            loc = "/".join([str(p) for p in err.path]) or "<root>"
            print(f"  • {loc}: {err.message}", file=sys.stderr)
        sys.exit(2)

    print("✅ Brainstorm YAML is valid.")
    sys.exit(0)

if __name__ == "__main__":
    main()
