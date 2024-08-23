# sdk broker set

## Overview

Set a local broker address for the SDK broker configuration

**Aliases:** `set`

**Usage:**

```
quix sdk broker set [<address>] [options]
```

**Arguments:**

- `<address>` : The broker address for the SDK broker configuration (ie: localhost:19092)

**Options:**

- `--enable` : Enables Local broker as SDK broker configuration
- `--workspace-id <workspace-id>` : The environment to use if your SDK broker configuration is set to Quix Cloud
- `--env-file-name <env-file-name>` : Set the name of the environment file [default: .env]
- `--directory <directory>` : Base directory (defaults to current directory)
- `--update` : Update '.env' files of all the applications with the current SDK broker configuration []

