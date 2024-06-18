{% include-markdown './list.gen.md' %}

## How It Works

The `quix apps vars list` command lists all variables for a selected application. This command provides an overview of the current configuration variables in the `app.yaml` file.

When you run the command, you are prompted to select an application (if not already in an application directory). After selecting the application, the command retrieves and displays a table of all variables, including their names, default values, descriptions, types (Input Topic, Output Topic, Free Text, Secret), and whether they are required.

!!! tip
    Regularly listing your application variables helps you keep track of your configuration and ensure everything is correctly set up.

# Example usage

When you execute the list local applications variable command without any options:

```
$ quix apps vars ls
```

The interactive command starts. If your current directory is not an application directory, you are prompted to select the application for which you want to list the variables:

```
? Select application:

> Event Detection Transformation        \Event Detection Transformation
  Starter Source                        \Starter Source
  ✗ Cancel
```

A table containing all your local application variables is printed:

```
✓ Found application 'Event Detection Transformation'

  Name   | Default value | Description                                      | Type        | Is required?
 --------|---------------|--------------------------------------------------|-------------|--------------
  input  | f1-data       | This is the input topic for f1 data              | InputTopic  | ✓
  output | hard-braking  | This is the output topic for hard braking events | OutputTopic | ✓
```