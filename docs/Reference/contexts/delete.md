{% include-markdown './delete.gen.md' %}

## Example usage

When you execute the delete local variable command without any options:

```
$ quix local app vars delete
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