{% include-markdown './export.gen.md' %}
## How It Works

The `quix local applications variables export` command exports variables from your `app.yaml` file to a `.env` file. This command makes it easier to manage environment variables for your application by keeping them in a standardized format. A `.env` file is a simple text file used to set environment variables, which can be easily loaded into your application's runtime environment.

When you run the command, you are prompted to select an application (if not already in an application directory). The command then exports the variables from the `app.yaml` file to a `.env` file in the specified directory. By default, the `.env` file will be created in the current directory with the name `.env`.

Existing environment variables in the `.env` file will remain untouched unless they are also defined in the `app.yaml` file.

!!! tip
    A `.env` file is a simple text file that contains key-value pairs of environment variables. For more information on `.env` files and best practices, visit [dotenv.org](https://www.dotenv.org/docs/security/env).

## Example usage

### Exporting Local Application Variables to an `.env` File

The `quix local applications variables export` command allows you to export variables from your `app.yaml` file to a `.env` file. This makes it easier to manage environment variables for your application.

To use this command, you can run:

```bash
$ quix local apps vars export
```

!!! tip
    If your environment file has a different name than `.env`, use the `--env-file-name <env-file-name>` option to specify the correct file name.

This command will start an interactive process. If your current directory is not an application directory, you will be prompted to select the application for which you want to export the variables:

```text
? Select application:

> Event Detection Transformation        \Event Detection Transformation
  Starter Source                        \Starter Source
  ✗ Cancel
```

After selecting the application, the variables from the `app.yaml` file will be exported to a `.env` file in the specified directory. By default, the `.env` file will be created in the current directory with the default name `.env`. Existing environment variables in the `.env` file will remain untouched unless they are also defined in the `app.yaml` file.

!!! tip
    To clear the existing `.env` file entirely and repopulate it with values from `app.yaml`, use the `--reset` option.