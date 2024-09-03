# Quix Command Line Interface (CLI)

The **Quix CLI** is a free tool that enables you to create, debug, and run streaming pipelines locally using Docker and Quix Streams. 

It also serves as a companion app for seamlessly managing and interacting with the features of your [Quix Cloud](https://quix.io/docs/quix-cloud/overview.md) account. While Quix Cloud offers a robust Frontend UI for a user-friendly experience, the CLI empowers you with efficiency and flexibility, allowing you to streamline your workflow and take control from the command line.

Quix CLI offers three groups of functionality:

1. Local commands
2. Cloud commands
3. Utility commands

Using the **local commands**, you can create your pipeline with predefined samples or write your code from scratch in Python, leveraging the power of Quix Streams. The CLI allows you to run these pipelines locally in Docker containers for testing and debugging. Optionally, you can deploy and synchronize your local pipeline to Quix Cloud.

Using the **cloud commands**, you can manage your Quix Cloud account from the command line. While Quix Cloud offers a robust frontend UI for a user-friendly experience, the CLI provides efficiency and flexibility, allowing you to streamline your workflow and take control from the command line. The CLI aims to offer feature parity with the Quix Cloud UI, although some Quix Cloud functionalities are only available through the CLI, such as:

* Permissions - Management of user permissions against the resources
* Auditing - Users auditing data

With the **utility commands**, you can perform tasks such as checking your status, updating the CLI, changing the CLI configuration, using interactive help, and managing contexts (the endpoint or environment the CLI is connected to).

For a quick tutorial of how to use the basic functionalities of Quix CLI, visit [CLI Quickstart](https://www.quix.io/).

For more information and detailed documentation, visit [quix.io](https://www.quix.io/docs).


## Installation of Quix CLI

To install the Quix CLI, users have multiple methods depending on their operating system.

### Script Installation

Here's an expanded installation section including the main ways to install Quix CLI on Linux, macOS, and Windows.

#### For macOS:

- **Install the latest version:**

  ```bash
  curl -fsSL https://github.com/quixio/quix-cli/raw/main/install.sh | bash
  ```
  
- **Install a specific version:**

  ```bash
  curl -fsSL https://github.com/quixio/quix-cli/raw/main/install.sh | bash -s -- -v={version}
  ```

#### For Linux:

- **Install the latest version:**

    ```bash
    curl -fsSL https://github.com/quixio/quix-cli/raw/main/install.sh | bash
    ```
    
- **Install a specific version:**

    ```bash
    curl -fsSL https://github.com/quixio/quix-cli/raw/main/install.sh | bash -s -- -v={version}
    ```

#### For Windows (PowerShell):

- **Install the latest version:**

  ```powershell
  iwr https://github.com/quixio/quix-cli/raw/main/install.ps1 -useb | iex
  ```
  
- **Install a specific version:**

  ```powershell
  $quixCliInstall = (iwr https://github.com/quixio/quix-cli/raw/main/install.ps1 -useb).Content; $version="{version}"; iex "$quixCliInstall"
  ```

> [!NOTE]
> For version specification, replace `{version}` with the actual version number you intend to install (e.g., `1.2.3`). Omitting the `{version}` parameter will automatically install the latest available version of Quix CLI. Ensure that the directory where Quix CLI is installed is included in your system's PATH.

### Installation using Release Binaries

1. Go to the [latest release page](https://github.com/quixio/quix-cli/releases/latest) and download the executable matching your OS/architecture.
2. Copy the executable to a location of your choice.
3. Add the location to your system's PATH.


## Usage

To get a complete list of available commands, run:  
```bash
quix --help
```

For an overview of all CLI commands, refer to the [Commands Summary](https://quix.io/docs/cli-commands-summary.md) in the documentation.

### Login

You have two ways to log in:

1. **Interactive Login**

   Run the following command to open your browser and complete the login:

   ```bash
   quix login
   ```

2. **Login with PAT (Personal Access Token)**

   Use your PAT token for login by running:

   ```bash
   quix login <patToken>
   ```

### Get Started

After setting up your context and logging in, you're ready to explore the capabilities of your Quix organization. Begin by visiting the [Quix CLI Documentation](https://quix.io/docs/quix-cli/overview.html) for a complete overview of all features, commands, and essential guides. To help you get started with the Quix CLI, we recommend the following resources:

#### Quickstart and Essentials

- **[Quickstart Guide](https://quix.io/docs/quix-cli/cli-quickstart.html):** Get up and running quickly with step-by-step instructions on setting up and using the Quix CLI.

#### Local Development

- **[Local Development](https://quix.io/docs/quix-cli/cli-local-debug.html):** Learn how to create, run, and debug streaming pipelines locally using Quix CLI.
- **[Local Secrets Management](https://quix.io/docs/quix-cli/cli-local-secrets.html):** Securely manage secrets during local development to ensure safe and effective pipeline management.

#### YAML Descriptors

- **[Pipeline YAML Descriptor](https://quix.io/docs/quix-cli/yaml-reference/pipeline-descriptor.html):** Detailed guidance on defining pipelines using the `quix.yaml` file.
- **[Application YAML Descriptor](https://quix.io/docs/quix-cli/yaml-reference/app-descriptor.html):** Instructions on configuring applications with the `app.yaml` descriptor.

### Using dedicated Quix clusters

The CLI will use the Serverless platform as the default context: `https://portal-api.platform.quix.io/`

For Dedicated or BYOC Quix clusters you can add your own context by running: 
```bash 
quix contexts add <name> <portalEndpoint>
```
 
Select it using the following command:
```bash
quix contexts use <name>
```

## Need help?

If you run into any problems, please create an [issue](https://github.com/quixio/quix-cli/issues) or ask in #quix-help in our [Quix Community on Slack](https://quix.io/slack-invite).  

## Community 👭

Join other software engineers in [The Stream](https://quix.io/slack-invite), an online community of people interested in all things data streaming. This is a space to both listen to and share learnings.

🙌  [Join our Slack community!](https://quix.io/slack-invite)

## Stay in touch 👋

You can follow us on [Twitter](https://twitter.com/quix_io) and [Linkedin](https://www.linkedin.com/company/70925173) where we share our latest tutorials, forthcoming community events and the occasional meme.  

If you have any questions or feedback - write to us at support@quix.io!

