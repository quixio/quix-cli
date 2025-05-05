# apps variables import

## Overview

Imports the .env file values to the app.yaml. The values from the .env file will replace the ones in the app.yaml file

**Aliases:** `import`, `imp`, `import-from-dotenv`

**Usage:**

```
quix apps variables import [options]
```

**Options:**

- `--env-file-name <env-file-name>`: Set the name of the environment file [default: .env]
- `--directory <directory>`: Base directory (defaults to current directory)
- `--reset`: Removes all variables from the app.yaml file and adds them from the .env file [default: False]

