# cloud secrets set

## Overview

Sets a secret of an environment

**Aliases:** `set`

**Usage:**

```
quix cloud secrets set [<workspace-id>] [options]
```

**Arguments:**

- `<workspace-id>`: The ID of the environment

**Options:**

- `-k, --key <key>`: The key of the secret
- `-V, --value <value>`: The value of the secret
- `-d, --default`: Sets the default value of the secret instead of the one for the environment
- `-r, --repository-id <repository-id>`: The ID of the repository in case no workspace-id is provided and --default is set
- `-o, --output <json|table>`: Output type of the retrieved data

