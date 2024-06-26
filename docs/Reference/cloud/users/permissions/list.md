{% include-markdown './list.gen.md' %}

## How It Works

The `quix cloud user permissions list` command retrieves the permissions of all users in the organization. This command provides a comprehensive overview of the roles and scopes assigned to each user.

## Example Usage

```bash
$ quix cloud user permissions list

User Id                              | Email           | Scope              | Role
-------------------------------------|-----------------|--------------------|---------
d3d50bbb-ff1c-43db-85a9-1ee04f2b7cc7 | user1@myorg.com | Organisation:myorg | Admin
9ddf53bc-f67d-4fe3-8245-257e0d852b81 | user2@myorg.com | Organisation:myorg | Editor
39df2e5e-37b4-4341-ab17-d5b2807b94f0 | user3@myorg.com | Organisation:myorg | Manager
```
{% include-markdown '../../utils/note-output.md' %}
