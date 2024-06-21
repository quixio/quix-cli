# applications create

## Overview

Creates a new application locally based on a code sample of the library

**Aliases:** `create`, `add`

**Usage:**

```
quix applications create [<library-item>] [options]
```

**Arguments:**

- `<library-item>` : If omitted, an interactive list is displayed. Use this argument to manually specify the library item you want to use. Use `quix applications library list` to see all available items.

**Options:**

- `-n, --name <name>` : Application name
- `-p, --application-path <application-path>` : Application path
- `-d, --directory <directory>` : Base directory (defaults to current directory)
- `-l, --language <language>` : Application language [default: python]
- `--no-git` : Skip the git root directory check

