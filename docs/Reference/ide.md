{% include-markdown './ide.gen.md' %}

## How It Works

The `quix ide` command sets up your development environment for a specified application by generating all necessary IDE-dependent files. This integration allows you to run and debug your application directly from your chosen IDE.

This command is particularly useful the first time you edit an application, as it automates the setup process. While you can run it multiple times, its primary benefits are realized during the initial setup.

!!! note
    You need to have [VS Code](https://code.visualstudio.com/) or [PyCharm](https://www.jetbrains.com/pycharm/) installed for this command to be effective.

### Automatic Environment Variable Export

Each time you run or debug your code using the generated run configuration, the command exports variables from the `app.yaml` file to a `.env` file or a devcontainer configuration. This ensures that the environment is correctly set up before you begin editing and debugging. 

Specifically, this command executes [`quix application variables export`](./applications/variables/export.md), which adds the application values along with the broker or SDK token to a `.env` file.

#### Debug Broker Configuration

=== "Pipeline Broker"

    To use a local debug broker, you can easily set one up by running `quix broker up`. This will start a local broker instance that listens on `localhost:19092`. This setting is enabled by default. If you need to change it, use `quix context broker local`.

=== "Quix Cloud Broker"

    To use the broker address from your Quix Cloud environment, use `quix context broker cloud`. Ensure you are logged into Quix Cloud by running `quix login` if you are not already logged in. If you have never selected an environment, run `quix use` to select it.

=== "Other Broker"

    To use a broker address other than `localhost:19092`, run `quix context broker set`.

    You can edit the *debug broker configuration* to suit your needs. The default configuration is designed to work out-of-the-box, but you can change it to point to any broker, including a Quix Cloud environment. 

In practice, this setup adds the following environment variable to your configuration:

```
Quix__Broker__Address={your_debug_broker_address}
```

If you set your local debug broker configuration to point to Quix Cloud, it will add:

```
Quix__Sdk__Token={your_token}
```

!!! tip
    Ensure you have a local broker configured or a Quix Cloud workspace set up. Without these, you won't have a Kafka instance to run your application against, and the command will not function properly.

### Generated Files

#### IDE Files

=== "VS Code"

    For VS Code, the `quix ide` command generates the necessary configurations to ensure smooth debugging and development:

    - **launch.json**: Configures the Python debugger to use the integrated terminal. It includes a pre-launch task `quix-variables-export` to set environment variables correctly before debugging.
    - **tasks.json**: Defines a custom task `quix-variables-export` that exports application variables from the `app.yaml` file to a `.env` file. This task is executed before running the debugger.

=== "PyCharm"

    For PyCharm, the `quix ide` command generates configurations to facilitate debugging:

    - **Quix.xml**: Configures a run configuration that includes a pre-launch task to export environment variables using the `quix-variables-export` external tool.
    - **External Tools.xml**: Defines an external tool to export application variables from the `app.yaml` file to a `.env` file. This tool runs before the main application execution starts.

These configurations ensure that your development environment is correctly set up, enabling you to run and debug your application seamlessly.

#### Dev Containers

Dev Containers provide an isolated and consistent development environment. By using the `--devcontainer` option, the command sets up the necessary configurations for Dev Containers. This is particularly useful for ensuring your development environment matches your production environment, helping to avoid the common "it works on my machine" issues by creating a reproducible setup.

The dev container configuration reuses your existing Dockerfile, installs Python and Docker extensions, and sets up the Quix CLI within the dev container.

The configuration includes:

- **Build**: Uses your existing Dockerfile to build the dev container.
- **Features**: Adds SSHD and Git features from Dev Containers, along with the Quix CLI.
- **Customizations**: Configures VS Code settings and extensions, ensuring Python and Docker tools are available.
- **Mounts**: Binds your local Quix configuration to the dev container, ensuring consistency.

This setup ensures that your development environment is as close to the production environment as possible, providing a smooth and consistent development experience.

For more information on Dev Containers, visit [Dev Containers](https://containers.dev/).

## Example usage

When you execute the local ide command without any options:

```bash
$ quix ide
```

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
✓ Using localhost:19092
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