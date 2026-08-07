{% include-markdown './update.gen.md' %}

## How It Works

When you run this command, it updates the `quix.yaml` file with new local applications and updates the variables of existing deployments. It scans your current directory and subdirectories to detect any new or updated applications. This ensures that your pipeline configuration in `quix.yaml` reflects the latest state of your local applications.

During the update process, the command checks for any new variables or changes in existing ones. If required variables are missing values, it generates warnings and prompts for manual intervention. This helps maintain an accurate and up-to-date pipeline configuration, preventing deployment issues due to misconfigured variables.

!!! info
    If there are warnings and manual intervention is needed:

    ```text
    ✗ Deployment demo-data-source can't be updated because variable 'my-new-variable' is required and it has no value
    ✓ 'quix.yaml' is updated
    ✗ Some deployments have warnings. Please, update 'quix.yaml' manually and try again
    ```

    If you encounter a warning about a required variable, such as `my-new-variable`, it indicates that the pipeline cannot be updated because a necessary value is missing. You must manually edit the `quix.yaml` file to provide the missing value.

## Choosing which applications to update

Run from an application directory, the command touches only that application; run from anywhere else, it processes every application it finds. Three options override that, and they are mutually exclusive — passing more than one is rejected with an error:

- `--existing` skips applications that have no deployment yet, so nothing new is added to `quix.yaml`. Use it to refresh the variables of the pipeline you already have without picking up work-in-progress applications.
- `--new` is the opposite: it only adds deployments for applications missing from `quix.yaml` and leaves every existing deployment untouched.
- `-a`, `--all` ignores the current directory and updates every application in the project — the usual way to reconcile the whole pipeline in one run without moving to the repository root first.

## Choosing what happens to the variables

- `--new-variables` adds variables that have appeared since the last update but leaves the values of variables already present in the deployment exactly as they are. Use it when you have tuned values directly in `quix.yaml` and do not want them overwritten by the `.env` values.
- `--keep-variables` retains deployment variables that no longer exist in the `.env` file. Without it, removing a variable from `.env` also removes it from the deployment.

## Resetting the pipeline

`--reset` empties the `deployments` and `topics` sections of `quix.yaml` before any application is processed, then rebuilds them from the applications found on disk. It is the way to rebuild a pipeline definition that has drifted beyond repair.

!!! warning
    `--reset` discards everything you configured by hand. Deployment names, replica counts, CPU and memory limits, versions and per-deployment variable overrides all revert to defaults, and recreated topics carry only their name — partition, retention and other topic settings are gone. Commit or back up `quix.yaml` before using it.

## Example usage

When you execute the update local pipeline command without any options:

```bash
$ quix pipeline update
```

The update process starts:

```text
Updating applications ...
✓ demo-data-source
✓ Event Detection Transformation
```

If everything is updated successfully:

```text
✓ 'quix.yaml' is updated
```

!!! info
    If there are no changes detected:

    ```text
    ! 'quix.yaml' has no changes
    ```

In this case, a new variable `my-new-variable` has been added, and it is required without a default value. The relevant section in the `quix.yaml` file might look like this:

```yaml
variables:
  - name: my-new-variable
    inputType: FreeText
    description: A new variable
    defaultValue:
    required: true
```

When the update command runs, it identifies that `my-new-variable` is required but has no value assigned. This triggers a warning because the pipeline cannot be updated with missing required variables.

To resolve this, you need to manually edit the `quix.yaml` file and provide a value for the `my-new-variable`:

```yaml
variables:
  - name: my-new-variable
    inputType: FreeText
    description: A new variable
    defaultValue: "your-value-here"
    required: true
```

After updating the `quix.yaml` file with the required value, you can run the update command again to complete the process without warnings. This ensures that all necessary variables are correctly configured for your deployments.