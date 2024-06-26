{% include-markdown './sync.gen.md' %}

## How It Works

The `quix cloud environments sync` command facilitates the synchronization between your local development environment and the cloud environment based on configurations specified in the `quix.yaml` file. It detects changes in your local configuration and updates the cloud environment accordingly. This includes updating existing deployments, adding new ones, and aligning topics as defined in the specification.

## Example Usage

### Check Sync Status

To check the synchronization status of a specific environment, use the following command:

```bash
$ quix cloud env sync quixdev-quickstart-prod --status
```

The output will indicate whether the environment is in sync with the local repository:

```text
! Out of sync
Synchronized to commit: [9a9483d]
✗ 1 commit behind the repository's head: [d570a96]
```

### Synchronize Environment

To synchronize a specific environment, use the following command:

```bash
$ quix cloud env sync quixdev-quickstart-prod
```

Given this `quix.yaml`:

```yaml
metadata:
  version: 1.0

deployments:
  - name: Starter Source
    application: Starter Source
    version: latest
    deploymentType: Job
    resources:
      cpu: 100
      memory: 100
      replicas: 1
    variables:
      - name: output
        inputType: OutputTopic
        description: Name of the output topic to write into
        required: true
        value: csv-data

topics:
  - name: csv-data
```

The output will display the changes to be applied:

```text
  Changes               | Current     | Target
 -----------------------|-------------|---------------------------------------------------------
  add topic 'csv-data'  |             | name: csv-data
                        |             | configuration:
                        |             |   partitions: 1
                        |             |
  add deployment        |             | name: Starter Source
  'Starter Source'      |             | application: Starter Source
                        |             | version: b07133f7c7aca77aeece1063013b0b47cd3e4803
                        |             | deploymentType: Job
                        |             | resources:
                        |             |   cpu: 100
                        |             |   memory: 100
                        |             |   replicas: 1
                        |             | variables:
                        |             |   - name: output
                        |             |     inputType: OutputTopic
                        |             |     description: Name of the output topic to write into
                        |             |     required: true
                        |             |     value: csv-data
```

#### Columns Explanation

- **Changes Column**: Describes the changes detected during synchronization. It outlines specific modifications or additions identified in the `quix.yaml` configuration file compared to the current environment state.
- **Current Column**: Displays the previous state of the environment or configuration. If both the topic and deployments are new additions, this column appears empty, indicating no previous configurations for these entities.
- **Target Column**: Represents the desired state after synchronization. It shows how the environment or configuration should look after applying the changes outlined in the `quix.yaml` file.

!!! tip
    Use the `--dry-run` option to preview the changes before applying them.

!!! tip
    Ensure your `quix.yaml` file is up-to-date with the desired configurations before running the synchronization command. This helps avoid unexpected changes to your environment.

By using the `quix cloud environments sync` command, you can easily keep your cloud environment in sync with your local configurations, ensuring consistency and reliability across your development and production setups.