# Pipeline YAML Descriptor (`quix.yaml`)

The `quix.yaml` file serves as the Infrastructure as Code (IaC) descriptor for a Quix project. It defines the data pipeline, including the applications (deployments) and topics that compose the pipeline. This file allows you to configure and manage your data pipeline in a declarative manner, ensuring consistency across environments.

---

## 1. Metadata

```yaml
metadata:
  version: 1.0
```

The `metadata` section contains basic information about the file itself, such as the version of the schema being used. This versioning ensures compatibility and helps manage changes to the structure of the `quix.yaml` file over time.

---

## 2. Deployments

The `deployments` section is where you define each component of your data pipeline. Each deployment represents an application or service that performs a specific role in the pipeline, such as a source, transformation, or sink.

### Example

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
      embeddedView:
        enabled: true
        hideHeader: false
        default: true
      sidebarItem:
        show: true
        label: Data Visualizer
        icon: tune
        order: 1
        badge: Alpha
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

### Field Reference

| Field | Required | Type | Examples | Description & Notes |
|-------|----------|------|----------|---------------------|
| `name` | Yes | string | `csv-source`, `data-visualizer` | The identifier for the deployment within your pipeline; descriptive human-readable name. |
| `group` | No | string | `data-sources`, `etl` | Groups related deployments together for better organization and management. |
| `application` | Yes* | string | csv data source | Specifies the name of the application or microservice to deploy. This should match the application folder where the code resides. |
| `image` | Yes* | string | `repo/service:1.2.3` | Fully qualified Docker image incl. tag; set instead of `application` + `version`. |
| `deploymentType` | Yes | enum | `Service`, `Job`, `Managed` | long-running (`Service`), run-to-completion (`Job`), or [Quix managed service](../../quix-cloud/managed-services/overview.md) (`Managed`). |
| `version` | Yes* | string | `latest`, semantic tag, commit SHA | Tag/commit for application build. Omit when using `image`. Use pinned value for reproducibility. |
| `workspaceIds` | No | string[] | `["workspace-1"]` | An array of workspace identifiers where the deployment should be deployed. This allows you to target specific workspaces for deployment. |
| [`resources`](#resources-fields) | No | object | See Resources Fields | Defines the compute resources allocated to the deployment. |
| `desiredStatus` | No | enum | `Running`, `Stopped` | The state in which you want the deployment to be. Defaults to `Running` if omitted. |
| [`publicAccess`](#public-access-fields) | No | object | See Public Access Fields | Configure public endpoint for service workloads only. |
| [`network`](#network-fields) | No | object | See Network Fields | Defines the network settings for the deployment. Ignored for `Job`. |
| [`state`](#state-fields) | No | object | See State Fields | Persistent volume claim definition for stateful services. |
| [`variables`](#variable-fields) | No | object[] | See Variable Fields | Declarative runtime/config variables and topic bindings. |
| `configuration` | No | object | `key: value`, `key: [value1, value2, value3]` | A flexible key-value configuration section for managed deployments. Can be single value or array. |
| [`plugin`](#plugin-fields) | No | object | See Plugin Fields | Configuration for deployment plugins that provide enhanced UI capabilities. |
| `disabled` | No | boolean | `true` / `false` | Set to `true` to prevent the deployment from being started while keeping its configuration intact for future updates or removal. |

!!! warning "Mutual exclusivity"
    Use either `application` + `version` or `image` (not both) in a deployment definition.

!!! tip "Versioning"
    Use a concrete version or commit when you need repeatability; `latest` gives the most recent build.

!!! info "Managed Services"
    :material-file-document-outline: For more info about the `Managed` deployment type, click [here](../../quix-cloud/managed-services/overview.md).

#### Plugin Fields

| Field | Required | Type | Examples | Description & Notes |
|-------|----------|------|----------|---------------------|
| `embeddedView` | No | boolean / object | `true` / `{ enabled: true, hideHeader: false, default: false }` | Can be a boolean or object. If `true`, equivalent to `{ enabled: true, hideHeader: false, default: false }`. If `false`, embedded view is disabled. |
| `embeddedView.enabled` | No | boolean | `true` / `false` | Enables the embedded view. Default = `false`. |
| `embeddedView.hideHeader` | No | boolean | `true` / `false` | If `true`, hides the header (deployment name + menu). Defaults to `false`. |
| `embeddedView.default` | No | boolean | `true` / `false` | When enabled, displays the embedded view by default when clicking on a deployment. Defaults to `false` for standard deployments. |
| `sidebarItem` | No | object | See nested fields | Optional object configuring the sidebar shortcut in the environment. |
| `sidebarItem.show` | No | boolean | `true` / `false` | Whether to display a shortcut in the sidebar. |
| `sidebarItem.label` | No | string | `Data Visualizer`, `Configuration` | Display name shown in navigation. |
| `sidebarItem.icon` | No | string | `tune`, `chart-line`, `database` | Google Material icon name. |
| `sidebarItem.order` | No | integer | `1`, `10` | Display order (lower numbers appear first). |
| `sidebarItem.badge` | No | string (max 15 chars) | `Alpha`, `Beta`, `New`, `Experimental` | Optional short label displayed next to the sidebar item. |

:material-file-document-outline: See more details in the [Plugin Documentation](../../quix-cloud/managed-services/plugin.md).

#### Resources Fields

| Field | Required | Type | Examples | Description & Notes |
|-------|----------|------|----------|---------------------|
| `cpu` | No | integer | `200`, `500`, `1000` | Millicores requested. |
| `memory` | No | integer | `256`, `512`, `1024` | Memory request in MB. Monitor usage to adjust. |
| `replicas` | No | integer | `1`, `2`, `3` | The number of instances of the application to run for scalability and fault tolerance. |

#### Public Access Fields

| Field | Required | Type | Examples | Description & Notes |
|-------|----------|------|----------|---------------------|
| `enabled` | No | boolean | `true` / `false` | Expose service publicly. |
| `urlPrefix` | When enabled | string | `visualization`, `metrics` | The URL prefix under which the service will be accessible. Unique per workspace. |

#### Network Fields

| Field | Required | Type | Examples | Description & Notes |
|-------|----------|------|----------|---------------------|
| `serviceName` | No | string | `data-viz-service` | Custom service name for internal networking. |
| `ports[].port` | No | integer | `80`, `8080` | The external port number that will be exposed. |
| `ports[].targetPort` | No | integer | `8050`, `5000` | Container port; defaults to `port` when omitted. |

#### State Fields

| Field | Required | Type | Examples | Description & Notes |
|-------|----------|------|----------|---------------------|
| `enabled` | No | boolean | `true` / `false` | Allocate persistent storage volume. |
| `size` | When enabled | integer | `1`, `5`, `20` | The size of the persistent state storage in gigabytes. |

#### Variable Fields

| Field | Required | Type | Examples | Description & Notes |
|-------|----------|------|----------|---------------------|
| `name` | Yes | string | `input`, `output`, `api_key` | The name of the variable. |
| `inputType` | Yes | enum | `InputTopic`, `OutputTopic`, `Secret`, `FreeText` | Determines validation & UI control type. |
| `description` | No | string | Free text | A brief explanation of what this variable does. |
| `required` | No | boolean | `true` / `false` | Enforces presence of value (or secret) to start deployment. |
| `value` | No | string | `csv-data` | Assigned value (not for secrets). |
| `multiline` | No | boolean | `true` | Enable multi-line editing (mostly with `FreeText`). |
| `secretKey` | When `inputType=Secret` | string | `data-source-api-key` | Reference to stored secret; secret value not stored here. |

!!! note "Secrets"
    When `inputType: Secret`, supply the reference using `secretKey` (do not put the secret in `value`).

### Notes on Docker Image Deployments

- **Mutual Exclusivity:** You cannot specify both `application`/`version` and `image` in the same deployment definition. Choose one approach depending on your use case.
- **Image References:** Ensure your Docker image reference includes the repository and tag (e.g., `custom-repo/my-service:1.2.3`).
- **Compatibility:** Direct Docker image deployments provide greater flexibility, especially for non-standardized applications or third-party containers.

## 3. Topics

The `topics` section describes the data streams that your applications will produce or consume. Topics are the backbone of data communication in a Quix pipeline, where each topic corresponds to a data stream that can be read by one or more applications.

### Topic Example

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

### Topic Field Reference

| Field | Required | Type | Examples | Description & Notes |
|-------|----------|------|----------|---------------------|
| `name` | Yes | string | `csv-data` | The unique identifier for the topic within your pipelines. |
| `persisted` | No | boolean | `true` / `false` | A boolean value that indicates whether the data in this topic should be stored persistently. Setting this to `false` means data will not be stored permanently and might be deleted after processing. |
| [`configuration`](#topic-configuration-fields) | No | object | See Topic Configuration Fields | Advanced retention / partition tuning. |

#### Topic Configuration Fields

| Field | Required | Type | Examples | Description & Notes |
|-------|----------|------|----------|---------------------|
| `partitions` | No | integer | `1`, `3`, `6` | The number of partitions within the topic. More partitions allow for greater parallelism but may complicate data ordering. |
| `retentionInMinutes` | No | integer | `1440`, `10080` | Time-based retention window. Combine with size retention for dual thresholds. |
| `retentionInBytes` | No | integer | `182452224` | The total size of data that the topic can retain.|
| `cleanupPolicy` | No | enum | `Delete`, `Compact`* | Defines how the topic handles old data. `Delete` means old data is removed, whereas other policies like `Compact` could be used for different use cases. |

## How to Use the `quix.yaml` File

This file is central to managing your Quix project. When you deploy your pipeline, Quix uses this configuration to orchestrate the setup of your data pipeline components. It ensures that all services are deployed with the correct resources and are connected through the appropriate topics.

### Modifying and Updating

Whenever changes are needed, such as scaling an application or adjusting the topic configuration, you can simply modify the `quix.yaml` file and redeploy your pipeline. This approach allows for a repeatable and version-controlled method of managing your pipeline infrastructure.

### Best Practices

- **Version Control:** Always keep your `quix.yaml` file under version control (e.g., in Git) to track changes and collaborate with your team.
- **Resource Management:** Regularly review the resources allocated to each deployment to ensure optimal use of infrastructure.
- **Testing:** Test changes in a development environment before deploying to production to avoid disruptions in data processing.
- **Security:** Use secret variables for sensitive configuration data instead of hardcoding values.

By understanding and effectively managing your `quix.yaml` file, you can maintain a robust and scalable data pipeline that meets the needs of your organization.
