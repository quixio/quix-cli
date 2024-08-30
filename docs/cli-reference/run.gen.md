# run

## Overview

Run your applications locally

**Aliases:** `run`

**Usage:**

```
quix run [<Command>...] [options]
```

**Arguments:**

- `<Command>` : Custom command to execute

**Options:**

- `--workspace-id <workspace-id>` : The environment to use if your SDK broker configuration is set to Quix Cloud
- `--directory <directory>` : Base directory (defaults to current directory)
- `-u, --update` : Updates the application's '.env' file with the variables from 'quix.yaml' before running
- `-i, --intercept` : Stop the deployment while this command is running and then start it again
- `-s, --stop` : Stop the deployment while this command is running and without starting it again
- `-d, --deployment <deployment>` : Specify the deployment to intercept or update its variable values
- `-v, --verbose, --verbosity` : Display the verbose output

