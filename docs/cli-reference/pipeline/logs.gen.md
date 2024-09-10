# pipeline logs

## Overview

View output from deployments of the local pipeline

**Aliases:** `logs`

**Usage:**

```
quix pipeline logs [<deployment-name>] [options]
```

**Arguments:**

- `<deployment-name>`: The name of deployment

**Options:**

- `--directory <directory>`: If specified, it will use that directory instead of the current one
- `--all`: If specified it will get all deployments logs
- `-f, --follow`: Follow log output
- `-n, --tail <tail>`: Number of lines to show from the end of the logs for each container (default "all")
- `--since <since>`: Show logs since timestamp (e.g.2013-01-02T13:23:37Z) or relative (e.g. 42m for 42 minutes)
- `--until <until>`: Show logs before a timestamp (e.g.2013-01-02T13:23:37Z) or relative (e.g. 42m for 42 minutes)

