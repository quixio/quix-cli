# apps update

## Overview

Updates the application's '.env' file with the variables from 'quix.yaml'

**Aliases:** `update`, `upd`

**Usage:**

```
quix apps update [options]
```

**Options:**

- `-a, --all` : Forces the update of all applications regardless of the current directory
- `--workspace-id <workspace-id>` : The environment to use if your SDK broker configuration is set to Quix Cloud
- `--env-file-name <env-file-name>` : Set the name of the environment file [default: .env]
- `--directory <directory>` : Base directory (defaults to current directory)
- `--reset` : Removes all the values of existing env variables and adds them from the 'quix.yaml' file [default: False]
- `--only-new` : Add only the missing variables in the '.env' file [default: False]

