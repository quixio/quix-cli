# pipeline sync

## Overview

Synchronize your local pipeline to Quix Cloud

**Aliases:** `sync`, `deploy`

**Usage:**

```
quix pipeline sync [options]
```

**Options:**

- `--workspace-id <workspace-id>` : Select a concrete workspace-id to sync to
- `--directory <directory>` : Base directory (defaults to current directory)
- `-c, --skip-update, --use-current` : Use the current 'quix.yaml' without the new local changes
- `-k, --keep-variables` : Keep the locally deleted variables
- `-p, --push` : Push the current changes to your repository
- `-m, --commit-message <commit-message>` : The message used for the commit if using '--push'

