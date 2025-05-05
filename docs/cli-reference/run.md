{% include-markdown './run.gen.md' %}

## How It Works

The `quix run` command allows you to execute your Quix applications locally, providing a consistent environment for testing, debugging, and development. This command ensures that your application behaves as it would in production, but within the safety of your local environment.

### Key Features:

- **Environment Synchronization**: When using the `--update` option, the command ensures that your `.env` file is synchronized with your `quix.yaml` configuration. This guarantees that all environment variables are up-to-date, reflecting any recent changes.

- **Deployment Control**: The `--intercept` option temporarily halts a live deployment while you run your application locally, ensuring that your tests are not affected by ongoing production activities. If necessary, the `--stop` option can fully stop the deployment, allowing for isolated testing until you're ready to restart.

- **Custom Commands**: Beyond running the default application, `quix run` allows you to specify custom commands, offering flexibility in how you test and debug your code.

This command is essential for maintaining a controlled and consistent environment across different stages of development, ensuring that your application functions correctly before being deployed to production.

## Example Usage

### Running Locally with Default Settings

To run your application using the existing configurations in your `.env` file, simply execute:

```bash
quix run
```

This will use the current directory and apply the environment variables defined in your `.env` file.

!!! tip
    Before running, you can ensure that your `.env` file is up-to-date by using the `--update` option. This will synchronize your environment variables with the latest `quix.yaml` configurations:

    ```bash
    quix run --update
    ```

### Targeting Specific Deployments

In projects with multiple deployments, you can target a specific deployment using the `--deployment` option:

```bash
quix run --deployment my-deployment
```

This command focuses on the specified deployment, allowing you to test or update it individually.

### Controlling Deployments

For situations where you need to test locally without interference from live deployments, the `--intercept` option can be used:

```bash
quix run --intercept
```

This temporarily pauses the live deployment while your local version runs. Once testing is complete, the deployment resumes automatically.

To completely stop a deployment and keep it down for as long as necessary:

```bash
quix run --stop
```

This halts the deployment, ensuring it remains inactive until manually restarted.

!!! note
    These options are particularly useful during debugging when you need to ensure that the live environment does not interfere with your local tests.

### Running a Custom Command

To execute a specific command, such as running a different Python script:

```bash
quix run python otherfile.py
```

This command runs the `otherfile.py` script, utilizing the environment variables defined in your `.env` file.
