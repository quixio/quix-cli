# pipeline update

## Overview

Update 'quix.yaml' with the new local applications and update the variables of the existing deployments

**Aliases:** update

**Usage:**

```
quix pipeline update [options]
```

**Options:**

- `--directory <directory>` : Base directory (defaults to current directory)
- `--existing, --only-existing` : Update only existing deployments
- `--new, --only-new` : Add only the applications that are not currently deployed
- `--current, --only-current` : Update only the deployments of the current application folder. (Fails if not in an 'app.yaml' is not in the current directory)
- `--reset` : Removes all deployments from the 'quix.yaml' file. This operation is performed before any updates or additions to ensure a clean state

