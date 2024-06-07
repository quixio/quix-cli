{% include-markdown './create.gen.md' %}

## Example Usage

When you execute the create local application command without any arguments:

```
$ quix local applications create
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
✓ Application 'Starter Source' created successfully in '$\Starter Source'
```
Then your new `Starter Source` application is created.