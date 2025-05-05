# init

## Overview

Generate the initial Quix files based on the existing repository

**Aliases:** `init`

**Usage:**

```
quix init [<directory>] [options]
```

**Arguments:**

- `<directory>`: Base directory (defaults to current directory)

**Options:**

- `-d, --devcontainer, --devcontainers`: If specified, generates devcontainers files
- `-g, --generate-dockerfiles`: If specified, generates dockerfiles based on the applications [default: True]
- `-u, --update, --update-dotenv`: Update the '.env' files even if they already exist
- `-r, --reset, --reset-dotenv`: Reset the '.env' files and recreate them

