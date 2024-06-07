{% include-markdown './list.gen.md' %}

# Example usage

When you execute the list local applications variable command without any options:

```
$ quix local apps vars ls
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