{% include-markdown './clear.gen.md' %}

## How It Works

The `quix contexts environments clear` command removes the default environment setting from the current context.

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