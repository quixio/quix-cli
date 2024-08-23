# Developing QuixStreams Applications Locally with Quix CLI

Debugging an application locally using `quix run` has some nuances that need to be properly explained. This tutorial will guide you through the process of debugging an application of an existing Quix data pipeline using a local broker and the Quix CLI. We'll cover prerequisites, best practices, and common issues.

## Prerequisites

This tutorial assumes that you have read the [Quickstart](./cli-quickstart.md) and installed the dependencies:

- [Docker Desktop](https://docs.docker.com/engine/install/){target=_blank}
- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git){target=_blank}
- [Python](https://www.python.org/){target=_blank}

!!! tip
    If you want to start developing after cloning a repository, run:

    ```bash
    quix init
    ```

    This will generate all the necessary files to get you started.

## Developing with Quix CLI

### Step 1: Setting Up the Broker

!!! note
    If you followed all the steps from the [Quickstart](cli-quickstart.md) tutorial, your local pipeline broker is already up and running.

Depending on your setup, you can choose to use your local pipeline broker, another local broker, or the Quix Cloud broker. Here are the steps to configure each:

=== "Local Pipeline Broker"

    To use your local pipeline broker, start it using:

    ```bash
    quix broker up
    ```

    This will spin up a local broker running on `localhost:19092`.

    !!! question "How to ensure that your local application is pointing to your local pipeline broker?"

        The SDK Broker configuration is the broker you use when you run the application locally outside the pipeline.

        Verify it by running:

        ```bash
        quix status
        ```

        Look for this line:
        
        ```
        SDK Broker configuration:   Local (localhost:19092)
        ```

        If you see something else and want a quick fix, run:

        ```bash
        quix sdk broker set localhost:19092 --enable
        ```

=== "Other Local Broker"

    If you want to use a different local broker, you can set the broker address manually. This is useful if you have another Kafka broker running on your local machine or elsewhere. To set a custom local broker address, run:

    ```bash
    quix sdk broker set
    ```

    If you don't want to run the interactive version, you can specify the parameters and enable it by running:
    
    ```bash
    quix sdk broker set localhost:9092 --enable
    ```

    !!! tip
        If you had previously set your broker to Quix Cloud, you will need to switch it back to the local broker. Run:

        ```bash
        quix sdk broker local
        ```

    For more details on the `set` command, refer to the [set broker documentation](./CLI%20Reference/sdk/broker/set.md).

    !!! warning
        This doesn't change your local pipeline broker, just the broker you use when you run the application locally outside the pipeline.
        
=== "Quix Cloud Broker"

    To use the Quix Cloud broker, set the SDK broker configuration to Quix Cloud. This will configure your environment to use the Quix Cloud infrastructure for debugging:

    ```bash
    quix sdk broker cloud
    ```

    This configuration is ideal if you want to test your application in an environment that closely resembles production.

    For more details on the `cloud` command, refer to the [cloud broker documentation](./CLI%20Reference/sdk/broker/cloud.md).

    !!! warning
        This doesn't change your local pipeline broker, just the broker you use when you run the application locally outside the pipeline.

---

For a comprehensive overview of all SDK broker commands, refer to the [SDK broker documentation](./CLI%20Reference/sdk/broker/index.md).

### Step 2: Preparing Your Local Environment

To ensure your application runs smoothly across different environments, it's essential to create a virtual environment for each application you develop. This isolates the dependencies for each application, avoiding conflicts between them.

**Create a Virtual Environment**

   Navigate to your application's directory and run one of the following command:

   ```bash
   python -m venv .venv
   ```

!!! note
    Depending on your system configuration, the command might differ slightly. Use one of these alternatives if needed:

    ```bash
    python3 -m venv .venv
    ```

    or

    ```bash
    py -m venv .venv
    ```

   This command sets up a virtual environment named `.venv` inside your application's directory.

**Activate the Virtual Environment**

After creating the virtual environment, you need to activate it to start using it for your application. The activation command varies by operating system:

=== "Windows"

    ```powershell
    .\.venv\Scripts\activate
    ```

=== "Linux"

    ```bash
    source .venv/bin/activate
    ```

=== "macOS"

    ```bash
    source .venv/bin/activate
    ```

**Install Dependencies**

   Once the virtual environment is active, you can install your application's dependencies from the `requirements.txt` file. Run the following command:

   ```bash
   pip install -r requirements.txt
   ```

   This ensures all necessary packages are installed specifically for this application.

!!! tip "Using DevContainers"
    If you prefer using DevContainers for an isolated development environment, you can set them up with the `--devcontainer` option:

    ```bash
    quix init --devcontainer
    ```

    The `devcontainer.json` file is automatically generated. It reuses your existing Dockerfile, installs Python and Docker extensions, and sets up the Quix CLI within the dev container. This setup ensures that your development environment matches your production environment, reducing the "it works on my machine" issues.

    By using DevContainers, you ensure that your development environment is consistent, isolated, and reproducible.

    Your IDE will take care of the rest.

### Step 3: Understanding Application Variables

Let's take a look at the `.env` file generated for the `event-detection-transformation` application:

!!! note
    If you didn't follow the [Quickstart](cli-quickstart.md) you can get to this point by running:

    ```bash
    quix app create event-detection-transformation
    ```

    or, you can get this `.env` file updated at any point for any Quix applications by running:

    ```bash
    quix init --update
    ```

```.env title=".env"
# ======================================================
#               🚀 Quix CLI guidelines 🚀
# ======================================================
# To update the quix.yaml from this .env file, use:
#  🔄  quix pipeline update
#
# To update the .env file from the quix.yaml file, use:
#  🔄  quix init --update
# ======================================================

### Quix SDK Configuration ###
# Configuration settings for QuixStreams
Quix__Broker__Address=localhost:19092

### Input Topics ###
# Define the input topics used by the application
input=f1-data

### Output Topics ###
# Define the output topics used by the application
output=hard-braking

### Secrets ###
# Sensitive information such as API keys and passwords

### Free Text ###
# Add any free text or comments here

### Untracked Variables ###
# Variables that are not tracked by Quix CLI
```
Each section of the .env file is dedicated to different types of variables used in Quix, such as those for rendering the data pipeline or managing secrets.

You can create and remove variables for your local applications here at your discretion, and they will be integrated into the system as needed.

### Step 4: Running Your Code with `quix run`

By using the [`quix run`](./CLI%20Reference/run.md) command, the `.env` variables are injected into your Python code as environment variables so you can read the values like this:

```python title="main.py"
import os
...
input_topic = app.topic(os.environ["input"])
output_topic = app.topic(os.environ["output"])
```

!!! tip "Working with a local pipeline"
    The `--stop` or `--intercept` options can be used to stop or pause the deployed version of your application during the execution of this command.

!!! note
    The sample provides support for the `load_dotenv` library, which is useful if you want to run Python directly or if your IDE doesn't automatically load `.env` files.

    ```python
    from dotenv import load_dotenv
    load_dotenv()
    ```

### Step 5: Updating Your Pipeline from Your Local Variables

Now, you can create new variables by simply adding them to the appropriate section of the `.env` file:

```.env title=".env" hl_lines="28"
# ======================================================
#               🚀 Quix CLI guidelines 🚀
# ======================================================
# To update the quix.yaml from this .env file, use:
#  🔄  quix pipeline update
#
# To update the .env file from the quix.yaml file, use:
#  🔄  quix init --update
# ======================================================

### Quix SDK Configuration ###
# Configuration settings for QuixStreams
Quix__Broker__Address=localhost:19092

### Input Topics ###
# Define the input topics used by the application
input=f1-data

### Output Topics ###
# Define the output topics used by the application
output=hard-braking

### Secrets ###
# Sensitive information such as API keys and passwords

### Free Text ###
# Add any free text or comments here
variable=my-value

### Untracked Variables ###
# Variables that are not tracked by Quix CLI
```

To move your local variables to your pipeline, run:

```bash
quix pipeline update
```

Your `quix.yaml` file will now contain the new variable you created:

```yaml title="quix.yaml" hl_lines="18-21"
  - name: event-detection-transformation
    application: event-detection-transformation
    version: latest
    deploymentType: Service
    resources:
      cpu: 200
      memory: 800
      replicas: 1
    variables:
      - name: input
        inputType: InputTopic
        required: false
        value: f1-data
      - name: output
        inputType: OutputTopic
        required: false
        value: hard-braking
      - name: variable
        inputType: FreeText
        required: false
        value: my-value
```

### Step 6: Updating Your Local Variables from Your Pipeline

If your `quix.yaml` file contains values you want to use locally, run:

```bash
quix init --update
```

!!! tip 
    You can also perform this operation when you run an application:

    ```bash
    quix run --update
    ```

This is helpful when you merge remote changes from git and the variable values have changed.

```yaml title="quix.yaml" hl_lines="13 17 21"
  - name: event-detection-transformation
    application: event-detection-transformation
    version: latest
    deploymentType: Service
    resources:
      cpu: 200
      memory: 800
      replicas: 1
    variables:
      - name: input
        inputType: InputTopic
        required: false
        value: deployed-input-topic
      - name: output
        inputType: OutputTopic
        required: false
        value: deployed-output-topic
      - name: variable
        inputType: FreeText
        required: false
        value: a-pipeline-value
```

```.env title=".env" hl_lines="17 21 28"
# ======================================================
#               🚀 Quix CLI guidelines 🚀
# ======================================================
# To update the quix.yaml from this .env file, use:
#  🔄  quix pipeline update
#
# To update the .env file from the quix.yaml file, use:
#  🔄  quix init --update
# ======================================================

### Quix SDK Configuration ###
# Configuration settings for QuixStreams
Quix__Broker__Address=localhost:19092

### Input Topics ###
# Define the input topics used by the application
input=deployed-input-topic

### Output Topics ###
# Define the output topics used by the application
output=deployed-output-topic

### Secrets ###
# Sensitive information such as API keys and passwords

### Free Text ###
# Add any free text or comments here
variable=a-pipeline-value

### Untracked Variables ###
# Variables that are not tracked by Quix CLI
```

## Other useful commands for Local Development

There are several other CLI commands that you may find very useful during your local development. Here are some of the most relevant ones:

- [quix pipeline view](./CLI%20Reference/pipeline/view.md): Create and preview a mermaid diagram of the pipeline.
- [quix pipeline up](./CLI%20Reference//pipeline/up.md): Run your pipeline locally using docker compose
- [quix pipeline status](./CLI%20Reference/pipeline/status.md): Display the current status of the local pipeline
- [quix pipeline logs -f -n 10](./CLI%20Reference/pipeline/logs.md): View output from deployments of the local pipeline in realtime
- [quix pipeline sync](./CLI%20Reference/pipeline/sync.md): Synchronize your local pipeline to Quix Cloud
- [quix broker topics read](./CLI%20Reference/broker/topics/read.md): Read the messages from your pipeline topics

You should also check our [CLI Commands Summary](./cli-commands-summary.md), where you'll find the most useful commands for developing QuixStreams data pipelines locally.

## Next steps

<div class="grid cards" markdown>

- __Time to level up?__

    ---

    Deploy your local pipeline to the Cloud, for scalability, observability, and even more Quix magic.

    [Deploy to Quix Cloud :octicons-arrow-right-24:](../quix-cloud/quickstart.md)

</div>
