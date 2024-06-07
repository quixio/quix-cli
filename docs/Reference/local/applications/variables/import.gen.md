# local applications variables import

## Overview

Imports the .env file values to the app.yaml. The values from the .env file will replace the ones in the app.yaml file

**Aliases:** import, imp, import-from-dotenv

**Usage:**

```
quix local applications variables import [options]
```

**Options:**

- `--env-file-name <env-file-name>` : [default: .env]
- `--directory <directory>` : Base directory (defaults to current directory)
- `--from-app-variables` : If enabled the variables from the .env file will take preference over the ones in the app.yaml file [default: False]
- `--reset` : Removes all variables from the app.yaml file and adds them from the .env file [default: False]

