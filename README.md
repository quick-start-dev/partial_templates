
# reusable partial templates for quick-start.dev

This repo contains reusable partial templates grouped by language and framework.

---

## Repository structure

```

├── generate_index.py    # Script to merge per-template meta JSON into index.json
├── generate_meta.py     # Script to generate meta JSON files for new templates
├── index.json           # Combined index of all templates (auto-generated)
└── partial_templates/   # Your templates organized by language/framework

```

---

## Contributor Guide

To contribute new templates:

1. Add your template files under `partial_templates/` following the folder structure:

```

partial_templates/<language>/<framework>/<template_file>

```

For example:

```

partial_templates/dart/flutter/login_form.dart

````

2. Run the meta generation script to create meta JSON files for any new templates:

```bash
python generate_meta.py
````

3. Edit the generated `.json` meta files next to your templates to add descriptions, tags, or other metadata.

4. Send a merge request.

---

## Notes

* Do **not** edit `index.json` manually. It is auto-generated from per-template meta JSON files.
* Keep meta JSON files small and next to their templates for easy editing and to avoid merge conflicts.
* Follow the folder structure strictly to keep language and framework detection accurate.

---

Thank you for contributing!


