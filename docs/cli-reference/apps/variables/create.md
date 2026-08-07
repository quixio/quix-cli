{% include-markdown './create.gen.md' %}

## How It Works

The `quix apps vars create` command allows you to create new variables for your application through an interactive process. This command updates the `app.yaml` file with the new variables, ensuring your application configuration is current.

When you run the command, you are prompted to select an application (if not already in an application directory), choose the variable type (Input Topic, Output Topic, Free Text, Secret, Project Variable), and provide details such as the variable name, description, default value, and whether it is required. The new variable is then added to the `app.yaml` file.

A Project Variable references a key in the project variables store instead of carrying its own value — see [cloud variables](../../cloud/variables/index.md). Variable groups are not offered by the picker; they are declared directly in `app.yaml` or come from the cloud.

!!! tip
    You can create required variables without providing a value, but this may slow down the deployment process if you rely on the default application values. Providing values for required variables helps ensure a smoother and faster deployment.

## Example usage

When you execute the create local variable command without any options:

```
$ quix apps vars create
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
  Project Variable
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
