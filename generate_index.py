import json
import os


def generate_index(templates_dir="partial_templates", output_file="index.json"):
    meta_list = []
    for root, _, files in os.walk(templates_dir):
        for file in files:
            if file.endswith(".json"):
                meta_path = os.path.join(root, file)
                with open(meta_path, "r", encoding="utf-8") as f:
                    meta = json.load(f)
                    meta_list.append(meta)
    with open(output_file, "w", encoding="utf-8") as f:
        json.dump(meta_list, f, indent=2)
    print(f"Merged {len(meta_list)} meta files into {output_file}")


if __name__ == "__main__":
    generate_index()
