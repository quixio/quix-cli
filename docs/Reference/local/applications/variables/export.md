{% include-markdown './export.gen.md' %}

## How It Works

The `quix local applications variables export` command exports variables from your `app.yaml` file to a `.env` file. This command simplifies the management of environment variables by maintaining them in a standardized format. An `.env` file is a simple text file used to set environment variables, which can be easily loaded into your application's runtime environment.

When you run the command, you are prompted to select an application (if not already in an application directory). The command then exports the variables from the `app.yaml` file to an `.env` file in the specified directory. By default, the `.env` file will be created in the current directory with the name `.env`.

Existing environment variables in the `.env` file will remain untouched unless they are also defined in the `app.yaml` file. If the `--reset` option is used, all existing variables in the `.env` file will be removed before exporting the new values from the `app.yaml` file.

!!! tip
    A `.env` file is a simple text file that contains key-value pairs of environment variables. For more information on `.env` files and best practices, visit [dotenv.org](https://www.dotenv.org/docs/security/env).

### Key Environment Variables

#### Quix__Broker__Address

When using a local debug broker, the `Quix__Broker__Address` environment variable is set to point to the address of the local broker. This allows your application to connect to the local broker instance for testing and debugging purposes.

```
Quix__Broker__Address={your_debug_broker_address}
```

#### Quix__Sdk__Token

When using a Quix Cloud broker, the `Quix__Sdk__Token` environment variable is set with your Quix Cloud token. This allows your application to authenticate and connect to the Quix Cloud environment.

```
Quix__Sdk__Token={your_token}
```

These environment variables are crucial for ensuring that your application can communicate with the appropriate broker during development and testing. The export process handles these configurations automatically, providing a seamless development experience.

### Example Usage

#### Exporting Local Application Variables to an `.env` File

To export variables from your `app.yaml` file to an `.env` file, use the following command:

```bash
$ quix local applications variables export
```

!!! tip
    To clear the existing `.env` file entirely and repopulate it with values from `app.yaml`, use the `--reset` option.

This command starts an interactive process. If your current directory is not an application directory, you will be prompted to select the application:

```text
? Select application:

> Event Detection Transformation        \Event Detection Transformation
  Starter Source                        \Starter Source
  ✗ Cancel
```

After selecting the application, the variables from the `app.yaml` file will be exported to a `.env` file in the specified directory. By default, the `.env` file will be created in the current directory with the default name `.env`.

!!! tip
    If your environment file has a different name than `.env`, use the `--env-file-name <env-file-name>` option to specify the correct file name.
