# deployments logs

## Overview

Get deployments logs

**Aliases:** logs

**Usage:**

```
quix deployments logs [<deployment-id>] [options]
```

**Arguments:**

- `<deployment-id>` : deployment-id

**Options:**

- `-r, --replica <replica>` : Optional replica number. If not specified, logs from replica 0 will be returned
- `-f, --file` : If specified, dumps the entire log to a file in the current directory, otherwise it writes into stdout

