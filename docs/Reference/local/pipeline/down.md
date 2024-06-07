{% include-markdown './down.gen.md' %}

## Example usage
### Shutting Down the Pipeline with Docker Compose

To stop and remove all the containers defined in your `compose.yaml` file, use the following command:

```bash
$ quix local pipeline down
```

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

This ensures that your environment is clean and ready for the next time you need to start the pipeline. For more details on how the `docker compose down` command works, refer to the [official Docker documentation](https://docs.docker.com/compose/reference/down/).