{% include-markdown './import.gen.md' %}

## How It Works

The `quix local applications variables import` command updates the `app.yaml` file with variables from the `.env` file. This process ensures that the environment-specific configurations in the `.env` file are accurately reflected in the `app.yaml` file, which is used by your Quix applications.

- **Existing Variables**: If a variable from the `.env` file matches an existing variable in the `app.yaml` file, its value will be updated only if the `replaceAppVariables` flag is set to true.
- **New Variables**: If a variable from the `.env` file does not exist in the `app.yaml` file, it will be added. The type of the new variable is determined based on its name:
  - Variables containing "output" are classified as `OutputTopic`.
  - Variables containing "input" or "topic" are classified as `InputTopic`.
  - All other variables are classified as `FreeText`.

This ensures that your application configuration is kept up-to-date with the latest environment variables, making it easier to manage and deploy your applications consistently.

!!! warning
    It is generally better to manually edit the `app.yaml` file or use the CLI commands under [`quix local applications variables`](index.md) to ensure all configurations are correct and intentional. Regular use of this import command is not recommended.

## Example usage

### Importing Environment Variables from an `.env` File to `app.yaml`

The `quix local applications variables import` command allows you to import variables from your `.env` file into the `app.yaml` file. This updates the application configuration with the values from the `.env` file.

To use this command, you can run:

```bash
$ quix local apps vars import
```

!!! tip
    If your environment file has a different name than `.env`, use the `--env-file-name <env-file-name>` option to specify the correct file name.

This command will start an interactive process. If your current directory is not an application directory, you will be prompted to select the application for which you want to import the variables:

```text
? Select application:

> Event Detection Transformation        \Event Detection Transformation
  Starter Source                        \Starter Source
  ✗ Cancel
```

After selecting the application, the variables from the `.env` file will be imported into the `app.yaml` file. Existing variables in the `app.yaml` file will be updated with values from the `.env` file, while variables not defined in the `.env` file will remain untouched.
