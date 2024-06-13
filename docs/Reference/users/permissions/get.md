{% include-markdown './get.gen.md' %}
## How It Works

The `quix user permissions get` command retrieves the permissions of a specified user or all users in the organization. This command allows you to view the roles and scopes assigned to users.

## Example Usage

### Interactivity

```bash
 quix users permissions get
? Select user:
> john.doe@example.com                    John Doe
  jane.doe@example.com                    Jane Doe
  user1@example.com                       User One
  user2@example.com                       User Two
  user3@example.com                       User Thre

✓ User: john.doe@example.com

Scope               | Role
--------------------|-------
Organisation:myorg  | Admin
```

### Without Interactivity

```bash
 quix users permissions get <userId>

Scope               | Role
--------------------|-------
Organisation:myorg  | Admin
```

!!! tip

    In order to get the user id you can use [this](../list.md) command