{% include-markdown './status.gen.md' %}

## How It Works

The `quix pipeline status` command retrieves the current status of the local pipeline by executing the `docker compose ps --format json -a` command. This command fetches the status of all services defined in your `docker-compose` file and presents the relevant information in a concise and readable format.

For more information, refer to the [Docker documentation](https://docs.docker.com/compose/reference/ps/).

!!! warning
    Ensure that Docker is running before executing this command. If Docker is not running, the command will fail. You can verify Docker is running by executing the following command:

    ```bash
    docker info
    ```

## Example Usage

### Displaying the Local Pipeline Status

To display the current status of your local pipeline, use the following command:

```bash
$ quix pipeline status
```

#### All Services Running

If all services in the pipeline are running, you will see output similar to the following:

```
Local Pipeline Status:           ✓ Running (4/4)
  console                        ✓ Up 1 second
  demo-data-source               ✓ Up 1 second
  kafka-broker                   ✓ Up 1 second
  event-detection-transformation ✓ Up 1 second
```

#### Some Services Not Running

If some services are not running, the output will indicate which services have exited:

```
Local Pipeline Status:           ✗ Running (3/4)
  console                        ✓ Up 1 second
  demo-data-source               ✓ Up 1 second
  kafka-broker                   ✓ Up 1 second
  event-detection-transformation ✗ Exited (1) 1 second ago
```

#### No Services Running

If no services are running, you will see the following message:

```
Local Pipeline Status: Not Running
```

By using the `quix pipeline status` command, you can easily keep track of the state of your local pipeline and ensure that all necessary services are running smoothly.