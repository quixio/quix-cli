# applications variables export

## Overview

Exports the variables from app.yaml to an .env file

**Aliases:** `export`, `exp`, `export-to-dotenv`

**Usage:**

```
quix applications variables export [options]
```

**Options:**

- `--workspace-id <workspace-id>` : The environment to use if your Sdk broker configuration is set to Quix Cloud
- `--env-file-name <env-file-name>` : Set the name of the environment file [default: .env]
- `--directory <directory>` : Base directory (defaults to current directory)
- `--reset` : Removes all the values of existing env variables and adds them from the app.yaml file [default: False]

