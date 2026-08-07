# cloud variables delete

## Overview

Delete a project variable

**Aliases:** `delete`, `del`, `remove`, `rm`

**Usage:**

```
quix cloud variables delete <key> [options]
```

**Arguments:**

- `<key>`: The key of the variable

**Options:**

- `-d, --default`: Deletes the default value of the variable instead of the one for the environment
- `-r, --repository-id <repository-id>`: The ID of the repository in case no workspace-id is provided and --default is set
- `-w, --workspace-id <workspace-id>`: The ID of the environment
- `-a, --delete-all-values`: Deletes all the values for a given key instead of the value from a single environment or the default
- `-o, --output <json|table>`: Output type of the retrieved data
