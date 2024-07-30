# pipeline deployments logs

## Overview

View output from a given deployment in the local pipeline

**Aliases:** `logs`

**Usage:**

```
quix pipeline deployments logs [<deployment-name>] [options]
```

**Arguments:**

- `<deployment-name>` : The name of deployment

**Options:**

- `--directory <directory>` : If specified, it will use that directory instead of the current one
- `-f, --follow` : Follow log output
- `-n, --tail <tail>` : Number of lines to show from the end of the logs for each container (default "all")
- `--since <since>` : Show logs since timestamp (e.g.2013-01-02T13:23:37Z) or relative (e.g. 42m for 42 minutes)
- `--until <until>` : Show logs before a timestamp (e.g.2013-01-02T13:23:37Z) or relative (e.g. 42m for 42 minutes)
