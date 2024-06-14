{% include-markdown './copy.gen.md' %}

## How It Works

The `copy` command is used to replicate the permissions from one user to other users within your organization. This allows for efficient management of user permissions across multiple accounts.

## Example Usage

### Interactive Mode

Select the source user:

```bash
$ quix user permissions copy
? Select user:
> john.doe@myorg.com                    John Doe
  jane.doe@myorg.com                    Jane Doe
  user1@myorg.com                       User One
  user2@myorg.com                       User Two
  user3@myorg.com                       User Three
```

Then select the target user:

```bash
✓ User: john.doe@myorg.com

  Scope                                           | Role
 -------------------------------------------------|------
  Workspace:myorg-projecta-environmentx           | Admin

? Select user:
> jane.doe@myorg.com                    Jane Doe
  user1@myorg.com                       User One
  user2@myorg.com                       User Two
  user3@myorg.com                       User Three
```

### Non-Interactive Mode

```bash
$ quix user permissions copy <sourceUserId> --to <targetUserId1> --to <targetUserId2>

  Scope                                           | Role
 -------------------------------------------------|------
  Workspace:myorg-projecta-environmentx           | Admin

✓ <targetUserId1>
✓ <targetUserId2>
```

!!! tip
    To get the user ID, you can use [this](../list.md) command.
