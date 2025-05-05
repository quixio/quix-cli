# cloud users tokens edit

## Overview

Edits an existing personal access token

**Aliases:** `edit`

**Usage:**

```
quix cloud users tokens edit <token-id> [options]
```

**Arguments:**

- `<token-id>`: The id of the token you want to edit

**Options:**

- `-o, --output <json|table>`: Output type of the retrieved data
- `--name <name>`: The new name for the token
- `--expires-at <expires-at>`: Define when the token will expire. Supports ISO 8601 dates: 'YYYY-MM-DD HH:MM:SS.sss'. All times UTC
- `-p, --permission-assignments <permission-assignments> (REQUIRED)`: Array of permission assignments in the format "[{Scope, Permission, Permission, ..}, {Scope, Permission, Permission, ..}, ...]"

