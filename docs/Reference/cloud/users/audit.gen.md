# cloud users audit

## Overview

Get the auditing details of the users of your organization

**Aliases:** audit

**Usage:**

```
quix cloud users audit [<start> [<end>]] [options]
```

**Arguments:**

- `<start>` : Start of audit period. Default to the beginning of the current day if not specified.
Supports natural language (e.g., 'yesterday', 'last monday', 'may 27th', '2024-04-24') and ISO 8601 timestamps ('YYYY-MM-DD HH:MM:SS.sss'). [default: yesterday]
- `<end>` : End of audit period. Default to the current time if not specified.
Supports natural language and precise timestamps. [default: today]

**Options:**

- `-o, --output <json|table>` : Output type of the retrieved data
- `--email <email>` : Email address of the user to fetch audit details for.
- `-s, --page-size <page-size>` : Specifies the number of records to display per page. [default: 50]
- `-p, --page <page>` : Determines the page number from which to start displaying records. [default: 1]
- `-k, --key <key>` : Specifies the keys for the parameters. The number of keys must match the number of values.
- `-v, --value <value>` : Specifies the values for the parameters. The number of values must match the number of keys.
- `--exclude-parameters` : Excludes the parameters from being rendering in the table

