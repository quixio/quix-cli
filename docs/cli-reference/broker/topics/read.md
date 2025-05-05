{% include-markdown './read.gen.md' %}

## How It Works

The `quix broker topics read` command allows you to read messages from topics in your data pipeline. It’s a valuable tool for debugging, inspecting live data, or validating the flow of information between different services. With various output formats and options, you can tailor the data reading to your specific needs.

### Topic Selection

If no topic is specified, you’ll be prompted to select one from the list of available topics:

```bash
$ quix broker topics read
? Select the topic you want to read from:
> user-activity
  system-logs
  transactions
```

This makes it easy to choose which topic you want to inspect without having to remember specific names.

### Reading Messages

Once a topic is selected, the command listens for new messages. If no data is currently available, you’ll see a waiting message:

```bash
$ quix broker topics read -l
✓ Topic: user-activity

⠀⡘ Waiting for messages. Inactive for 05 seconds
```

When messages arrive, they are displayed in real time:

```bash
{"UserID":123,"Action":"Login","Timestamp":"2024-08-31T12:30:00Z"}
```

This is the default output format, showing each message as it is received.

### Customizing Output Format

You can modify how the messages are displayed using the `-o` option, such as switching to JSON for a more structured view.

#### JSON Output

To view messages in JSON format, use the following command:

```bash
$ quix broker topics read user-activity --output json
```

Here’s what a message in JSON format might look like:

```json
{
  "UserID": 123,
  "Action": "Login",
  "Timestamp": "2024-08-31T12:30:00Z",
  "Location": "New York",
  "Device": "Mobile",
  "SessionDuration": 360
}
```

This format is especially helpful for inspecting the structure of complex messages or when working with structured data.

### Including Message Keys

To include the message key, which is often used for partitioning, use the `-k` option:

```bash
$ quix broker topics read user-activity --key
```

The output will include both the key and the message:

```bash
Key: user-123
{"UserID":123,"Action":"Login","Timestamp":"2024-08-31T12:30:00Z","Location":"New York"}
```

Keys can provide valuable context, especially when tracking messages by a unique identifier or partitioning scheme.

### Verbose Output for Detailed Metadata

For more in-depth information about each message, including the partition and offset details, use the `-v` (verbose) option:

```bash
$ quix broker topics read user-activity -v
```

Verbose output gives you metadata about each message, such as which partition it was read from and the message's offset:

```bash
Partition: 1
Offset: 1503
{"UserID": 456, "Action": "Purchase", "Item": "Laptop", "Amount": 1200.00, "Timestamp": "2024-08-31T12:35:00Z"}
```

This is particularly useful when troubleshooting or analyzing message distribution across partitions.

### Customizing the Broker Address

You can specify a different broker address with the `--broker-address` option if needed:

```bash
$ quix broker topics read user-activity --broker-address broker.example.com:9092
```

This flexibility is helpful when working in different environments or testing on remote brokers.


<div class="grid cards" markdown>

- __Looking to send data into your pipeline?__

    ---

    Discover how to use Quix CLI to write messages into your pipeline topics.

    [Quix CLI broker topics write :octicons-arrow-right-24:](./write.md)

</div>