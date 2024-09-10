# pipeline deployments create

## Overview

Add a local deployment

**Aliases:** `create`, `add`

**Usage:**

```
quix pipeline deployments create [<application-id>] [options]
```

**Arguments:**

- `<application-id>`: The ID or path of the application you want to deploy

**Options:**

- `--name <name>`: Name of the deployment (defaults to the name of the application)
- `--directory <directory>`: Base directory (defaults to current directory)
- `--version <version>`: Selects the version of the application to deploy (latest/commit/tag)

