# sdk broker pipeline

## Overview

Reset the SDK broker configuration to use the local pipeline broker at 'localhost:19092', overriding any custom local broker settings

**Aliases:** `pipeline`, `pipe`, `pl`

**Usage:**

```
quix sdk broker pipeline [options]
```

**Options:**

- `--env-file-name <env-file-name>`: Set the name of the environment file [default: .env]
- `--directory <directory>`: Base directory (defaults to current directory)
- `--update`: Update '.env' files of all the applications with the current SDK broker configuration

