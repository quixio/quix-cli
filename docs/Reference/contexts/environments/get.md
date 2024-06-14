{% include-markdown './get.gen.md' %}

## How It Works

The `quix contexts environments get` command retrieves and displays the default environment for the current context. If no default environment is set, the command will indicate this.

## Example Usage

To get the default environment of the current context, use the following command:

```bash
$ quix ctx envs get
```

If a default environment is set for the current context, you will see the following message:

```text
The default environment for the current context is: your-environment-id
```

If no default environment is set for the current context, you will see the following message:

```text
✗ No default environment is set for the current context
```

!!! tip
    You can set the default environment using the [`quix use`](../../use.md) command.
