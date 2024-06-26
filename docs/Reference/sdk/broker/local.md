{% include-markdown './local.gen.md' %}

    
## How It Works

The `quix contexts broker local` command configures the local debug broker to use a broker accessible from your local machine. By default, this sets the broker to the pipeline broker running on `localhost:19092`.

## Example Usage

To set the local debug broker to a locally accessible broker, use the following command:

```bash
$ quix sdk broker local
```

If successful, you will see the following confirmation message:

```text
✓ Local debug broker: Local (localhost:19092)
```

!!! tip
    You can change the local debug broker address using the [`quix sdk broker set`](set.md) command.