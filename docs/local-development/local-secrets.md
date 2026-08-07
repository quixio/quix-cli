# Managing Secrets in Quix CLI

In any development environment, securing sensitive information like API tokens is essential. Quix CLI provides robust tools for managing these secrets within your data pipelines. This tutorial will walk you through the steps to securely add, update, and manage secrets in your Quix pipeline, ensuring that your sensitive data remains protected throughout the development process.

Before diving into the details, make sure you've set up your local environment correctly. If you haven't already, complete the [Quickstart](./cli-quickstart.md) to get Quix CLI up and running. For detailed instructions on setting up your local development environment, refer to our [Local Development](./local-debug.md) tutorial.

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

### Project Variables ###
# Project-scoped variables resolved from .env

### Groups ###
# Variables from variable groups, flattened into individual keys

### Untracked Variables ###
# Variables that are not tracked by Quix CLI
```

Placing `api_secret_token` under the "Secrets" section tells the CLI to move its value out of `.env` and into the `.secrets` file on the next pipeline update.

## Step 2: Update Your Pipeline Configuration

To integrate the new secret into your pipeline, run the following command:

```bash
quix pipeline update
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

After running the update command, verify that the `quix.yaml` file now references the secret through its `secretKey`. This key links to your secret value and is used by the relevant deployment:

```yaml title="quix.yaml" hl_lines="20 21"
# Quix Project Descriptor
# This file describes the data pipeline and configuration of resources of a Quix Project.

metadata:
  version: 2.0

# This section describes the Deployments of the data pipeline
deployments:
  - name: starter-source
    application: starter-source
    version: latest
    deploymentType: Service
    resources:
      limits:
        cpu: 200
        memory: 800
      replicas: 1
    variables:
      - name: api_secret_token
        inputType: Secret
        secretKey: api_secret_token_key
```

For a secret the CLI has just picked up from `.env`, the generated key is the variable name followed by `_key`.

!!! note "Two secret systems, two different files"

    Quix has two ways of declaring a sensitive value, and each reads its local value from a different file:

    | Declaration in `quix.yaml` / `app.yaml` | Local value file, keyed by |
    |---|---|
    | `inputType: Secret` with `secretKey` | `.secrets`, keyed by the secret key |
    | `inputType: ProjectVariable` with `variableKey` and `secret: true` | `.quix.yaml.variables`, keyed by the project variable key |
    | A `VariableGroup` member with `secret: true` | `.quix.yaml.variables`, keyed by the member key |

    `quix pipeline update` writes and preserves the `Secret` + `secretKey` shape shown above — it does not convert it into a `ProjectVariable`. Conversely, a secret project variable never gets its value from `.secrets`, and its value cannot be fetched from the cloud either (the API withholds it), so `.quix.yaml.variables` is the only place a local value for it can come from.

    See [YAML 1.0 and 2.0](../../quix-cloud/projects/yaml-2-0.md) and [Project variables](../../quix-cloud/deployments/project-variables.md) for the full model.

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
  version: 2.0

# This section describes the Deployments of the data pipeline
deployments:
  - name: starter-source
    application: starter-source
    version: latest
    deploymentType: Service
    resources:
      limits:
        cpu: 200
        memory: 800
      replicas: 1
    variables:
      - name: api_secret_token
        inputType: Secret
        secretKey: api_secret_token_key

  - name: other-deployment
    application: other-application
    version: latest
    deploymentType: Service
    resources:
      limits:
        cpu: 200
        memory: 800
      replicas: 1
    variables:
      - name: a_different_variable_name
        inputType: Secret
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
  starter_source:
    volumes:
      - /dev/null:/app/.env
    build:
      context: starter-source
      dockerfile: dockerfile
    environment:
      api_secret_token: 'SECRET-API-TOKEN-VALUE'
      Quix__Broker__Address: 'kafka_broker:9092'
  ...
```

The value comes straight from `.secrets` (and from `.quix.yaml.variables` for secret project variables and variable group members). The `/dev/null:/app/.env` volume masks `.env` inside the container, so what the containerized application sees is exactly this environment block.

## Step 6: Ensure Secrets Are Excluded from Version Control

It's crucial to ensure that all files containing secrets are excluded from version control. Running the `quix init` command will update your `.gitignore` file or create a new one if it doesn’t exist:

```bash
$ quix init                                           
✓ Created '.gitignore' with 6 entries: .env, compose.local.yaml, .secrets, .venv/, certificates/, .quix.yaml.variables
```

Your `.gitignore` file should now include entries to exclude sensitive files:

```plaintext title=".gitignore"
.env
compose.local.yaml
.secrets
.venv/
certificates/
.quix.yaml.variables
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

That single edit is enough for the new value to reach your application:

- `quix pipeline up` reads `.secrets` and writes the value into the container's `environment:` block, as shown in Step 5.
- `quix run` resolves secret values from `.secrets` when it spawns the process and injects them into its environment.

Refreshing your local files never wipes a secret value you typed into `.env` yourself, so that line keeps showing what you typed rather than the new value in `.secrets`:

```bash
quix init -u
```

```text
Updating application starter-source
✓ starter-source → starter-source
```

A `.env` generated from scratch — in a fresh clone, or after `quix init --reset-dotenv` — deliberately leaves secret values blank, so the sensitive value only ever lives in `.secrets`:

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
api_secret_token=

### Free Text ###
# Add any free text or comments here

### Project Variables ###
# Project-scoped variables resolved from .env

### Groups ###
# Variables from variable groups, flattened into individual keys

### Untracked Variables ###
# Variables that are not tracked by Quix CLI
```

!!! note "A blank secret line is expected"
    The same blanking applies to a `ProjectVariable` with `secret: true` and to secret variable group members. There is nothing to fix: `quix pipeline up` and `quix run` both take the value from `.secrets` or `.quix.yaml.variables`, not from `.env`. Type a value next to a blank secret line only when you want to change it — the next `quix pipeline update` moves it back into `.secrets`.
