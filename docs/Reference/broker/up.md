{% include-markdown './up.gen.md' %}

## How It Works

The `quix broker up` command sets up and runs your local broker instance using Docker Compose. When executed, it generates the necessary `compose.yaml` file that defines the broker services required for your setup. It then builds and starts the Docker containers based on this configuration by running the equivalent of `docker compose up --build -d --remove-orphans`.

If the dry-run option is used, the command allows you to generate the `compose.yaml` file without starting the containers, providing a preview of the configuration. This is particularly useful for validating your setup before making any changes to your running environment.

Deployments are connected using variables that ensure seamless data flow between different services. This process ensures that your local broker instance is correctly configured and running with all necessary services. For more details on the `docker compose up` command, refer to the [official Docker documentation](https://docs.docker.com/reference/cli/docker/compose/up/).

!!! warning
    Ensure that Docker is running before executing this command. If Docker is not running, the command will fail. You can verify Docker is running by executing the following command:

    ```bash
    docker info
    ```

## Example Usage

### Starting the Local Broker with Docker Compose

To start your local broker, use the following command:

```bash
$ quix broker up
```

This command generates the necessary `compose.yaml` file and deployment configurations:

```
Generating 'compose.yaml'
✓ Generated 'compose.yaml'
```

Next, it executes `docker compose up --build -d --remove-orphans` to build and run the Docker containers:

```text
Executing 'docker compose up --build -d --remove-orphans'
```

### Running the Containers

Once the images are built, Docker Compose will create and start the containers:

```text
Network githubrepo_default  Creating
Network githubrepo_default  Created
Container githubrepo-kafka-broker-1  Creating
Container githubrepo-console-1  Creating
Container githubrepo-console-1  Created
Container githubrepo-kafka-broker-1  Created
Container githubrepo-console-1  Starting
Container githubrepo-kafka-broker-1  Starting
Container githubrepo-kafka-broker-1  Started
Container githubrepo-console-1  Started
```

## Generated `compose.yaml` File Overview

The `compose.yaml` file configures the services in your local broker instance. Here's an overview of what will be generated:

- **kafka-broker**:
    - **build**: Specifies the context directory and Dockerfile for the Kafka broker.
    - **environment**: Sets environment variables for the broker configuration, including the listener address and the Zookeeper instance address.

- **console**:
    - **build**: Specifies the context directory and Dockerfile for the Kafka management console.
    - **environment**: Sets environment variables for the console configuration, including the Kafka broker address.

For more details on the `compose.yaml` file and its configurations, refer to the [official Docker Compose documentation](https://docs.docker.com/compose/compose-file/).