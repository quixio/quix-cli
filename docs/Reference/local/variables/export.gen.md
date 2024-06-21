# local variables export

## Overview

Exports the variables from app.yaml to an .env file

**Aliases:** export, exp, export-to-dotenv

**Usage:**

```
quix local variables export [options]
```

**Options:**

- `--workspace-id <workspace-id>` : 
- `--env-file-name <env-file-name>` : [default: .env]
- `--directory <directory>` : Base directory (defaults to current directory)
- `--reset` : Removes all the values of existing env variables and adds them from the app.yaml file [default: False]

