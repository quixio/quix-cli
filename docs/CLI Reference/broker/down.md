{% include-markdown './down.gen.md' %}

{% include-markdown './down.gen.md' %}

## How It Works

The `quix broker down` command stops your local broker instance along with all the services that depend on it. When executed, it stops and removes the Docker containers defined in the `compose.local.yaml` file, effectively shutting down the local broker environment.

If the force option is used, the command bypasses all safety checks, allowing for an immediate shutdown without any prompts or checks.

This ensures that your local environment is cleanly stopped and all resources are freed.

## Example Usage

### Stopping the Local Broker with Docker Compose

To stop your local broker, use the following command:

```bash
$ quix broker down
```

This command stops and removes the Docker containers:

```text
Executing 'docker compose down'
```

### Stopping and Removing the Containers

Once the command is executed, Docker Compose will stop and remove the containers:

```text
Container githubrepo-kafka-broker-1  Stopping
Container githubrepo-console-1  Stopping
Container githubrepo-console-1  Stopped
Container githubrepo-console-1  Removing
Container githubrepo-console-1  Removed
Container githubrepo-kafka-broker-1  Stopped
Container githubrepo-kafka-broker-1  Removing
Container githubrepo-kafka-broker-1  Removed
Network githubrepo_default  Removing
Network githubrepo_default  Removed
```

!!! tip "Reusing the pipeline broker"

    When there are active deployments relying on the broker, you will see a prompt:

    ```text
    ! There are active deployments in your pipeline that rely on this broker. Proceeding will also terminate all your local
    deployments
    ? Do you still want to continue? [y/n] (y): y
    ```

    Upon confirmation, Docker Compose will stop and remove the containers:

    ```text
    Executing 'docker compose down'
    
    ...

    Network githubrepo_default  Removing
    Network githubrepo_default  Removed
    ```