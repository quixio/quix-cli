{% include-markdown './write.gen.md' %}

## How It Works

The `quix broker topics write` command lets you send messages to a specific topic within your Quix data pipeline. Whether you're manually typing messages or sending them from a file, this command is a powerful way to simulate real-time data flows or test how your pipeline processes incoming messages.

### Key Features:

- **Direct Input**: Send messages directly from your terminal, line by line, to a specified topic. Perfect for quick tests or small data batches.
  
- **File Input**: You can specify a file where each line is treated as a message. Ideal for testing with larger datasets or pre-recorded data.

- **Message Partitioning**: The `--key` option lets you partition messages by key, ensuring messages with the same key are routed consistently. This is useful when dealing with session-based or user-specific data.

- **Batching and Rate Limiting**: With the `--batch-size` option, you can send messages in batches, while the `--batch-delay` option introduces delays between batches, mimicking controlled data flows or rate-limiting scenarios.

This flexibility makes `quix broker topics write` an essential tool for testing and simulating data in your pipeline, from simple messages to complex batch processing.

---

## Example Usage

### Writing Messages from Standard Input

To send individual messages directly from the terminal:

```bash
quix broker topics write user-activity
```

After executing the command, you can type messages like:

```bash
> {"UserID": 123, "Action": "Login", "Timestamp": "2024-08-31T12:30:00Z"}
```

Each line is sent as a separate message to the `user-activity` topic.

---

### Sending Messages from a File

If you want to send messages from a file, use the `--file` option:

```bash
quix broker topics write user-activity --file activity_log.json
```

This sends each line of `activity_log.json` as an individual message to the topic.

!!! note
    This method works well when testing with large datasets, letting you replay historical logs or simulate longer activity traces.

---

### Partitioning Messages by Key

To route messages based on a key (e.g., `UserID`), use the `--key` option:

```bash
quix broker topics write user-activity --key user-123
```

This ensures all messages with the key `user-123` are routed to the same partition, maintaining message order and consistency.

---

### Simulating Batches of Data

To send messages in batches, you can control the batch size and introduce delays between batches for more realistic testing:

```bash
quix broker topics write user-activity --file activity_log.json --batch-size 10 --batch-delay 500
```

This sends 10 messages per batch, with a 500-millisecond delay between batches, simulating a paced data flow.

!!! tip
    Adjusting the batch size and delay can help you test your pipeline under different loads and message rates, ideal for performance tuning or stress testing.

---

### Customizing the Broker Address

If you're connecting to a broker hosted on a different address or port, specify it with the `--broker-address` option:

```bash
quix broker topics write user-activity --broker-address custom-broker:9092
```

This allows you to write to brokers running in different environments without modifying your default settings.

<div class="grid cards" markdown>

- __Need to verify the data flowing through your pipeline?__

    ---

    Learn how to use Quix CLI to read and inspect messages from your pipeline topics.

    [Quix CLI broker topics read :octicons-arrow-right-24:](./read.md)

</div>