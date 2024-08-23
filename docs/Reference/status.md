{% include-markdown './status.gen.md' %}

## How It Works

The `quix status` command provides a quick and comprehensive overview of your Quix CLI environment. It checks several key aspects to ensure your system is properly configured.

It performs the following checks:

1. **Authentication Status**: Verifies if you are logged into Quix Cloud and displays your user information if logged in.
2. **Current Context**: Shows details about the current context, including the name, URL, environment ID, and local broker settings.
3. **Git Repository**: Identifies and displays the root directory of your Git repository.
4. **Docker Installation**: Verifies if Docker is installed and reports the status.
5. **Git Installation**: Confirms if Git is installed and reports the status.
6. **Local Pipeline Status**: Checks and reports the status of your local pipeline.

This command is useful for quickly assessing the overall health and configuration of your development environment.

## Example Usage

### Not Logged In


```bash
$ quix status
```

If you are not logged into Quix Cloud, the status command will indicate this and provide relevant details:


```text
✗ Not logged in
  User:                       ! Not logged in to Quix Cloud
  Current context:            default (https://portal-api.platform.quix.io)
  Default environment:        ! Not set
  SDK broker configuration:   Local (localhost:19092)
! Local Pipeline Status:      Not Running
! Local Broker Status:        Not Running
✓ Docker detected
✓ Git detected
  Git Root:                   \path\to\your\repo
```

### Logged In with Default Environment

!!! tip
    Log in to Quix Cloud by using the [`quix login`](login.md) command.

If you are logged into Quix Cloud and have a default environment set, the status command will display the following:

```text
✓ Logged in
  User:                       test@example.com (Test User)
  Organization:               Example (example-org)
  Current context:            default (https://portal-api.platform.quix.io)
  Default environment:        example-org-project-env
  SDK Broker configuration:   Local (localhost:19092)
! Local Pipeline Status:      Not Running
! Local Broker Status:        Not Running
✓ Docker detected
✓ Git detected
  Git Root:                   \path\to\your\repo
```

!!! tip
    If you are logged in, use the [`quix use`](use.md) command to select your default Quix Cloud environment.

### Pipeline Status

The status of your local pipeline is also displayed:

```text
✓ Local Pipeline Status:      Running (2/2)
✓ Local Broker Status:        Running (localhost:19092)
✓ Local Broker GUI:           Running (http://localhost:8080)
```

If the pipeline is running but not all services are up, it will be indicated:

```text
✗ Local Pipeline Status:      Running (1/2)
```


!!! tip
    Use the [`quix pipeline status`](pipeline/status.md) command to get detailed information about which services in your local pipeline are running and which are not.

### Git Repository Not Found

If the current execution path is not inside a local Git repository, the command will indicate this:

```text
✗ No git root detected
```

By using the `quix status` command, you can quickly get a comprehensive overview of your Quix CLI environment, allowing you to identify and address any issues efficiently.
