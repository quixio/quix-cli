{% include-markdown './edit.gen.md' %}

## How It Works

The `quix local apps vars edit` command allows you to edit existing variables for your application through an interactive process. This command updates the `app.yaml` file with the modified variable values, ensuring your application configuration remains current.

When you run the command, you are prompted to select an application (if not already in an application directory), choose the variable you want to edit, and modify its details such as the variable type (Input Topic, Output Topic, Free Text, Secret), description, default value, and whether it is required. The updated variable is then saved to the `app.yaml` file.

!!! tip
    Editing variables promptly ensures that your application configuration is always accurate and up-to-date, preventing potential issues during deployment.

## Example usage

When you execute the edit local applications variable command without any options:


```
$ quix local apps vars edit
```

The interactive command starts. If your current directory is not an application directory, you are prompted to select the application for which you want to edit the variables:

```
? Select application:

> Event Detection Transformation        \Event Detection Transformation
  Starter Source                        \Starter Source
  ✗ Cancel
```

After selecting the application, you will be prompted to choose the variable you want to edit.

```
✓ Found application 'Event Detection Transformation'
? Variable name:

  input
> output
```

Once you select the application, a prompt for selecting the variable type appears:

```
? Select variable type. (Output Topic):

> Output Topic
  Input Topic
  Free Text
  Secret
```

Continue selecting until all the values are provided:

```
✓ Variable type: Output Topic
✓ Description: This is the input topic for f1 data
✓ Default value: f1-data
✓ Required variable: ✓
```

```
✓ Variable 'input' edited
```