{% include-markdown './create.gen.md' %}

## How it Works

The `quix applications create` command initializes a new application within your local environment based on the chosen library item. When executed, it creates the necessary file structure and configuration files for the specified application, ensuring that it is ready for development and integration with the Quix ecosystem.

When you run this command, it will prompt you to select a library item from an interactive list if no arguments are provided. This list includes various predefined application templates such as data sources, transformations, and sinks. Once you select a library item, the command will guide you through naming the application and choosing its directory location.

The command generates the application with a default structure relative to the current path, which typically includes the following essential files:

- The main Python file, usually `main.py`
- `app.yaml` for application configuration
- `.env` for environment variable management, allowing you to securely configure sensitive information like API keys and connection strings without hardcoding them into your scripts.
- `requirements.txt` for Python dependencies
- `dockerfile` for containerization
- `README.md` for documentation
- Additional files necessary for the app to function, such as data sources

This setup facilitates a quick start to your development process, allowing you to focus on coding rather than initial configuration.

!!! warning
    You need to be inside a Quix folder for this command to run correctly, which means you need to be in a git repository.

!!! tip
    Use the `--no-git` option to skip the git root directory check, which can be useful if you do not want the application to be tied to a git repository. This is particularly helpful in environments where git is not being used or when you want to manage version control manually.

## Example Usage

When you execute the create local application command without any arguments:

```
$ quix applications create
```

The interactive command starts:

```
✓ Library item language: python
Library item

> Starter Source                    Publish hard-coded lines of JSON data to a Kafka topic.
  Starter Transformation            Consume data from a topic, apply a simple transformation and publish the result to an output topic.
  Starter Sink                      Consume data from a Kafka topic and sink it to any destination that you configure.
  Demo Data Source                  Publish F1 telemetry data from a CSV file to a Kafka topic.
  Event Detection Transformation    Consume data from a topic, filter it and publish the result to an output topic.
  Flask Web Gateway Source          Run a Flask web gateway and use it to publish to a Kafka topic via HTTP POST requests.
  + Explore more items ...
  ✗ Cancel                          

```

Then you select `Starter Source`

```
✓ Library item language: python
? Select the application name: (Starter Source):
```

Leave the name empty so the default name is used:

```
✓ Application name: Starter Source
```

You can then select the values of the library item variables, such as topics. In this case, a list of existing topics is presented, where you can pick an existing topic or create a new one:

```
? [Output Topic] output:

> csv-data
  grouped-transactions
  transactions-output
  + New topic
```

After selecting the output topic:

```
✓ [Output Topic] output: csv-data
✓ Application 'Starter Source' created successfully in '$\Starter Source'
```

Then your new `Starter Source` application is created.


!!! tip
    If you prefer searching the library instead of using the interactive mode, you can use the `quix app library` command to filter by language, tags, or search terms:

    ```bash
    quix app library --tags Easy
    ```

    Once you've found the desired library item, create a new application with the following command, replacing `[library-item-id]` with the item's ID:

    ```bash
    quix apps create [library-item-id]
    ```