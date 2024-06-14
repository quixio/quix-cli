{% include-markdown './delete.gen.md' %}
## How It Works

This command is used to delete a specific permission assigned to a user within an organization. This command requires specifying the user ID and the scope of the permission to be deleted. The command can be run in both interactive and non-interactive modes, making it versatile for different use cases.

In interactive mode, if the user ID is not provided, the command will prompt you to select a user. Once the user is selected, it will proceed to delete the specified permission scope. If the user ID is provided directly, the command will use it to identify the user and delete the permission without further prompts.

## Example Usage

### Interactive

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

After successfully deleting the permission, the console will display your current permissions

### Non-Interactive

To delete a user's permission by directly specifying the user ID and permission scope:

```bash
$ quix users permissions delete <user-id> --scope "Workspace:myorg-projecta-environmentx"
```

!!! tip

    In order to get the user id you can use [this](../list.md) command

