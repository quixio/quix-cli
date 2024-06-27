{% include-markdown './local.gen.md' %}

    
## How It Works

The `quix contexts broker local` command configures the SDK broker configuration to use a broker accessible from your local machine. By default, this sets the broker to the pipeline broker running on `localhost:19092`.

## Example Usage

To set the SDK broker configuration to a locally accessible broker, use the following command:

```bash
$ quix sdk broker local
```

If successful, you will see the following confirmation message:

```text
✓ SDK broker configuration: Local (localhost:19092)
```

!!! tip
    You can change the SDK broker configuration address using the [`quix sdk broker set`](set.md) command.