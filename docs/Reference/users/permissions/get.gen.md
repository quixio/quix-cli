# users permissions get

## Overview

Get the permissions of a user or all the users in the organisation

**Aliases:** get

**Usage:**

```
quix users permissions get [<user-id>] [options]
```

**Arguments:**

- `<user-id>` : id of the user

**Options:**

- `-o, --output <json|table>` : Output type of the retrieved data
- `--raw` : Prints the array of permission assignments in the format "[{Scope, Role}, {Scope, Role}, ...]"

