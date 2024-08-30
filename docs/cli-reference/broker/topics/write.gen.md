# broker topics write

## Overview

Write messages from the standard input to your pipeline topics

**Aliases:** `write`

**Usage:**

```
quix broker topics write [<topic>] [options]
```

**Arguments:**

- `<topic>` : The topic to send data to

**Options:**

- `--directory <directory>` : If specified, it will use that directory instead of the current one
- `-k, --key <key>` : Specify a key for each message, allowing messages to be partitioned and ordered by key
- `-f, --file <file>` : Read messages from the specified file, sending each line as an individual message
- `-s, --batch-size <batch-size>` : Number of messages to include in each batch sent to the topic [default: 1]
- `-d, --batch-delay <batch-delay>` : Delay in milliseconds between sending each batch, useful for rate limiting [default: 0]
- `-b, --broker-address <broker-address>` : The broker address to connect to [default: localhost:19092]

