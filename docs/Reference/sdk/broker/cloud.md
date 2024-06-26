{% include-markdown './cloud.gen.md' %}

## How It Works

The `quix sdk broker cloud` command configures the SDK broker configuration to use the one in your Quix Cloud environment. This ensures that your local development setup uses the same broker as your Quix Cloud environment, which can be helpful for consistent testing and debugging.

## Example Usage

To set the SDK broker configuration to the one in your Quix Cloud environment, use the following command:

```bash
$ quix sdk broker cloud
```

If the default environment ID is set, you will see the following message:

```text
✓ SDK broker configuration: Quix Cloud (your-env-id)
```

### No Default Environment ID Set

If no default environment ID is set, you will see the following message:

```text
✓ SDK broker configuration: Quix Cloud (! Not set)
```

!!! tip
    You can set the default environment using the [`quix use`](../../use.md) command.