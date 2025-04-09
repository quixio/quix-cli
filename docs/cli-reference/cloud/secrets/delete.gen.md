# cloud secrets delete

## Overview

Deletes a secret of an environment

**Aliases:** `delete`, `del`, `remove`, `rm`

**Usage:**

```
quix cloud secrets delete [<workspace-id>] [options]
```

**Arguments:**

- `<workspace-id>`: The ID of the environment

**Options:**

- `-k, --key <key>`: The key of the secret
- `-d, --default`: Deletes the default value of the secret instead of the one for the environment
- `-r, --repository-id <repository-id>`: The ID of the repository in case no workspace-id is provided and --default is set
- `-a, --delete-all-values`: Deletes all the values for a given key instead of the value from a single environment or the default
- `-o, --output <json|table>`: Output type of the retrieved data

