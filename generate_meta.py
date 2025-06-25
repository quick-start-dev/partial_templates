import os
import json


def generate_meta_files(templates_dir="partial_templates"):
    for root, _, files in os.walk(templates_dir):
        for file in files:
            path = os.path.join(root, file)
            if file.endswith(".json"):
                continue  # skip meta files
            meta_file = path + ".json"
            if not os.path.exists(meta_file):
                rel_path = os.path.relpath(path, templates_dir)
                parts = rel_path.split(os.sep)
                language = parts[0]
                framework = parts[1] if len(parts) > 1 and parts[1] != file else "core"

                meta_content = {
                    "path": path,
                    "filename": file,
                    "description": "",
                    "tags": [],
                    "language": language,
                    "framework": framework,
                }

                with open(meta_file, "w", encoding="utf-8") as f:
                    json.dump(meta_content, f, indent=2)


if __name__ == "__main__":
    generate_meta_files()
