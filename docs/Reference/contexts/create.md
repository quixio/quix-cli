{% include-markdown './create.gen.md' %}

## How It Works

The `quix contexts create` command allows you to add a new context to the Quix CLI. This context includes configurations such as the portal endpoint and the local debug broker address. If you do not provide the name or options, the command starts an interactive mode to guide you through the context creation process.

!!! warning
    Creating multiple contexts is intended for advanced users who need to store and access different sets of configurations. Use this feature only if you require distinct environments or settings.

## Example Usage

If you run the command without specifying the name or options, it will start an interactive mode:

```bash
$ quix ctx add
```

You will then be prompted to enter the context details:

```text
? Select a context name:
```

You will then be prompted to enter the portal API URL:

```text
✓ Context name: byoc
? Enter Portal API URL: (https://portal-api.platform.quix.io):
```

!!! note
    Changing the portal API URL is only necessary if you need to use a different portal API, such as for BYOC (Bring Your Own Cloud).


Once you enter a valid URL, you will be prompted for the local debug broker address:

```text
✓ Portal API URL: https://quix.example.com 
```

!!! warning "Handling Invalid URLs"

    If you enter an invalid URL, you will receive an error message:

    ```text
    ✗ https://quix.example.com is not a valid Portal API URL
    ```

```
? Enter local debug broker address: (localhost:19092):
```

After entering the local debug broker address, you will be asked if you want to use a local debug broker:

```text
✓ Local debug broker address: localhost:9092
? Use a local debug broker? [y/n] (y):
```

Confirm your choice to use a local debug broker:

```text
✓ Use a local debug broker?: ✓
```

By following these steps, you can easily create a new context in the Quix CLI, ensuring that all necessary configurations are set correctly.

!!! tip
    If you need to undo all your changes and reset your contexts to their default state, use the [`quix contexts reset`](reset.md) command.