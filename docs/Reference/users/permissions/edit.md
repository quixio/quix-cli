{% include-markdown './edit.gen.md' %}

### How It Works

The `quix user permissions edit` command is used to add or edit the value of a single permission of a user in the organization. This command allows specifying the scope and role for the permission, effectively updating the user's permissions.

### Example Usage

#### Interactive

When you run the command without specifying the user ID or permission assignments, it will guide you through selecting a user and editing permissions interactively.

```bash
$ quix user permissions edit
? Select user:
> john.doe@myorg.com                    John Doe
  jane.doe@myorg.com                    Jane Doe
  user1@myorg.com                       User One
  user2@myorg.com                       User Two
  user3@myorg.com                       User Three
```

Next, you will be prompted to select the role for the existing scopes

```bash
? Select role for scope myorg-projecta-environmentx (Workspace) [Admin]:

> Admin
  Manager
  Editor
  Viewer
  ✗ Cancel
```

Finally, confirm the permissions.

```bash
  Scope                                           | Role
 -------------------------------------------------|------
  Workspace:myorg-projecta-environmentx           | Admin

? Use these permissions?: [y/n] (y):
```

### Non-Interactive

You can also run the command by specifying the user ID and permission assignments directly. This allows for quick updates without interactive prompts.

```bash
$ quix user permissions edit user1@myorg.com --permission-assignments "[{Workspace:myorg-projecta-environmentx, Admin}]"
```

After setting or editing the permissions, you will be asked to confirm the changes. If confirmed, the updated permissions will be saved.

```bash
  Scope                                           | Role
 -------------------------------------------------|------
  Workspace:myorg-projecta-environmentx           | Admin

? Use these permissions?: [y/n] (y):
```
