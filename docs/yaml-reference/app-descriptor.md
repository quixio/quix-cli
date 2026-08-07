# Application YAML Descriptor (app.yaml)

The `app.yaml` file is used to define the configuration of a Quix application. This file serves as a contract for the application, outlining its variables and settings. It is similar to deployment configurations, but specific to the application itself.

## Structure of `app.yaml`

### 1. Application Metadata

```yaml
name: Slack Alerts
language: python
```

**Explanation:**

- **name:** The name of the application. This should be a clear and descriptive identifier that reflects the application's purpose.
  
- **language:** Specifies the programming language used by the application. This information helps in understanding the environment and dependencies required for the application.

### 2. Variables

The `variables` section defines the inputs and settings that the application may require to function correctly. These variables can include topics, secrets, and free text inputs.

#### Example Variables

```yaml
variables:
  - name: input
    inputType: InputTopic
    description: Name of the input topic to listen to.
    defaultValue: enriched-click-data
    required: true
  - name: webhook_url
    inputType: ProjectVariable
    description: The webhook url to send notifications to
    secret: true
    defaultValue: webhook_url
    required: true
  - name: timeout
    inputType: FreeText
    description: Get alerts if we have not received data in this timeout (seconds)
    defaultValue: 3600
    required: false
  - name: notification_interval
    inputType: FreeText
    description: Send alerts at most every x seconds (default 10 minutes)
    defaultValue: 600
    required: false
  - name: content_store
    inputType: Options
    description: Where to store the content
    defaultValue: mongo
    required: false
    options:
      - label: MongoDB
        value: mongo
      - label: File System
        value: file
  - name: api_token
    inputType: Secret
    description: Token used to call the external API
    defaultValue: external.api.token
    required: true
  - name: DatabaseConfig
    inputType: VariableGroup
    description: Connection settings shared across the project
    variables:
      - key: database.host
        defaultValue: localhost
      - key: database.password
        secret: true
```

**Explanation:**

- **name:** The name of the variable, which identifies it within the application.
  
- **inputType:** Defines the type of input expected, what `defaultValue` means for it, and where the value comes from when you run the application locally.

    | `inputType` | Meaning | `defaultValue` holds | Local value source |
    |---|---|---|---|
    | `InputTopic` | Topic the application consumes data from | the topic name | none — the value is inline |
    | `OutputTopic` | Topic the application produces data to | the topic name | none — the value is inline |
    | `Topic` | Topic reference that is not fixed as input or output | the topic name | none — the value is inline |
    | `FreeText` | Flexible text input for settings or parameters | the value | none — the value is inline |
    | `HiddenText` | Text input masked in the UI; **not** a managed secret | the value | none — the value is inline |
    | `Options` | Selection from the predefined `options` list | the selected `value` | none — the value is inline |
    | `Secret` | Managed secret; the value never appears in the descriptor | the **secret key** | [`.secrets`](../local-development/local-secrets.md), keyed by the secret key. Left blank in the generated `.env` |
    | `ProjectVariable` | Value from the project's variables store, resolved per environment | the **project variable key** | the project variables store, or [`.quix.yaml.variables`](../local-development/local-yaml-variables.md) keyed by the project variable key |
    | `VariableGroup` | Named group whose members are injected together | not used — `name` is the group name, and the members are listed under [`variables`](#variable-group-members) | [`.quix.yaml.variables`](../local-development/local-yaml-variables.md), keyed by each member `key` |

    `Secret` and `ProjectVariable` with `secret: true` are **two independent mechanisms**, both current — the CLI keeps whichever type you declare. They read from different files locally: `.secrets` for `Secret`, `.quix.yaml.variables` for project variables and variable-group members. A project variable marked `secret: true` has its value withheld by the API, so its local value must be set in `.quix.yaml.variables`.

    When the CLI generates `.env` it sections `HiddenText` and `Options` under Free Text and `Topic` under Input Topics; the type you declare is preserved in `app.yaml`.

- **options:** An array of predefined choices, required when `inputType` is `Options`. Each entry contains:
  - **label:** The human-readable text displayed in the UI dropdown.
  - **value:** The actual value assigned to the environment variable.

- **description:** A brief explanation of the variable's purpose and how it should be used.

- **defaultValue:** The default value assigned to the variable, used unless explicitly overridden during deployment. For `Secret` and `ProjectVariable` it is not a value but a **key** — see the table above.

- **required:** A boolean value indicating whether this variable is mandatory (`true`) or optional (`false`) for the application's operation.

- **secret:** When `true` — on a `ProjectVariable` or on a variable-group member — the value is treated as sensitive and is left blank in the generated `.env`; supply it locally in the file named in the table above. A secret `ProjectVariable` is also encrypted at rest and withheld from API responses.

- **variables:** The members of a `VariableGroup` — see [Variable group members](#variable-group-members).

#### Variable Group Members

A `VariableGroup` variable carries its own `variables` list. Each member is resolved locally from `.quix.yaml.variables` under its `key`.

| Field | Required | Type | Examples | Description & Notes |
|-------|----------|------|----------|---------------------|
| `key` | Yes | string | `database.host`, `database.password` | The member's key. Also the key used to look the value up in `.quix.yaml.variables`. |
| `defaultValue` | No | string | `localhost`, `develop` | Default value for the member. |
| `secret` | No | boolean | `true` / `false` | Marks the member as sensitive. Secret members use `.quix.yaml.variables` like every other member — **not** `.secrets`. |

In the generated `.env`, group members appear under a `# GROUP: <name>` comment with their key sanitized to environment-variable form — dots become double underscores, so `database.host` becomes `database__host`.

### 3. Docker and Entry Points

```yaml
dockerfile: dockerfile
runEntryPoint: main.py
defaultFile: main.py
```

**Explanation:**

- **dockerfile:** The path to the Dockerfile that will be used to build the application's container.
  
- **runEntryPoint:** Specifies the main entry point script that will be executed when the application starts. This is typically the main file that kicks off the application's logic.

- **defaultFile:** Refers to the default file or file of the application, mostly for ide purposes, most of the times it will be the same as runEntryPoint.

### 4. Included Folders

```yaml
includedFolders:
  - src-folder
  - config-folder
  - assets-folder
```

**Explanation:**

- **includedFolders:** Lists any directories to be packaged and deployed alongside the application. If omitted, only the main application files (e.g., `main.py`) are included.
- **Paths:** These paths are specified relative to the root of your Git repository, ensuring the intended folder structure is maintained during deployment.
- **Default Behavior:** Without this section, only the essential application files are deployed, leaving out additional directories containing source code, configurations, or other assets.

For further details on how these folders are incorporated during the Docker build process, refer to the [Dockerfile explanation](dockerfile.md).

## How to Use the `app.yaml` File

This file defines the application's configuration and can be used to maintain consistency across different deployments. By defining variables, you ensure that the application has all the necessary inputs and settings to function correctly in any environment.

### Modifying and Updating

Changes to the `app.yaml` file should be made thoughtfully, as they can affect all deployments of the application. However, the contents of this file can be adjusted or made optional as project requirements evolve.

## Best Practices

- **Consistent Naming:** Ensure that variable names are clear and descriptive to avoid confusion during deployment.

- **Security:** Store sensitive values as a `Secret`, or as a `ProjectVariable` with `secret: true`, so the descriptor holds only a key and never the value. `HiddenText` only masks the value in the UI — it is not a managed secret.

- **Documentation:** Keep the `description` field updated to accurately reflect the purpose and usage of each variable.

By managing your `app.yaml` file effectively, you can ensure that your application is deployed consistently and operates reliably in various environments, while retaining the flexibility to adapt or remove elements as needed.