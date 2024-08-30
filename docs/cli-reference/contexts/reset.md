{% include-markdown './reset.gen.md' %}

## How It Works

The `quix contexts reset` command removes all your local contexts, leaving only the default context. This command also logs you out of Quix Cloud. It is a powerful command that should be used with caution, as it will erase all context configurations except for the default settings.

When you run this command, it effectively reverts your Quix CLI environment to its initial state, removing any custom configurations or selected environments.

## Example Usage

!!! warning
    The `quix contexts reset` command will remove all custom contexts and log you out. Use this command with caution, as it cannot be undone.
    
To reset your context to defaults, use the following command:

```bash
$ quix ctx reset
```

After executing the command, you will see a confirmation message:

```text
Context was reset
```
