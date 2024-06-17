{% include-markdown './set.gen.md' %}

## How It Works

The `set` command is used to assign permissions to a user in your organization. This command replaces the current permissions with the ones specified.

1. **User Identification**:
    - You can specify the user ID directly. If not provided, the command will enter interactive mode to select a user.

2. **Scope and Role Specification**:
    - You can define the scope and role of the permissions. If not specified, the command will enter interactive mode to select projects, environments, and roles.

!!! note
  If you just want to modify a specific permission instead, refer to [this](./edit.md) command.

## Example Usage

### Interactive Mode

Select the user:

```bash
$ quix user permissions set
? Select user:
> john.doe@myorg.com                    John Doe
  jane.doe@myorg.com                    Jane Doe
  user1@myorg.com                       User One
  user2@myorg.com                       User Two
  user3@myorg.com                       User Three
```

Then select the resource:

```bash
? Select resources:
> [ ] MyOrg
  [ ] Project A
    [X] Environment X
   [ ] ProjectB
    [ ] EnvironmentY

Use the arrow keys to navigate: ↑ ↓
(Press <space> to select, <enter> to accept)
```

Select the role for this resource:

```bash
? Select role for scope Project A - Environment X (Workspace) []:
> Admin
  Manager
  Editor
  Viewer
```

Confirm the permissions:

```bash
  Scope                                           | Role
 -------------------------------------------------|------
  Workspace:myorg-projecta-environmentx           | Admin

? Use these permissions?: [y/n] (y):
```

### Non-Interactive Mode

```bash
$ quix user permissions set <userId> --scope Workspace:myorg-projecta-environmentx --role Admin
```

!!! tip
    To get the user ID, you can use [this](../list.md) command.
