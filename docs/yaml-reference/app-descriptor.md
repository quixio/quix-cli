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
    inputType: Secret
    description: The webhook url to send notifications to
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
```

**Explanation:**

- **name:** The name of the variable, which identifies it within the application.
  
- **inputType:** Defines the type of input expected. This can be:
  
    - `InputTopic`: Refers to a topic that the application will consume data from.
  
    - `OutputTopic`: Refers to a topic where the application will produce data.

    - `Secret`: Refers to a sensitive piece of information, such as API keys or webhook URLs, that needs to be securely handled.
     
    - `FreeText`: A flexible text input that can be used for various settings or parameters.

- **description:** A brief explanation of the variable's purpose and how it should be used.

- **defaultValue:** The default value assigned to the variable. This value will be used unless explicitly overridden during deployment.

- **required:** A boolean value indicating whether this variable is mandatory (`true`) or optional (`false`) for the application's operation.

### 3. Docker and Entry Points

```yaml
dockerfile: build/dockerfile
runEntryPoint: main.py
defaultFile: main.py
```

**Explanation:**

- **dockerfile:** The path to the Dockerfile that will be used to build the application's container.
  
- **runEntryPoint:** Specifies the main entry point script that will be executed when the application starts. This is typically the main file that kicks off the application's logic.

- **defaultFile:** Refers to the default file or file of the application, mostly for ide purposes, most of the times it will be the same as runEntryPoint.

## How to Use the `app.yaml` File

This file defines the application's configuration and can be used to maintain consistency across different deployments. By defining variables, you ensure that the application has all the necessary inputs and settings to function correctly in any environment.

### Modifying and Updating

Changes to the `app.yaml` file should be made thoughtfully, as they can affect all deployments of the application. However, the contents of this file can be adjusted or made optional as project requirements evolve.

## Best Practices

- **Consistent Naming:** Ensure that variable names are clear and descriptive to avoid confusion during deployment.
- 
- **Security:** Handle `Secret` type variables with care to ensure sensitive information is not exposed.
- 
- **Documentation:** Keep the `description` field updated to accurately reflect the purpose and usage of each variable.

By managing your `app.yaml` file effectively, you can ensure that your application is deployed consistently and operates reliably in various environments, while retaining the flexibility to adapt or remove elements as needed.
