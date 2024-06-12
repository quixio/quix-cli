{% include-markdown './sync.gen.md' %}

{% include-markdown './sync.gen.md' %}

## How It Works

The `quix environment sync` command orchestrates the synchronization process between your local development environment and the cloud environment based on the configurations specified in the `quix.yaml` file. Here's an overview of its functionality:

1. **Identification of Workspace**: 
   If no default workspace ID is detected, the user is prompted to select one. This workspace serves as the target environment for synchronization.

2. **Project and Environment Validation**: 
   The command validates the project and environment configurations to ensure they are correctly set up for synchronization.

3. **Changes Analysis**: 
   It analyzes the `quix.yaml` file to identify any updates or modifications to deployments and topics.

4. **Cloud Environment Synchronization**: 
   Based on the changes detected, the command synchronizes the cloud environment with the configurations specified in `quix.yaml`. This includes updating existing deployments, adding new ones, and aligning topics as per the defined specifications.


## Example Usage

The `quix env sync` command facilitates the synchronization of your cloud environment with configurations specified in the `quix.yaml` file. Below is an example showcasing the synchronization process:

```bash
$ quix env sync quixdev-quickstart-prod

  Changes              │ Current                             │ Target
 ──────────────────────┼─────────────────────────────────────┼─────────────────────────────────────
  add topic 'csv-data' │                                     │ name: csv-data
                       │                                     │ configuration:
                       │                                     │   partitions: 1
                       │                                     │
  add deployment       │                                     │ name: Starter Source
  'Starter Source'     │                                     │ application: Starter Source
                       │                                     │ version:
                       │                                     │ b07133f7c7aca77aeece1063013b0b47cd3
                       │                                     │ e4803
                       │                                     │ deploymentType: Job
                       │                                     │ resources:
                       │                                     │   cpu: 100
                       │                                     │   memory: 100
                       │                                     │   replicas: 1
                       │                                     │ variables:
                       │                                     │   - name: output
                       │                                     │     inputType: OutputTopic
                       │                                     │     description: Name of the output
                       │                                     │ topic to write into
                       │                                     │     required: true
                       │                                     │     value: csv-data
```

* Changes Column: This column provides a description of the changes detected during the synchronization process. It outlines what specific modifications or additions have been identified in the quix.yaml configuration file compared to the current environment state.

* Current Column: The Current column displays the previous state of the environment or configuration. In this case, since both the topic and deployments are new additions, the Current column appears empty to indicate that there were no previous configurations for these entities.

* Target Column: The Target column represents the desired state after synchronization. It shows how the environment or configuration should look after applying the changes outlined in the quix.yaml file. In this example, it displays the configurations specified in quix.yaml for the new topic (csv-data) and deployment (Starter Source).