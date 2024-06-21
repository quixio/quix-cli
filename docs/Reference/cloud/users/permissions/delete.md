{% include-markdown './delete.gen.md' %}

## How It Works

The `delete` command is used to remove a specific permission assigned to a user within an organization. This requires specifying the user ID and the scope of the permission to be deleted. The command can be run in both interactive and non-interactive modes, making it versatile for different use cases.

## Example Usage

### Interactive Mode

If you run the command without specifying the user ID, it will enter interactive mode:

```bash
$ quix users permissions delete --scope "Workspace:myorg-projecta-environmentx"
```

In this mode, you will be prompted to select the user from a list:

```bash
? Select user:
> john.doe@myorg.com                    John Doe
  jane.doe@myorg.com                    Jane Doe
  user1@myorg.com                       User One
  user2@myorg.com                       User Two
  user3@myorg.com                       User Three
```

After successfully deleting the permission, the console will display your current permissions.

### Non-Interactive Mode

To delete a user's permission by directly specifying the user ID and permission scope:

```bash
$ quix users permissions delete <user-id> --scope "Workspace:myorg-projecta-environmentx"
```

!!! tip
    To get the user ID, you can use [this](../list.md) command.
