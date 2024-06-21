# cloud users permissions edit

## Overview

Adds or edits the value of a single permission of a user in the organisation. Available roles: [Admin, Manager, Editor, Viewer]

**Aliases:** `edit`

**Usage:**

```
quix cloud users permissions edit [<user-id>] [options]
```

**Arguments:**

- `<user-id>` : id of the user

**Options:**

- `-p, --permission-assignments <permission-assignments>` : Array of permission assignments in the format "[{Scope, Role}, {Scope, Role}, ...]"

