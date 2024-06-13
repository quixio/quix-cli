{% include-markdown './clear.gen.md' %}

## How It Works

The `quix contexts environments clear` command removes the default environment setting from the current context. 

This effectively unsets any previously set default environment, reverting the context to having no specific default environment.

!!! tip
    You can set the default environment again using the [`quix use`](../../use.md) command.

## Example Usage

To unset the default environment of the current context, use the following command:

```bash
$ quix ctx env clear
```

If the command is successful, you will see the following message:

```text
✓ The default environment of the current context has been successfully unset
```

If there is an issue or the default environment is not set, an appropriate message will be displayed.