{% include-markdown './list.gen.md' %}

## How it works

The `quix user permissions list` command retrieves the permissions of all users in the organization. This command provides a comprehensive overview of the roles and scopes assigned to each user.

## Example Usage

Table output

```
$ quix user permissions list

  User Id                              │ Email                                 │ Scope                                         │ Role
 ──────────────────────────────────────┼───────────────────────────────────────┼───────────────────────────────────────────────┼─────────
  d3d50bbb-ff1c-43db-85a9-1ee04f2b7cc7 │ user1@myorg.com                       │ Organisation:myorg                            │ Admin
  9ddf53bc-f67d-4fe3-8245-257e0d852b81 │ user2@myorg.com                       │ Organisation:myorg                            │ Editor
  39df2e5e-37b4-4341-ab17-d5b2807b94f0 │ user3@myorg.com                       │ Organisation:myorg                            │ Manager

```

Json output

```
$ quix user permissions list  --output Json

[
  {
    "userId": "d3d50bbb-ff1c-43db-85a9-1ee04f2b7cc7",
    "email": "user1@myorg.com",
    "firstName": "User",
    "lastName": "1",
    "permissions": [
      {
        "role": "Admin",
        "scope": "Organisation:myorg"
      }
    ]
  },
  {
    "userId": "9ddf53bc-f67d-4fe3-8245-257e0d852b81",
    "email": "user2@myorg.com",
    "firstName": "User",
    "lastName": "2",
    "permissions": [
      {
        "role": "Editor",
        "scope": "Organisation:myorg"
      }
    ]
  },
  {
    "userId": "39df2e5e-37b4-4341-ab17-d5b2807b94f0",
    "email": "user3@myorg.com",
    "firstName": "User",
    "lastName": "3",
    "permissions": [
      {
        "role": "Manager",
        "scope": "Organisation:myorg"
      }
    ]
  }
]

```