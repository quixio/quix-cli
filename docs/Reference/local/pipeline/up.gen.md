# local pipeline up

## Overview

Run your pipeline using docker compose

**Aliases:** up, run

**Usage:**

```
quix local pipeline up [options]
```

**Options:**

- `--directory <directory>` : If specified, it will use that directory instead of the current one
- `--dry-run` : Generate 'compose.yaml' without running it
- `-u, --update` : Update 'quix.yaml' with the new local applications and update the variables of the existing deployments

