# Pipeline YAML Descriptor (quix.yaml)

The `quix.yaml` file serves as the Infrastructure as Code (IaC) descriptor for a Quix project. It defines the data pipeline, including the applications (deployments) and topics that compose the pipeline. This file allows you to configure and manage your data pipeline in a declarative manner, ensuring consistency across environments.

## Structure of `quix.yaml`

### 1. Metadata

```yaml
metadata:
  version: 1.0
```

The `metadata` section contains basic information about the file itself, such as the version of the schema being used. This versioning ensures compatibility and helps manage changes to the structure of the `quix.yaml` file over time.

### 2. Deployments

The `deployments` section is where you define each component of your data pipeline. Each deployment represents an application or service that performs a specific role in the pipeline, such as a source, transformation, or sink.

#### Example Deployment

```yaml
deployments:
  - name: CSV data source
    application: csv data source
    deploymentType: Service
    version: latest
    group: data-sources
    resources:
      cpu: 200
      memory: 500
      replicas: 1
    desiredStatus: Running
    workspaceIds:
      - workspace-1
      - workspace-2
    variables:
      - name: output
        inputType: OutputTopic
        description: Name of the output topic to write into
        required: true
        value: csv-data
        multiline: false
      - name: api_key
        inputType: Secret
        description: API key for data source
        required: true
        secretKey: data-source-api-key
    disabled: true
  - name: data-visualizer
    application: data-visualizer
    version: latest
    deploymentType: Service
    resources:
      cpu: 500
      memory: 1000
      replicas: 1
    publicAccess:
      enabled: true
      urlPrefix: visualization
    network:
      serviceName: data-viz-service
      ports:
        - port: 80
          targetPort: 8050
    state:
      enabled: true
      size: 5
    variables:
      - name: input
        inputType: InputTopic
        description: This is the input topic to read data from
        required: true
        value: csv-data
    plugin:
      embeddedView: true
      sidebarItem:
        show: true
        label: Data Visualizer
        icon: chart-line
        order: 1
  - name: custom-service
    image: custom-repo/my-service:1.2.3
    deploymentType: Service
    resources:
      cpu: 300
      memory: 600
      replicas: 2
    desiredStatus: Running
  - name: Dynamic Configuration Manager
    application: DynamicConfiguration
    deploymentType: Managed
    version: latest
    configuration:
      topic: config-updates
      mongoDatabase: quix
      mongoCollection: configuration-api
      mongoHost: mongodb
      mongoPort: 27017
      mongoUser: admin
      mongoPasswordSecret: mongoPasswordSecret
```

#### Explanation

- **name:** The identifier for the deployment within your pipeline. It's typically a descriptive name of what the deployment does.

- **group:** (Optional) Groups related deployments together for better organization and management.

- **application:** Specifies the name of the application or microservice to deploy. This should match the application folder where the code resides.

- **image:** The full Docker image reference (including repository and tag) to deploy. Used instead of `application` and `version` when deploying a custom Docker image.

- **deploymentType:** Defines the type of deployment. Supported types include:
  - `Service` for long-running services
  - `Job` for tasks that run to completion
  - `Managed` for fully managed deployments with additional configuration options

- **version:** Indicates the version of the application to deploy. Using `latest` ensures that the most recent version is deployed, but this can be set to a specific version to ensure consistency. You can also use a commit reference to specify a specific version.

- **workspaceIds:** (Optional) An array of workspace identifiers where the deployment should be deployed. This allows you to target specific workspaces for deployment.

- **resources:** Defines the compute resources allocated to the deployment. This includes:

  - **cpu:** The amount of CPU resources allocated (in millicores).
  - **memory:** The amount of memory allocated (in megabytes).
  - **replicas:** The number of instances of the application to run for scalability and fault tolerance.

- **desiredStatus:** The state in which you want the application to be. Common statuses include `Running` and `Stopped`.

- **publicAccess:** Configures the public accessibility of the deployment. If enabled, the service will be accessible via a public URL.

  - **enabled:** A boolean value that determines if public access is enabled (`true` or `false`).
  - **urlPrefix:** The URL prefix under which the service will be accessible.

- **network:** Defines the network settings for the deployment, including the service name and exposed ports.

  - **serviceName:** (Optional) Custom service name for internal networking.
  - **ports:** A list of ports to expose.
    
    - **port:** The external port number that will be exposed.
    - **targetPort:** The internal port number the traffic will be directed to.

- **state:** (Optional) Configuration for stateful deployments that require persistent storage.

  - **enabled:** Whether state persistence is enabled for the deployment.
  - **size:** The size of the persistent state storage in gigabytes.

- **variables:** Defines any configurable parameters for the deployment. These are typically inputs or outputs such as:

  - **name:** The name of the variable.
  - **inputType:** The type of input, usually `InputTopic`, `OutputTopic`, `Secret`, or `FreeText`.
  - **description:** A brief explanation of what this variable does.
  - **required:** Indicates whether this variable must be provided (`true` or `false`).
  - **value:** The default or specified value for this variable.
  - **multiline:** (Optional) Whether the variable supports multiline input (for `FreeText` variables).
  - **secretKey:** (Optional) The key reference for secret variables when `inputType` is `Secret`.

- **configuration:** (Optional) A flexible key-value configuration section for managed deployments. Values can be:
  - Single values: `key: value`
  - Arrays: `key: [value1, value2, value3]`
  - This is particularly useful for `Managed` deployment types that require specific configuration parameters.

- **plugin:** (Optional) Configuration for deployment plugins that provide enhanced UI capabilities.

  - **embeddedView:** Whether to enable an embedded view for the deployment plugin.
  - **sidebarItem:** Configuration for the plugin's sidebar item:
    - **show:** Whether to display the sidebar item.
    - **label:** The display label for the sidebar item.
    - **icon:** The icon identifier to use for the sidebar item.
    - **order:** The display order of the sidebar item (lower numbers appear first).

- **disabled:** Set to `true` to prevent the deployment from being started while keeping its configuration intact for future updates or removal.

### Notes on Docker Image Deployments

- **Mutual Exclusivity:** You cannot specify both `application`/`version` and `image` in the same deployment definition. Choose one approach depending on your use case.
- **Image References:** Ensure your Docker image reference includes the repository and tag (e.g., `custom-repo/my-service:1.2.3`).
- **Compatibility:** Direct Docker image deployments provide greater flexibility, especially for non-standardized applications or third-party containers.

### Managed Deployments

Managed deployments (`deploymentType: Managed`) provide additional configuration capabilities for fully managed services. These deployments:

- Support flexible configuration through the `configuration` section
- Can accept both single values and arrays for configuration parameters
- Are optimized for production environments with built-in scaling and monitoring
- May have specific requirements defined by the managed service provider

### Plugin System

The plugin system allows deployments to provide enhanced user interface capabilities:

- **Embedded Views:** Enable custom UI components directly within the deployment interface
- **Sidebar Integration:** Add custom sidebar items with configurable labels, icons, and ordering
- **Enhanced Monitoring:** Provide specialized monitoring and management interfaces for specific deployment types

### Workspace Targeting

Use the `workspaceIds` property to deploy applications to specific workspaces:

- Supports multiple workspace targeting for multi-tenant deployments
- Enables environment-specific deployments (development, staging, production)
- Provides workspace-level isolation and resource management

### 3. Topics

The `topics` section describes the data streams that your applications will produce or consume. Topics are the backbone of data communication in a Quix pipeline, where each topic corresponds to a data stream that can be read by one or more applications.

#### Example Topic

```yaml
topics:
  - name: csv-data
    persisted: false
    configuration:
      partitions: 1
      retentionInMinutes: 6540
      retentionInBytes: 182452224
      cleanupPolicy: Delete
```

**Explanation:**

- **name:** The unique identifier for the topic within your pipeline.

- **persisted:** A boolean value that indicates whether the data in this topic should be stored persistently. Setting this to `false` means data will not be stored permanently and might be deleted after processing.

- **configuration:** (Optional) This section allows you to fine-tune how the topic behaves. Common configurations include:
    
  - **partitions:** The number of partitions within the topic. More partitions allow for greater parallelism but may complicate data ordering.
  - **retentionInMinutes:** How long the data should be retained in the topic before being deleted or compacted.
  - **retentionInBytes:** The total size of data that the topic can retain. When this limit is reached, older data is deleted.
  - **cleanupPolicy:** Defines how the topic handles old data. `Delete` means old data is removed, whereas other policies like `Compact` could be used for different use cases.

## How to Use the `quix.yaml` File

This file is central to managing your Quix project. When you deploy your pipeline, Quix uses this configuration to orchestrate the setup of your data pipeline components. It ensures that all services are deployed with the correct resources and are connected through the appropriate topics.

### Modifying and Updating

Whenever changes are needed, such as scaling an application or adjusting the topic configuration, you can simply modify the `quix.yaml` file and redeploy your pipeline. This approach allows for a repeatable and version-controlled method of managing your pipeline infrastructure.

## Best Practices

- **Version Control:** Always keep your `quix.yaml` file under version control (e.g., in Git) to track changes and collaborate with your team.
- **Resource Management:** Regularly review the resources allocated to each deployment to ensure optimal use of infrastructure.
- **Testing:** Test changes in a development environment before deploying to production to avoid disruptions in data processing.
- **Configuration Management:** Use the `configuration` section for managed deployments to centralize application-specific settings.
- **Security:** Use secret variables for sensitive configuration data instead of hardcoding values.
- **Workspace Organization:** Use `workspaceIds` to properly target deployments to appropriate environments.

By understanding and effectively managing your `quix.yaml` file, you can maintain a robust and scalable data pipeline that meets the needs of your organization.
