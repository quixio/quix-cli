# pipeline update

## Overview

Update 'quix.yaml' with the new local applications and update the variables of the existing deployments

**Aliases:** `update`, `upd`

**Usage:**

```
quix pipeline update [options]
```

**Options:**

- `--directory <directory>`: Base directory (defaults to current directory)
- `--existing, --only-existing`: Update only existing deployments
- `--new, --only-new`: Add only the applications that are not currently deployed
- `-a, --all`: Forces the update of all applications regardless of the current directory
- `--new-variables, --only-new-variables`: Only add new variables to the deployments without updating rest of the variables
- `--keep-variables`: Keep all the deployment variables even if they were removed in the '.env' file
- `--reset`: Removes all deployments and topics from the 'quix.yaml' file. This operation is performed before any updates or additions to ensure a clean state

