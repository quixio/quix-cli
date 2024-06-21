# deployments list

## Overview

Get the information for all the deployments in an environment

**Aliases:** list, ls

**Usage:**

```
quix deployments list <workspace-id> [options]
```

**Arguments:**

- `<workspace-id>` : If specified, only deployments in the specified environment will be returned

**Options:**

- `-o, --output <json|table>` : Output type of the retrieved data
- `-f, --follow` : If specified, the command will not exit and will continually watch for changes
- `-c, --cls` : If specified, clear the screen before printing

