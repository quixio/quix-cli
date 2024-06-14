# local pipeline sync

## Overview

Synchronize your local pipeline to Quix Cloud.

**Aliases:** sync, deploy

**Usage:**

```
quix local pipeline sync [options]
```

**Options:**

- `--workspace-id <workspace-id>` : Select a concrete workspace-id to sync to
- `--directory <directory>` : Base directory (defaults to current directory)
- `-u, --update` : Update 'quix.yaml' with the new local applications and update the variables of the existing deployments
- `-m, --commit-message <commit-message>` : The message used for the commit if using '--push'

