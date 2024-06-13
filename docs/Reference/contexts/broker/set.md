{% include-markdown './set.gen.md' %}

## How It Works

The `quix contexts broker set` command allows you to specify the address for the local debug broker for the current context. By default, this sets the broker to `localhost:19092`, which is the default pipeline broker address that can be started with the [`quix local broker up`](../../local/broker/up.md) command.

However, using this default broker address is not required. You can change it to suit your development setup. For instance, if you already have a Kafka broker running locally, you might set the address to `localhost:9092`. Alternatively, you can set it to any other Kafka broker address, such as `kafka.example.com:9092`.

This flexibility allows you to configure the local debug broker to match the specific requirements of your development and testing environment.

## Example Usage

To set the address for the local debug broker, use the following command:

```bash
$ quix ctx broker set
```

You will be prompted to enter the local debug broker address:

```text
? Enter local debug broker address: (localhost:19092):
```

If a cloud broker was previously selected, you will be asked if you want to enable the use of the local debug broker:

```text
? Do you want to enable the use of this local debug broker?: [y/n] (y):
```

!!! tip
    You can avoid this question by using the `--enable` option when setting the address.

    If you change your mind, you can switch to the cloud broker with [`quix contexts broker cloud`](cloud.md) or back to the local broker with [`quix contexts broker local`](local.md).

Ultimately, if the command is successful, you will see the following confirmation message:

```text
✓ Local debug broker: Local (localhost:19092)
```