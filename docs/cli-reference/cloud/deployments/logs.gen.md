# cloud deployments logs

## Overview

Get deployments logs

**Aliases:** `logs`

**Usage:**

```
quix cloud deployments logs [<deployment-id>] [options]
```

**Arguments:**

- `<deployment-id>`: deployment-id

**Options:**

- `-r, --replica <replica>`: Optional replica number. If not specified, logs from replica 0 will be returned
- `-f, --file`: If specified, dumps the entire log to a file in the current directory, otherwise it writes into stdout
- `-t, --tail <tail>`: Number of most recent log lines to display. Default: 100 for non-interactive mode, streaming for interactive mode
- `-s, --skip <skip>`: Number of most recent log lines to skip before applying --tail (for pagination). Default: 0
- `-i, --info`: Show pagination information
- `--no-follow`: Disable log streaming. When used with --tail, only shows snapshot without continuing to stream new logs

