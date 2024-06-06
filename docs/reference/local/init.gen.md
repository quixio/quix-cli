# local init

## Overview

Generate the initial Quix files based on the existing repository

**Aliases:** init

**Usage:**

```
quix local init [<directory>] [options]
```

**Arguments:**

- `<directory>` : Base directory (defaults to current directory)

**Options:**

- `-dev, --devcontainers` : If specified, generates devcontainers files
- `--vscode` : If specified, generates VS Code launch files
- `--pycharm` : If specified, generates PyCharm launch files
- `--ide <ide>` : Selects the IDE explicitly. (vscode, pycharm)
- `-d, --generate-dockerfiles` : If specified, generates dockerfiles based on the applications [default: True]

