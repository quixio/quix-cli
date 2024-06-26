# Developing QuixStreams Applications Locally with Quix CLI

Debugging an application locally using `quix ide` has some nuances that need to be properly explained. This tutorial will guide you through the process of debugging an application locally using a local broker, Quix Cloud broker, and DevContainers. We'll cover prerequisites, best practices, and common issues.

## Prerequisites

Before starting, ensure you have the following installed:

- [VS Code](https://code.visualstudio.com/)
- [Python](https://www.python.org/)

## Debugging with Quix CLI

### Step 1: Setting Up the Broker

Depending on your setup, you can choose to use your local pipeline broker, another local broker, or the Quix Cloud broker. Here are the steps to configure each:

=== "Local Pipeline Broker"

    To use your local pipeline broker, start your local pipeline broker using:

    ```bash
    quix pipeline broker up
    ```
    This will spin up a local broker running on `localhost:19092`.

    !!! tip
        If you had previously set your broker to Quix Cloud, you will need to switch it back to the local broker. You can do this by running:

        ```bash
        quix sdk broker local
        ```

    For more details on the `local` command, refer to the [local broker documentation](./Reference/sdk/broker/local.md).

=== "Other Local Broker"

    If you want to use a different local broker, you can set the broker address manually. This is useful if you have another Kafka broker running on your local machine or elsewhere. To set a custom local broker address, run:

    ```bash
    quix sdk broker set
    ```

    If you don't want to run the interactive version, you can specify the parameters and enable it by running:
    
    If your local Kafka broker is running on `localhost:9092`, you would use:

    ```bash
    quix sdk broker set localhost:9092 --enable
    ```

    !!! tip
        If you had previously set your broker to Quix Cloud, you will need to switch it back to the local broker. You can do this by running:

        ```bash
        quix sdk broker local
        ```

    For more details on the `set` command, refer to the [set broker documentation](./Reference/sdk/broker/set.md).

=== "Quix Cloud Broker"

    To use the Quix Cloud broker, set the local debug broker to Quix Cloud. This will configure your environment to use the Quix Cloud infrastructure for debugging:

    ```bash
    quix sdk broker cloud
    ```

    This configuration is ideal if you want to test your application in an environment that closely resembles production.

    For more details on the `cloud` command, refer to the [cloud broker documentation](./Reference/sdk/broker/cloud.md).

---

For a comprehensive overview of all SDK broker commands, refer to the [SDK broker documentation](./Reference/sdk/broker/index.md).

### Step 2: Understanding Application Variables

The `quix applications variables export` command exports the application variables defined in your `app.yaml` file to a `.env` file. This ensures that your application has access to the necessary environment variables when it runs.

Here’s how it works:

1. **Define Variables in `app.yaml`**:
   
    Your `app.yaml` file should include the necessary variables for your application. For example:

    ```yaml title="app.yaml"
    name: starter-source
    language: Python
    variables:
      - name: output
        inputType: OutputTopic
        description: Name of the output topic to write into
        defaultValue: csv-data
        required: true
    dockerfile: dockerfile
    runEntryPoint: main.py
    defaultFile: main.py
    ```

2. **Generate the `.env` File**:
   
    Running the `quix applications variables export` command will generate a `.env` file with the variables defined in `app.yaml`:

    ```bash
    quix applications variables export
    ```

    This will create a `.env` file with the following content:

    ```env title=".env"
    output=csv-data
    ```

3. **Additional Configuration**:
   
    Depending on your setup, additional variables may be included in the `.env` file:

    === "Local Debug Broker"

        If using a local debug broker, the following variable will be included:

        ```env title=".env"
        Quix__Broker__Address={your_debug_broker_address}
        ```

    === "Quix Cloud"

        If using the Quix Cloud broker, the following variable will be included:

        ```env title=".env"
        Quix__Sdk__Token={your_token}
        ```

### Step 3: Understanding `quix ide`

Using `quix ide` to set up your IDE ensures seamless development and debugging. This command automatically creates the necessary configuration files for VS Code or equivalent configurations for PyCharm, ensuring your environment variables are always up to date. Here's why you should use it:

1. **Automated Configuration**:

    The `quix ide` command generates the essential configuration files that ensure your environment variables are updated before running your application. This step is crucial for maintaining consistency between your `app.yaml` configurations and the runtime environment. By automating this setup, you save time and reduce the risk of manual errors.

2. **Ensuring Up-to-Date Environment Variables**:

    The command ensures that your environment variables are updated before running your application by executing the `quix applications variables export` command. This keeps the `.env` file in sync with the latest variables from your `app.yaml`, preventing issues related to outdated or missing environment variables. This automation provides a smoother development and debugging experience, as you can be confident that your application is always running with the correct settings.

    !!! tip
        Keeping your `.env` file updated with the latest variables from `app.yaml` is essential to avoid any configuration-related issues during development and debugging. The `quix ide` command automates this process, ensuring that every time you start debugging, the necessary variables are correctly set.

3. **Seamless Integration with Your IDE**:

    By setting up your IDE with the `quix ide` command, you ensure a seamless integration that streamlines your workflow. Whether you are using VS Code or PyCharm, the configurations generated by this command are tailored to provide the best development experience.

4. **Setting Up DevContainers**:

    If you prefer using DevContainers for an isolated development environment, you can set them up with the `--devcontainer` option:

    ```bash
    quix ide --devcontainer
    ```

    **Dependencies**:
    - Docker must be installed and running on your machine. DevContainers leverage Docker to create isolated development environments.

    The `devcontainer.json` file is automatically generated. It reuses your existing Dockerfile, installs Python and Docker extensions, and sets up the Quix CLI within the dev container. This setup ensures that your development environment matches your production environment, reducing the "it works on my machine" issues.

    By using DevContainers, you ensure that your development environment is consistent, isolated, and reproducible.

For more details on how to use `quix ide`, refer to the [IDE command documentation](./Reference/ide.md).


### Step 4: Debugging

Open the dev container in VS Code and use F5 or Ctrl+F5 to start debugging. Avoid using the play button in VS Code as it might not run the preLaunchTask.

## Common Issues

### Using the Play Button in VS Code

Using the play button instead of F5/Ctrl+F5 may skip the preLaunchTask, resulting in missing environment variables. Always use F5 or Ctrl+F5 to ensure the preLaunchTask runs.

### Updating Your Pipeline

When you create new variables or make changes to your application, update your pipeline:

```bash
quix local pipeline update
```

## Next Steps

Continue your journey by exploring the [Quix Cloud Quickstart](quix-cloud-quickstart.md) tutorial. 

For more advanced topics, refer to the [Quix CLI Quickstart](quix-cli-quickstart.md) tutorial.

---

By following this tutorial, you will be able to effectively debug your applications locally using different brokers and environments. Happy debugging!


## Best Practices

### Creating a Virtual Python Environment

Creating a virtual environment helps isolate dependencies and avoid conflicts:

```bash
python -m venv venv
```

Activate the virtual environment:

=== "Windows"

    ```powershell
    .\venv\Scripts\activate
    ```

=== "Linux"

    ```bash
    source venv/bin/activate
    ```

=== "macOS"

    ```bash
    source venv/bin/activate
    ```

Install dependencies from `requirements.txt`:

```bash
pip install -r requirements.txt
```
