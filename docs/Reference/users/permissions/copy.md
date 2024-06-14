{% include-markdown './copy.gen.md' %}

## How It Works

This command is used to copy the permissions from one user to other users in your organization. It allows you to easily replicate permissions settings across multiple users.

## Example Usage

### Interactivity

Select the source user

```bash
$ quix user permissions copy
? Select user:
> john.doe@myorg.com                    John Doe
  jane.doe@myorg.com                    Jane Doe
  user1@myorg.com                       User One
  user2@myorg.com                       User Two
  user3@myorg.com                       User Three
```

Then you select the target user

```bash

✓ User: john.doe@myorg.com

  Scope                                           | Role
 -------------------------------------------------|------
  Workspace:myorg-projecta-environmentx           | Admin

? Select user:
> jane.doe@myorg.com                    John Doe
  user1@myorg.com                       User One
  user2@myorg.com                       User Two
  user3@myorg.com                       User Three

```

### No interactivity

```bash

$ quix user permissions copy <sourceUserId> --to <targetUserId1> --to <targetUserId2>

  Scope                                           | Role
 -------------------------------------------------|------
  Workspace:myorg-projecta-environmentx           | Admin

✓ <targetUserId1>
✓ <targetUserId2>
```

!!! tip

    In order to get the user id you can use [this](../list.md) command