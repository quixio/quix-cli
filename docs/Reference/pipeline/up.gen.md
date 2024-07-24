# pipeline up

## Overview

Run your pipeline using docker compose

**Aliases:** `up`

**Usage:**

```
quix pipeline up [options]
```

**Options:**

- `--directory <directory>` : If specified, it will use that directory instead of the current one
- `-D, --dry-run` : Generate 'compose.yaml' without running it
- `-c, --skip-update, --use-current` : Use the current 'quix.yaml' without the new local changes
- `-s, --skip-topics` : Skip topics creation, in this case Quix Streams might create the topics automatically
- `-k, --keep-variables` : Keep the locally deleted variables

