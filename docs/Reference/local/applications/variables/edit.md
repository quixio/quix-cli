{% include-markdown './edit.gen.md' %}

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