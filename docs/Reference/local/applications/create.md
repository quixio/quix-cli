{% include-markdown './create.gen.md' %}


## Example usage

When you execute the create local variable command without any options:

```
$ quix local apps vars create
```

The interactive command starts. If your current directory is not an application directory, you are prompted to select the application for which you want to edit variables:

```
? Select application:

  Event Detection Transformation        \Event Detection Transformation
> Starter Source                        \Starter Source
  ✗ Cancel
```

Once you select the application, a prompt for selecting the variable type appears:

```
✓ Found application 'Starter Source'
? Select variable type:

  Input Topic
  Output Topic
> Free Text
  Secret
```

Continue selecting until all the values are provided:

```
✓ Variable type: Free Text
✓ Variable name: my-new-variable
✓ Description: A new variable
✓ Default value: new-value
✓ Required variable: ✓
```

The variable is created successfully:

``` 
✓ Variable 'my-new-variable' created
```
