{% include-markdown './set.gen.md' %}


## How It Works

The `quix sdk broker set` command allows you to specify the address for the SDK broker configuration for the current context. By default, this sets the broker to `localhost:19092`, which is the default pipeline broker address that can be started with the [`quix broker up`](../../pipeline/broker/up.md) command.

However, using this default broker address is not required. You can change it to suit your development setup. For instance, if you already have a Kafka broker running locally, you might set the address to `localhost:9092`. Alternatively, you can set it to any other Kafka broker address, such as `kafka.example.com:9092`.

This flexibility allows you to configure the SDK broker configuration to match the specific requirements of your development and testing environment.

## Example Usage

To set the address for the SDK broker configuration, use the following command:

```bash
$ quix sdk broker set
```

You will be prompted to enter the SDK broker configuration address:

```text
? Enter SDK broker configuration address: (localhost:19092):
```

If a cloud broker was previously selected, you will be asked if you want to enable the use of the SDK broker configuration:

```text
? Do you want to enable the use of this SDK broker configuration?: [y/n] (y):
```

!!! tip
    You can avoid this question by using the `--enable` option when setting the address.

    If you change your mind, you can switch to the cloud broker with [`quix sdk broker cloud`](cloud.md) or back to the local broker with [`quix sdk broker local`](local.md).

Ultimately, if the command is successful, you will see the following confirmation message:

```text
✓ SDK broker configuration: Local (localhost:19092)
```