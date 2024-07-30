# Developing QuixStreams Applications Locally with Quix CLI

Debugging an application locally using `quix run` has some nuances that need to be properly explained. This tutorial will guide you through the process of debugging an application locally using a local broker, Quix Cloud broker, and DevContainers. We'll cover prerequisites, best practices, and common issues.

## Prerequisites

This tutorial asumes that you have read the [Quickstart](cli-quixtart.md) and installed the dependencies:

- [Docker Desktop](https://docs.docker.com/engine/install/){target=_blank}
- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git){target=_blank}

For this tutorial you will also need the following installed:

- [VS Code](https://code.visualstudio.com/){target=_blank}
- [Python](https://www.python.org/){target=_blank}

!!! tip
    If you want to start developing after cloning a repository run:

    ```
    quix init
    ```

    This will generate all the necessary files to get you started.

## Developing with Quix CLI

### Step 1: Setting Up the Broker

!!! note
    If you did all the steps from the [Quickstart](cli-quixtart.md) tutorial, your local pipeline broker is already up and running

Depending on your setup, you can choose to use your local pipeline broker, another local broker, or the Quix Cloud broker. Here are the steps to configure each:

=== "Local Pipeline Broker"

    To use your local pipeline broker, start your local pipeline broker using:

    ```bash
    quix broker up
    ```

    This will spin up a local broker running on `localhost:19092`.

    !!! question "How to ensure that your local application is pointing to your local pipeline broker?"

        The SDK Broker configuration is just the broker you use when your run the application locally outside the pipeline.

        Get your check it by running:

        ```
        quix status
        ```

        And look for this line:
        
        ```
        SDK Broker configuration:   Local (localhost:19092)
        ```

        If you see something else and want a quick fix, please run:

        ```
        quix sdk broker set localhost:19092 --enable
        ```

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

    !!! warning
        This doesn't change your local pipeline broker, just the broker you use when your run the application locally outside the pipeline.
        
=== "Quix Cloud Broker"

    To use the Quix Cloud broker, set the SDK broker configuration to Quix Cloud. This will configure your environment to use the Quix Cloud infrastructure for debugging:

    ```bash
    quix sdk broker cloud
    ```

    This configuration is ideal if you want to test your application in an environment that closely resembles production.

    For more details on the `cloud` command, refer to the [cloud broker documentation](./Reference/sdk/broker/cloud.md).


    !!! warning
        This doesn't change your local pipeline broker, just the broker you use when your run the application locally outside the pipeline.

---

For a comprehensive overview of all SDK broker commands, refer to the [SDK broker documentation](./Reference/sdk/broker/index.md).

### Step 2: Preparing your local environment:

Creating a virtual environment helps isolate dependencies and avoid conflicts:

```bash
python -m venv .venv
```

!!! warning
    in your system instead of the previous command it can be:
    
    ```bash
    python3 -m venv .venv
    ```

    or even
    
    ```bash
    py -m venv .venv
    ```
    

Activate the virtual environment:

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

Install dependencies from `requirements.txt`:

```bash
pip install -r requirements.txt
```

!!! tip "Using DevContainers"

    If you prefer using DevContainers for an isolated development environment, you can set them up with the `--devcontainer` option:

    ```bash
    quix init --devcontainer
    ```

    The `devcontainer.json` file is automatically generated. It reuses your existing Dockerfile, installs Python and Docker extensions, and sets up the Quix CLI within the dev container. This setup ensures that your development environment matches your production environment, reducing the "it works on my machine" issues.

    By using DevContainers, you ensure that your development environment is consistent, isolated, and reproducible.

    Your IDE will take care of the rest.


### Step 3: Understanding Application Variables

Let's take a look at the `.env` file that we have generated for the `event-detection-transformation` application:


!!! note
    If you didn't follow the [Quickstart](cli-quixtart.md) you can get to this point by running:

    ```
    quix app create event-detection-transformation
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

!!! tip
    You can get this `.env` file updated at any point by running:

    ```
    quix init --update
    ```
    

You can do create and remove variables for your local applications here.

### Step 4: Running your code with `quix run`

By using [`quix run`](./reference/run.md) command the `.env` variables are injected into your python code as environment variables so you can read the values like this:

``` python title="main.py"
import os
...
input_topic = app.topic(os.environ["input"])
output_topic = app.topic(os.environ["output"])
```

!!! tip "Working with a local pipeline"
    The `--stop` or `--intercept` options can be used to stop or pause the deployed version of your application during the execution of this command


!!! note
    The sample provides also support for the `load_dotenv` library, that's useful if you want to run Python directly or your IDE doesn't have a way of loading `.env` files automatically.

    ```
    from dotenv import load_dotenv
    load_dotenv()
    ```

### Step 4: Updating your pipeline from your local variables

Now you can create new variables:


```.env title=".env"  hl_lines="29"
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

If you want to move your local variables to your pipeline you just simply run:

```
quix pipeline update
```

Your `quix.yaml` file will now contain this new variable you created:

``` yaml title="quix.yaml" hl_lines="18-21"
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

### Step 5: Updating your local variables from your pipeline

If your `quix.yaml` file contains values you want to use locally you can run:

``` 
quix init --update
```

!!! tip 
    You can also do this operation when you run an application:

    ``` 
    quix run --update
    ```

This is helpful when you merged remote changes form git and the variable values changed.

``` yaml title="quix.yaml" hl_lines="13 17 21"
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


```.env title=".env"  hl_lines="18 22 29"
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