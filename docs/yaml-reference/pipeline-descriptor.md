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
    resources:
      cpu: 200
      memory: 500
      replicas: 1
    desiredStatus: Running
    variables:
      - name: output
        inputType: OutputTopic
        description: Name of the output topic to write into
        required: true
        value: csv-data
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
      ports:
        - port: 80
          targetPort: 8050
    variables:
      - name: input
        inputType: InputTopic
        description: This is the input topic to read data from
        required: true
        value: csv-data
  - name: custom-service
    image: custom-repo/my-service:1.2.3
    deploymentType: Service
    resources:
      cpu: 300
      memory: 600
      replicas: 2
    desiredStatus: Running
```

#### Explanation

- **name:** The identifier for the deployment within your pipeline. It's typically a descriptive name of what the deployment does.

- **application:** Specifies the name of the application or microservice to deploy. This should match the application folder where the code resides.

- **image:** The full Docker image reference (including repository and tag) to deploy. Used instead of `application` and `version` when deploying a custom Docker image.

- **deploymentType:** Defines the type of deployment. Common types include `Service` for long-running services, `Job` for tasks that run to completion, and others as required by your architecture.

- **version:** Indicates the version of the application to deploy. Using `latest` ensures that the most recent version is deployed, but this can be set to a specific version to ensure consistency. You can also use a commit reference to specify a specific version.

- **resources:** Defines the compute resources allocated to the deployment. This includes:

    - **cpu:** The amount of CPU resources allocated (in millicores).
    - **memory:** The amount of memory allocated (in megabytes).
    - **replicas:** The number of instances of the application to run for scalability and fault tolerance.

- **desiredStatus:** The state in which you want the application to be. Common statuses include `Running` and `Stopped`.

- **publicAccess:** Configures the public accessibility of the deployment. If enabled, the service will be accessible via a public URL.

    - **enabled:** A boolean value that determines if public access is enabled (`true` or `false`).
    - **urlPrefix:** The URL prefix under which the service will be accessible.

- **network:** Defines the network settings for the deployment, including the exposed ports.

    - **ports:** A list of ports to expose.
    
        - **port:** The external port number that will be exposed.
        - **targetPort:** The internal port number the traffic will be directed to.

- **variables:** Defines any configurable parameters for the deployment. These are typically inputs or outputs such as:

    - **name:** The name of the variable.
    - **inputType:** The type of input, usually `InputTopic`, `OutputTopic`, `Secret`, or `FreeText`.
    - **description:** A brief explanation of what this variable does.
    - **required:** Indicates whether this variable must be provided (`true` or `false`).
    - **value:** The default or specified value for this variable.

- **disabled:** Set to `true` to prevent the deployment from being started while keeping its configuration intact for future updates or removal.

### Notes on Docker Image Deployments

- **Mutual Exclusivity:** You cannot specify both `application`/`version` and `image` in the same deployment definition. Choose one approach depending on your use case.
- **Image References:** Ensure your Docker image reference includes the repository and tag (e.g., `custom-repo/my-service:1.2.3`).
- **Compatibility:** Direct Docker image deployments provide greater flexibility, especially for non-standardized applications or third-party containers.

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

By understanding and effectively managing your `quix.yaml` file, you can maintain a robust and scalable data pipeline that meets the needs of your organization.
