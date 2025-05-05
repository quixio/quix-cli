# broker topics read

## Overview

Read the messages from your pipeline topics

**Aliases:** `read`, `tail`

**Usage:**

```
quix broker topics read [<topic>] [options]
```

**Arguments:**

- `<topic>`: The topic to read data from

**Options:**

- `-o, --output <json|table>`: Output type of the retrieved data
- `--directory <directory>`: If specified, it will use that directory instead of the current one
- `-k, --key`: Include the key in the response
- `-O, --offset <earliest|latest>`: The offset type
- `-l, --latest`: Selects the 'latest' offset type
- `-e, --earliest`: Selects the 'earliest' offset type
- `-b, --broker-address <broker-address>`: The broker address to connect to [default: localhost:19092]
- `-g, --group <group>`: The consumer group ID

