{% include-markdown './up.gen.md' %}

## How It Works

The `quix local pipeline up` command sets up and runs your pipeline using Docker Compose. When executed, it generates the necessary `compose.yaml` file that defines the services in your pipeline. It then builds and starts the Docker containers based on this configuration by running the equivalent of `docker compose up --build -d`.

If the update option is used, the command updates the `quix.yaml` file with new local applications and variables of existing deployments. The dry-run option allows you to generate the `compose.yaml` file without starting the containers, providing a preview of the configuration.

Deployments are connected using variables with `VariableType` of `InputTopic` and `OutputTopic`, ensuring seamless data flow between different services.

This process ensures that your pipeline is correctly configured and running with all the necessary services. For more details on the `docker compose up` command, refer to the [official Docker documentation](https://docs.docker.com/reference/cli/docker/compose/up/).

!!! warning
    Ensure that Docker is running before executing this command. If Docker is not running, the command will fail. You can verify Docker is running by executing the following command:

    ```bash
    docker info
    ```

## Example usage
### Starting the Pipeline with Docker Compose

To start your pipeline, use the following command:

```bash
$ quix local pipeline up
```

This command generates the necessary `compose.yaml` file and deployment configurations:

```
Generating 'compose.yaml'
Generating deployment demo-data-source
✓ Generated deployment demo-data-source
Generating deployment event-detection-transformation
✓ Generated deployment event-detection-transformation
✓ Generated 'compose.yaml'
```

!!! tip
    You can also use the `--dry-run` option to generate the `compose.yaml` file without running it:

    ```bash
    $ quix local pipeline up --dry-run
    ```

Next, it executes `docker compose up --build -d` to build and run the Docker containers:

```text
Executing 'docker compose up --build -d'
```

#### Running the Containers

Once the images are built, Docker Compose will create and start the containers:

```text
Network githubrepo_default  Creating
Network githubrepo_default  Created
Containers  Creating and Starting
Containers  Started
```

!!! tip
    To update `quix.yaml` with the new local applications and update the variables of existing deployments before running the pipeline, use the following command:

    ```bash
    $ quix local pipeline up --update
    ```

    This command is shorthand for performing both the update and synchronization in one step. Specifically, it executes:

    ```bash
    $ quix local pipeline update
    $ quix local pipeline up
    ```
#### Generated `compose.yaml` File Overview

The `compose.yaml` file configures the services in your pipeline. Here's an overview of what will be generated:

- **demo-data-source** and **event-detection-transformation**:
  - **volumes**: Mounts a null file to `.env`, effectively ignoring your local `.env` folder.
  - **build**: Specifies the context directory and Dockerfile.
  - **environment**: Injects environment variables for Kafka broker addresses and data inputs/outputs. These match the settings in `quix.yaml`.

    ```yaml
    environment:
      input1: f1-data
      output: hard-braking
      Quix__Broker__Address: kafka-broker:9092
    ```

    These environment variables are injected into the container at runtime:

    - **input1**: Specifies the input data stream (`f1-data`).

    - **output**: Specifies the output data stream (`hard-braking`).

    - **Quix__Broker__Address**: Specifies the address of the Kafka broker (`kafka-broker:9092`).

- **kafka-broker and console**:
  - **kafka-broker**: Installs and configures a Redpanda Kafka broker for you.
  - **console**: Provides a management interface for interacting with the Kafka broker, including necessary environment configurations.

For more details on the `compose.yaml` file and its configurations, refer to the [official Docker Compose documentation](https://docs.docker.com/compose/compose-file/).