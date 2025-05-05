{% include-markdown './list.gen.md' %}

## How It Works

The `quix contexts list` command retrieves and displays all the contexts configured in the Quix CLI. This command is useful for reviewing the available contexts and their configurations, including the portal URL, default environment, and SDK broker configuration settings. The current active context is indicated with an arrow `→`.

## Example Usage

To list all contexts, use the following command:

```bash
$ quix ctx ls
```

The output will display the contexts in a table format:

```text
    Name         | Portal Url                          | Default environment | SDK broker configuration
-----------------|-------------------------------------|---------------------|----------------------------
  → default      | https://portal-api.platform.quix.io | org-proj-env        | Quix Cloud (org-proj-env)
    more-context | https://portal-api.platform.quix.io |                     | Local (localhost:9092)
    my-context   | https://portal-api.platform.quix.io |                     | Local (localhost:19092)
```

The arrow  `→` indicates the current active context, showing which configuration is currently in use. This helps you quickly identify and switch between different contexts as needed.