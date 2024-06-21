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