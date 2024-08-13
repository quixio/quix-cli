{% include-markdown './run.gen.md' %}

## How It Works

The `quix run` command empowers you to execute your Quix applications locally, creating a seamless bridge between development and production environments. Whether you're tweaking configurations, testing code, or debugging, `quix run` makes it easy to run your applications in a controlled environment. 

### Key Features:

- **Environment Synchronization**: With the `--update` option, ensure your `.env` file is always aligned with your `quix.yaml` configurations before running. This guarantees that the latest environment variables are used, reflecting any recent changes.
  
- **Deployment Control**: Need to pause a live deployment while you test locally? Use the `--intercept` option to temporarily halt the deployment, giving you full control. Want to keep it stopped? The `--stop` option will ensure the deployment stays down until you're ready to restart.

- **Custom Commands**: You’re not limited to the default application run. Specify any command to execute within your local environment, allowing for flexibility in testing and debugging.

## Example Usage

### Running Locally with Default Settings

The simplest use of `quix run` requires no arguments:

```bash
quix run
```

This command uses the current directory and executes your application with the environment variables defined in your `.env` file.

!!! tip
    Use `quix run --update` to synchronize your `.env` with `quix.yaml` before running. This ensures all environment variables are current.

### Targeting Specific Deployments

For projects with multiple deployments, specify which one to focus on:

```bash
quix run --deployment my-deployment
```

This directs the command to the specified deployment, allowing you to test or update it individually.


### Controlling Deployments

If you want to test locally without interference from a live deployment, pause it with:

```bash
quix run --intercept
```

This pauses the live deployment while your local version runs. Once done, the deployment resumes automatically.

Need to stop the deployment entirely and keep it down?

```bash
quix run --stop
```

This halts the deployment, and it won’t restart until you’re ready.

!!! note
    These options are particularly useful when debugging issues that may be affected by live deployments.


### Running a Custom Command

Running a specific command, like executing a Python script:

```bash
quix run python otherfile.py
```

This command runs the `otherfile.py` script, injecting all necessary environment variables from your `.env` file.

---

The `quix run` command is your go-to tool for local development and testing, offering a flexible and powerful way to interact with your Quix applications. Whether you're running default commands, syncing environments, or managing deployments, `quix run` adapts to your workflow, helping you maintain control and efficiency throughout your development process.