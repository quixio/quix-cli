{% include-markdown './set.gen.md' %}
### How It Works

This command is used to set the permissions of a user in your organization. This command replaces the current permissions with the ones specified.

1. **User Identification**:
    - You can specify the user ID directly. If not provided, the command will enter interactive mode to select a user.

2. **Scope and Role Specification**:
    - You can define the scope and role of the permissions. If not specified, the command will enter interactive mode to select projects, environments, and roles.


### Example Usage

Below is an example showcasing how to use the `quix user permissions set` command:

* Select the user

```bash

$ quix user permissions set
? Select user:
> john.doe@example.com                    John Doe
  jane.doe@example.com                    Jane Doe
  user1@example.com                       User One
  user2@example.com                       User Two
  user3@example.com                       User Three

```