# projects patch

## Overview

Edit individual properties of a project

**Aliases:** patch

**Usage:**

```
quix projects patch <repository-id> [options]
```

**Arguments:**

- `<repository-id>` : The ID of the project

**Options:**

- `-o, --output <json|table>` : Output type of the retrieved data
- `--name <name>` : The name of the project
- `-pr, --pull-request-url-pattern <pull-request-url-pattern>` : Custom pattern for creating pull requests, where {{sourceBranch}} and {{destinationBranch}} will be replaced with the corresponding branch names.
Sample usage:
    https://example.com/pr/{{sourceBranch}}/{{destinationBranch}}
- `-no-pr, --no-pull-request-url-pattern` : Remove the custom pattern for creating pull requests

