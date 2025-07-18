# pipeline up

## Overview

Run your pipeline using docker compose

**Aliases:** `up`

**Usage:**

```
quix pipeline up [options]
```

**Options:**

- `--directory <directory>`: If specified, it will use that directory instead of the current one
- `-D, --dry-run`: Generate 'compose.yaml' without running it
- `-u, --update`: Update 'quix.yaml' with the new local applications and update the variables of the existing deployments
- `-s, --skip-topics`: Skip topics creation, in this case Quix Streams might create the topics automatically
- `-k, --keep-variables`: Keep the locally deleted variables
- `-p, --preserve-dockerignore`: Retain existing <Dockerfile>.dockerignore files; skip automatic cleanup when an app no longer specifies IncludedFolders

