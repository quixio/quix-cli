# cloud variables set

## Overview

Create or update a project variable

**Aliases:** `set`

**Usage:**

```
quix cloud variables set <key> <value> [options]
```

**Arguments:**

- `<key>`: The key of the variable
- `<value>`: The value of the variable

**Options:**

- `-s, --secret`: Mark the variable as a secret (encrypted at rest, hidden in responses)
- `-d, --default`: Sets the default value of the variable instead of the one for the environment
- `-r, --repository-id <repository-id>`: The ID of the repository in case no workspace-id is provided and --default is set
- `-w, --workspace-id <workspace-id>`: The ID of the environment
- `-o, --output <json|table>`: Output type of the retrieved data

