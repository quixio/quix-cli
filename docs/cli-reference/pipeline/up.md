{% include-markdown './up.gen.md' %}

## How It Works

The `quix pipeline up` command sets up and runs your pipeline using Docker Compose. When executed, it generates the necessary `compose.local.yaml` file that defines the services in your pipeline. It then builds and starts the Docker containers based on this configuration by running the equivalent of `docker compose up --build -d`.

If the update option is used, the command updates the `quix.yaml` file with new local applications and variables of existing deployments. The dry-run option allows you to generate the `compose.local.yaml` file without starting the containers, providing a preview of the configuration.

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
$ quix pipeline up
```

This command generates the necessary `compose.local.yaml` file and deployment configurations:

```
  Generating 'compose.local.yaml'
  Generating deployment demo-data-source
✓ Generated deployment demo-data-source
  Generating deployment event-detection-transformation
✓ Generated deployment event-detection-transformation
✓ Generated 'compose.local.yaml'
```

!!! tip
    You can also use the `--dry-run` or `-D` option to generate the `compose.local.yaml` file without running it:

    ```bash
    $ quix pipeline up --dry-run
    ```

When the compose file is generated, it will start the kafka broker first:

```
Starting the pipeline broker ...

Executing 'docker compose -f compose.local.yaml up --build -d --remove-orphans kafka-broker'

 Container simplebroker-kafka-broker-1  Creating
 Container simplebroker-kafka-broker-1  Created
 Container simplebroker-kafka-broker-1  Starting
 Container simplebroker-kafka-broker-1  Started
``` 

#### Updating the topics

After the broker has started, the topics created automatically with the configuration provided in `quix.yaml`.

```
Updating topics ...

✓ Created topic: f1-data
✓ Created topic: hard-braking
✓ No topics to update

✓ Started the pipeline broker
```

!!! tip
    Use the options `--skip-topics` or `-s` if you don't want to skip the topic creation.

Next, it executes `docker compose compose.local.yaml up --build -d --remove-orphans` to build and run the your application Docker containers:

```text
Executing 'docker compose up --build -d --remove-orphans'
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
    Using the `--update` option will perform the same actions as running [`quix pipeline update`](update.md) before generating the `compose.local.yaml` file.

Finally you will see your applications running in docker and you will have visual way to manage and view your pipeline topics:

```
✓ Open http://localhost:8080 to manage your pipeline broker
```

#### Generated `compose.local.yaml` File Overview

The `compose.local.yaml` file configures the services in your pipeline. Here's an overview of what will be generated:

- **demo-data-source** and **event-detection-transformation**:
    - **volumes**: Mounts a null file to `.env`, effectively ignoring your local `.env` folder.
    - **build**: Specifies the context directory and Dockerfile.
    - **environment**: Injects environment variables for Kafka broker addresses and data inputs/outputs. These match the settings in `quix.yaml`.

      ```yaml
      environment:
        input: f1-data
        output: hard-braking
        Quix__Broker__Address: kafka-broker:9092
      ```

      These environment variables are injected into the container at runtime:

      - **input**: Specifies the input data stream (`f1-data`).

      - **output**: Specifies the output data stream (`hard-braking`).

      - **Quix__Broker__Address**: Specifies the address of the Kafka broker (`kafka-broker:9092`).


- **kafka-broker and console**:

    - **kafka-broker**: Installs and configures a Redpanda Kafka broker for you.

    - **console**: Provides a management interface for interacting with the Kafka broker, including necessary environment configurations.

For more details on the `compose.local.yaml` file and its configurations, refer to the [official Docker Compose documentation](https://docs.docker.com/compose/compose-file/).