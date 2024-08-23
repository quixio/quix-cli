{% include-markdown './current.gen.md' %}

## How It Works

The `quix contexts current` command retrieves and displays information about the current context in use within the Quix CLI environment. The context includes details such as the name, portal URL, default environment, and the SDK broker configuration settings. This command is useful for understanding which settings and configurations are currently active.

## Example Usage

### Default Context

To display the current context, use the following command:

```bash
$ quix ctx current
```

If the default context is in use and no environment is selected, the output will be:

```
    Name    | Portal Url                          | Default environment  | SDK broker configuration
 -----------|-------------------------------------|----------------------|--------------------------
  → default | https://portal-api.platform.quix.io |                      | Local (localhost:19092)
```

### Environment Selected from Quix Cloud

If an environment is selected from Quix Cloud, the output will include the default environment:

```
    Name    | Portal Url                          | Default environment    | SDK broker configuration
 -----------|-------------------------------------|------------------------|--------------------------
  → default | https://portal-api.platform.quix.io | {your-default-env}     | Local (localhost:19092)
```

### Environment Selected from Quix Cloud with Environment Broker as SDK broker configuration

If the selected environment from Quix Cloud is also used as the SDK broker configuration, the output will reflect this configuration:

```
    Name    | Portal Url                          | Default environment    | SDK broker configuration
 -----------|-------------------------------------|------------------------|-----------------------------------
  → default | https://portal-api.platform.quix.io | quix-christest-env1    | Quix Cloud (quix-christest-env1)
```

These examples illustrate the various configurations you might encounter when using the `quix contexts current` command.