{% include-markdown './delete.gen.md' %}

## How It Works

The `quix contexts delete` command removes a specified context from the Quix CLI. This action deletes the context configuration, making it no longer accessible within the CLI.

## Example Usage

To remove a context, use the following command:

```bash
$ quix ctx remove your-context
```

If the context is successfully removed, you will see the confirmation message:

```text
✓ Removed context your-context
```

!!! warning
    If the context does not exist, you will receive an error message:

    ```text
    Context doesn't exist
    ```