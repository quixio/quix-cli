# users tokens create

## Overview

Creates a new personal access token

**Aliases:** create, add

**Usage:**

```
quix users tokens create <name> [options]
```

**Arguments:**

- `<name>` : A name that describes the new token

**Options:**

- `-o, --output <json|table>` : Output type of the retrieved data
- `--expires-at <expires-at>` : Define when the token will expire. Supports ISO 8601 dates: 'YYYY-MM-DD HH:MM:SS.sss'. All times UTC. [default: 2025-06-07]
- `-p, --permission-assignments <permission-assignments> (REQUIRED)` : Array of permission assignments in the format "[{Scope, Permission, Permission, ..}, {Scope, Permission, Permission, ..}, ...]"

