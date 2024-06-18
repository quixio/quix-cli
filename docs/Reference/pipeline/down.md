{% include-markdown './down.gen.md' %}

## How It Works

The `quix pipeline down` command stops and removes all the Docker containers defined in your `compose.yaml` file. It acts as a shortcut for the `docker compose down` command, ensuring that all running services are stopped and all associated containers, networks, and volumes are removed.

When executed, this command performs the following steps:

1. **Stops Running Containers**: It stops all containers that were started as part of your pipeline.
2. **Removes Containers**: After stopping the containers, it removes them from your Docker environment.
3. **Removes Networks and Volumes**: Finally, it removes the Docker networks and volumes associated with the pipeline, ensuring a clean state.

This process ensures that your environment is clean and ready for the next time you need to start the pipeline. For more details on how the `docker compose down` command works, refer to the [official Docker documentation](https://docs.docker.com/compose/reference/down/).

!!! warning
    Ensure that Docker is running before executing this command. If Docker is not running, the command will fail. You can verify Docker is running by executing the following command:

    ```bash
    docker info
    ```
    
## Example usage

### Shutting Down the Pipeline with Docker Compose

To stop and remove all the containers defined in your `compose.yaml` file, use the following command:

```bash
$ quix pipeline down
```

!!! tip
    The `--keep-broker` option allows you to keep the local broker running while stopping and removing the other containers. This is useful if you need the broker to remain active for other purposes like using it for local as your local debug broker.

In practice, this command is a shortcut for `docker compose down`. It stops all running services and removes the containers, networks, and volumes associated with the Docker Compose configuration.

For example:

```text
Executing 'docker compose down'

 Container githubrepo-console-1  Stopping
 Container githubrepo-event-detection-transformation-1  Stopping
 Container githubrepo-demo-data-source-1  Stopping
 Container githubrepo-kafka-broker-1  Stopping
 Container githubrepo-event-detection-transformation-1  Stopped
 Container githubrepo-event-detection-transformation-1  Removing
 Container githubrepo-demo-data-source-1  Stopped
 Container githubrepo-demo-data-source-1  Removing
 Container githubrepo-event-detection-transformation-1  Removed
 Container githubrepo-demo-data-source-1  Removed
 Container githubrepo-console-1  Stopped
 Container githubrepo-console-1  Removing
 Container githubrepo-console-1  Removed
 Container githubrepo-kafka-broker-1  Stopped
 Container githubrepo-kafka-broker-1  Removing
 Container githubrepo-kafka-broker-1  Removed
 Network githubrepo_default  Removing
 Network githubrepo_default  Removed
```

This ensures that your environment is clean and ready for the next time you need to start the pipeline.
