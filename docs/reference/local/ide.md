{% include-markdown './ide.gen.md' %}

## Additional information

When you run this command, it generates all the necessary IDE-dependent files to integrate the run and debug capabilities of your chosen IDE. It also exports the variables from the `app.yaml` file to a `.env` file or a devcontainer configuration, ensuring that the environment is correctly set up before you begin editing and debugging. This seamless setup process allows you to focus on development without manual configuration.

This process ensures that all necessary conditions are met and launches your chosen IDE for debugging and editing the application.

!!! warning
    You need a local broker configured or a Quix Cloud workspace in order to run this command.

## Example usage

When you execute the local ide command without any options:

```bash
$ quix local ide
```

!!! tip
    If you prefer to run and debug your application using Dev Containers, use the `--devcontainer` option. This will set up the necessary configurations for Dev Containers, providing an isolated and consistent development environment. 
    For more information, visit [Dev Containers](https://containers.dev/).

The interactive command starts. If your current directory is not an application directory, you are prompted to select the application you want to edit and debug in your IDE:

```text
? Select application:

  Event Detection Transformation        \Event Detection Transformation
> Starter Source                        \Starter Source
  ✗ Cancel
```

After selecting the application, the command performs several checks to ensure that you can debug the application locally:

```text
✓ Found application 'Starter Source'
✓ Using localhost:9092
✓ VS Code is installed
✓ PyCharm is installed
```

If you have more than one supported IDE installed, you are asked to select which one to use:

```text
? Select IDE:

> VS Code
  PyCharm
  ✗ Cancel
```

Finally, your selected IDE starts:

```text
✓ VS Code started
```