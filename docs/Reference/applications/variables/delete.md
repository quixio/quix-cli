{% include-markdown './delete.gen.md' %}

## How It Works

The `quix apps vars delete` command allows you to remove variables from your application through an interactive process. This command updates the `app.yaml` file by removing the specified variable, ensuring your application configuration is current.

When you run the command, you are prompted to select an application (if not already in an application directory), choose the variable you want to delete, and confirm the deletion. The variable is then removed from the `app.yaml` file.

!!! warning
    Deleting variables can affect your application's behavior. Ensure that the variable you are deleting is no longer needed before confirming the deletion.

## Example Usage

When you execute the delete local variable command without any options:

```
$ quix app vars delete
```

The interactive command starts. If your current directory is not an application directory, you are prompted to select the application for which you want to remove variables:

```
? Select application:

> Event Detection Transformation        \Event Detection Transformation
  Starter Source                        \Starter Source
  ✗ Cancel
```

After selecting the application, you will be prompted to choose the variable you want to delete.

```
✓ Found application 'Event Detection Transformation'
? Variable name:

  input
> output
```

The variable is finally deleted.

```
✓ 'output' was deleted
```