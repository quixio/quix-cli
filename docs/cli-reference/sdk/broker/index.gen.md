# sdk broker

## Overview

Manage the SDK broker configuration that is injected to QuixStreams while developing locally

**Aliases:** `broker`

**Usage:**

```
quix sdk broker [command] [options]
```

**Commands:**

- [cloud](cloud.md): Set the SDK broker configuration to point to a 'Quix Cloud' broker
- [current](current.md): Get the SDK broker configuration
- [local](local.md): Configure the SDK to use a local broker (default: localhost:19092)
- [pipeline](pipeline.md): Reset the SDK broker configuration to use the local pipeline broker at 'localhost:19092', overriding any custom local broker settings
- [set](set.md): Set a local broker address for the SDK broker configuration
- [update](update.md): Update '.env' files of all the applications with the current SDK broker configuration

