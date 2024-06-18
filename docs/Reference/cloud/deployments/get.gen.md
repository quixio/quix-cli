# cloud deployments get

## Overview

Get the details for a deployment

**Aliases:** get

**Usage:**

```
quix cloud deployments get [<deployment-id> [<workspace-id>]] [options]
```

**Arguments:**

- `<deployment-id>` : The ID of the deployment
- `<workspace-id>` : If specified, only deployments in that environment will be returned

**Options:**

- `-f, --follow` : If specified, the command will not exit and will continually watch for changes
- `-c, --cls` : If specified, clear the screen before printing
- `-o, --output <json|table>` : Output type of the retrieved data

