{% include-markdown './audit.gen.md' %}

### How It Works

1. **Email Filtering**:
    - You can specify an email address to fetch audit details for a particular user.

2. **Time Range Specification**:
    - The command allows you to define the start and end of the audit period using natural language or ISO 8601 timestamps.

3. **Pagination and Output Customization**:
    - You can control the number of records per page and the page number to start displaying from.
    - The command supports output customization, including JSON format and exclusion of parameters from the output.

4. **Key-Value Filtering**:
    - You can specify keys and values to filter the audit records.

### Example Usage

```bash
$ quix user audit --email user@quix.io "06/12/2024" "06/13/2024" -s 3 -p 1
Auditing data from 06/12/2024 00:00:00 to 06/13/2024 00:00:00
Page: 1

Email           | Controller | Action          | Parameters                   | UTC Time
----------------|------------|-----------------|------------------------------|----------------------------------
user@quix.io    | Workspace  | Sync            | workspaceId: quix-proja-envx | 2024-06-12T11:10:07.8200000+00:00
user@quix.io    | Repository | GenerateSshKeys |                              | 2024-06-12T11:21:21.6670000+00:00
user@quix.io    | Repository | Create          |                              | 2024-06-12T11:21:34.0350000+00:00

Press any key to continue to the next page (Press ESC to exit)
```

You can also filter the parameters, example how to filter by workspaceId:

```bash
quix user audit --email user@quix.io "06/12/2024" "06/13/2024" -s 3 -p 1 -k workspaceId -v quix-proja-envx
Auditing data from 06/12/2024 00:00:00 to 06/13/2024 00:00:00
Page: 1

Email           | Controller | Action           | Parameters                           | UTC Time
----------------|------------|------------------|--------------------------------------|----------------------------------
user@quix.io    | Workspace  | UpdateDescriptor | workspaceId: quix-proja-envx         | 2024-06-12T11:24:38.4490000+00:00
                |            |                  | commitMessage: Edited 'quix.yaml'    |
user@quix.io    | Workspace  | Sync             | workspaceId: quix-proja-envx         | 2024-06-12T11:24:56.9710000+00:00
user@quix.io    | Workspace  | Sync             | workspaceId: quix-proja-envx         | 2024-06-12T11:25:13.2770000+00:00

Press any key to continue to the next page (Press ESC to exit)
```
