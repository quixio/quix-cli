# Managing Secrets in Quix CLI

In any development environment, securing sensitive information like API tokens is essential. Quix CLI provides robust tools for managing these secrets within your data pipelines. This tutorial will walk you through the steps to securely add, update, and manage secrets in your Quix pipeline, ensuring that your sensitive data remains protected throughout the development process.

Before diving into the details, make sure you've set up your local environment correctly. If you haven't already, complete the [Quickstart](./cli-quickstart.md) to get Quix CLI up and running. For detailed instructions on setting up your local development environment, refer to our [Local Development](./cli-local-debug.md) tutorial.

## Step 1: Add the Secret to Your `.env` File

Start by adding your secret as an environment variable in the `.env` file. Here’s how to securely store an API token:

```dotenv title=".env" hl_lines="23"
# ======================================================
#               Quix CLI guidelines
# ======================================================
# To update the quix.yaml from this .env file, use:
#  quix pipeline update
#
# To update the .env file from the quix.yaml file, use:
#  quix init --update
# ======================================================

### Quix SDK Configuration ###
# Configuration settings for QuixStreams
Quix__Broker__Address=localhost:19092

### Input Topics ###
# Define the input topics used by the application

### Output Topics ###
# Define the output topics used by the application

### Secrets ###
# Sensitive information such as API keys and passwords
api_secret_token=SECRET-API-TOKEN-VALUE

### Free Text ###
# Add any free text or comments here

### Untracked Variables ###
# Variables that are not tracked by Quix CLI
```

Adding the `api_secret_token` under the "Secrets" section ensures it is handled securely by the Quix CLI.

## Step 2: Update Your Pipeline Configuration

To integrate the new secret into your pipeline, run the following command:

```bash
$ quix pipeline update
```

This command updates your pipeline configuration, incorporating the secret into the `quix.yaml` file and generating or updating the `.secrets` file:

```text
Updating deployments of application starter-source
✓ starter-source → starter-source 
✓ 'quix.yaml' was updated

Updating secrets ...
✓ '.secrets' was updated

✓ The pipeline view was updated
```

## Step 3: Verify the `quix.yaml` and `.secrets` Files

After running the update command, verify that the `quix.yaml` file now includes the secret key. The key is linked to your secret and referenced by the relevant deployment:

```yaml title="quix.yaml" hl_lines="21"
# Quix Project Descriptor
# This file describes the data pipeline and configuration of resources of a Quix Project.

metadata:
  version: 1.0

# This section describes the Deployments of the data pipeline
deployments:
  - name: starter-source
    application: starter-source
    version: latest
    deploymentType: Service
    resources:
      cpu: 200
      memory: 800
      replicas: 1
    variables:
      - name: api_secret_token
        inputType: Secret
        required: false
        secretKey: api_secret_token_key
```

Additionally, a `.secrets` file is generated or updated with the actual value associated with the secret key:

```dotenv title=".secrets" hl_lines="7"
### Local Pipeline Secrets ###
#
# Stores secret values for local pipeline testing.
# Secrets here are referenced in quix.yaml using secret keys.
#
# Keep this file secure and out of version control.
api_secret_token_key=SECRET-API-TOKEN-VALUE
```

!!! tip
    The `.secrets` file stores sensitive data securely for local development, keeping it separate from your application code.

## Step 4: Reuse Secrets Across Multiple Deployments

To use the same secret across multiple deployments, reference the same `secretKey` in different deployments within your `quix.yaml` file. For example:

```yaml title="quix.yaml" hl_lines="21 35"
# Quix Project Descriptor
# This file describes the data pipeline and configuration of resources of a Quix Project.

metadata:
  version: 1.0

# This section describes the Deployments of the data pipeline
deployments:
  - name: starter-source
    application: starter-source
    version: latest
    deploymentType: Service
    resources:
      cpu: 200
      memory: 800
      replicas: 1
    variables:
      - name: api_secret_token
        inputType: Secret
        required: false
        secretKey: api_secret_token_key

  - name: other-deployment
    application: other-application
    version: latest
    deploymentType: Service
    resources:
      cpu: 200
      memory: 800
      replicas: 1
    variables:
      - name: a_different_variable_name
        inputType: Secret
        required: false
        secretKey: api_secret_token_key
```

In this setup, both `starter-source` and `other-deployment` use the same secret key (`api_secret_token_key`), even though they reference it with different variable names (`api_secret_token` and `a_different_variable_name`). This ensures consistency across deployments and reduces redundancy.

!!! tip
    Reusing secret keys across deployments simplifies management and ensures all services have access to the necessary secrets.

## Step 5: Deploying Secrets Locally

When deploying your pipeline locally, it's crucial to verify that your secrets are correctly included in the configuration. The `quix pipeline up` command generates a `compose.local.yaml` file that outlines how your services are configured, including the injection of secrets.

To ensure your secrets are properly handled, run the following command:

```bash
$ quix pipeline up --dry-run
```

This generates the `compose.local.yaml` file without starting any containers, allowing you to inspect how secrets are managed:

```text
  Generating 'compose.local.yaml'
  Generating deployment starter-source
✓ Generated deployment starter-source
✓ Generated 'compose.local.yaml'
```

In the `compose.local.yaml` file, your secrets and environment variables will be included in the environment section for each service:

```yaml title="compose.local.yaml" hl_lines="9"
services:
  starter-source:
    volumes:
      - /dev/null:/app/.env
    build:
      context: starter-source
      dockerfile: dockerfile
    environment:
      api_secret_token: SECRET-API-TOKEN-VALUE
      Quix__Broker__Address: kafka-broker:9092
  ...
```

By reviewing this file, you can confirm that your secrets are securely injected and your services are configured correctly before proceeding with a full deployment. This step ensures that your local deployment mirrors the intended configuration, including the correct handling of sensitive information.

## Step 6: Ensure Secrets Are Excluded from Version Control

It's crucial to ensure that all files containing secrets are excluded from version control. Running the `quix init` command will update your `.gitignore` file or create a new one if it doesn’t exist:

```bash
$ quix init                                           
✓ Created '.gitignore' with 5 entries: .env, compose.local.yaml, .secrets, .venv/, certificates/
```

Your `.gitignore` file should now include entries to exclude sensitive files:

```plaintext title=".gitignore"
.env
compose.local.yaml
.secrets
.venv/
certificates/
```

!!! warning
    Always ensure that your `.secrets` and other sensitive files are excluded from version control. This is essential for maintaining the security of your pipeline.

## Step 7: Update Local Secrets

If you need to update the value of a secret locally, modify the `.secrets` file directly:

```dotenv title=".secrets" hl_lines="7"
### Local Pipeline Secrets ###
#
# Stores secret values for local pipeline testing.
# Secrets here are referenced in quix.yaml using secret keys.
#
# Keep this file secure and out of version control.
api_secret_token_key=NEW-SECRET
```

To synchronize the updated secret with your `.env` file, run:

```bash
quix init -u
```

The output will confirm the update:

```text
Updating application starter-source
✓ starter-source → starter-source
```

Your `.env` file will now reflect the updated secret:

```dotenv title=".env" hl_lines="23"
# ======================================================
#               Quix CLI guidelines
# ======================================================
# To update the quix.yaml from this .env file, use:
#  quix pipeline update
#
# To update the .env file from the quix.yaml file, use:
#  quix init --update
# ======================================================

### Quix SDK Configuration ###
# Configuration settings for QuixStreams
Quix__Broker__Address=localhost:19092

### Input Topics ###
# Define the input topics used by the application

### Output Topics ###
# Define the output topics used by the application

### Secrets ###
# Sensitive information such as API keys and passwords
api_secret_token=NEW-SECRET

### Free Text ###
# Add any free text or comments here

### Untracked Variables ###
# Variables that are not tracked by Quix CLI
```