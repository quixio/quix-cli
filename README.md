# Quix Command Line Interface (CLI)

The **Quix CLI** is a free tool designed to help you create, debug, and run streaming pipelines locally using Docker and Quix Streams. It also serves as a companion app for managing and interacting with your [Quix Cloud](https://quix.io/docs/quix-cloud/overview.md) account. While Quix Cloud offers a robust frontend UI for a user-friendly experience, the CLI provides efficiency and flexibility, allowing you to streamline your workflow and take control from the command line.

**Quix CLI** streamlines your workflow by offering three core categories of functionality:

1. **Local Commands**: Develop and test your streaming pipelines locally. Use predefined samples or write custom code in Python with Quix Streams. The CLI enables you to run these pipelines in Docker containers for seamless testing and debugging. When ready, you can deploy and synchronize your local pipelines directly to Quix Cloud.

2. **Cloud Commands**: Manage your Quix Cloud account with precision and efficiency right from the command line. While the Quix Cloud UI offers a comprehensive interface, the CLI accelerates your workflow, making complex tasks more accessible.

3. **Utility Commands**: Handle essential tasks such as checking your status, updating the CLI, adjusting configurations, accessing interactive help, and managing contexts (i.e., defining the endpoint or environment the CLI connects to).

To get started with Quix CLI, explore our [CLI Quickstart](https://quix.io/docs/quix-cli/cli-quickstart.html) guide for a step-by-step tutorial.

For in-depth details on all features and commands, visit the [Quix Documentation](https://www.quix.io/docs).

## Installation of Quix CLI

Quix CLI can be installed on various operating systems using different methods. Below are the instructions for Linux, macOS, and Windows.

### Script Installation

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
> For version specification, replace `{version}` with the actual version number you intend to install (e.g., `1.2.3`). Omitting the `{version}` parameter will install the latest available version of Quix CLI. Ensure that the directory where Quix CLI is installed is included in your system's PATH.

### Installation using Release Binaries

1. Visit the [latest release page](https://github.com/quixio/quix-cli/releases/latest) and download the executable matching your OS/architecture.
2. Copy the executable to a location of your choice.
3. Add that location to your system's PATH.

## Usage

To view a complete list of available commands, run:  
```bash
quix --help
```

For an overview of all CLI commands, refer to the [Commands Summary](https://quix.io/docs/cli-commands-summary.md) in the documentation.

### Login

You can log in using one of two methods:

1. **Interactive Login**

   Run the following command to open your browser and complete the login:

   ```bash
   quix login
   ```

2. **Login with PAT (Personal Access Token)**

   Log in using your PAT token by running:

   ```bash
   quix login <patToken>
   ```

### Get Started

After setting up your context and logging in, you're ready to explore the capabilities of your Quix organization. Begin by visiting the [Quix CLI Documentation](https://quix.io/docs/quix-cli/overview.html) for a comprehensive overview of all features, commands, and essential guides. To help you get started, we recommend the following resources:

#### Quickstart and Essentials

- **[Quickstart Guide](https://quix.io/docs/quix-cli/cli-quickstart.html):** Follow these step-by-step instructions to quickly set up and start using the Quix CLI.

- **[Commands Summary](https://quix.io/docs/quix-cli/cli-commands-summary.html):** Use this quick reference guide to find and execute the most common Quix CLI commands for developing and managing your data pipelines. This guide is essential for efficiently navigating the CLI during your initial setup and beyond.

#### Local Development

- **[Local Development](https://quix.io/docs/quix-cli/cli-local-debug.html):** Discover how to create, run, and debug streaming pipelines locally with the Quix CLI.
  
- **[Local Secrets Management](https://quix.io/docs/quix-cli/cli-local-secrets.html):** Learn to securely manage secrets during local development to ensure safe and effective pipeline management.

#### YAML Descriptors

- **[Pipeline YAML Descriptor](https://quix.io/docs/quix-cli/yaml-reference/pipeline-descriptor.html):** Get detailed guidance on defining pipelines using the `quix.yaml` file.
  
- **[Application YAML Descriptor](https://quix.io/docs/quix-cli/yaml-reference/app-descriptor.html):** Instructions for configuring applications with the `app.yaml` descriptor.

### Using dedicated Quix clusters

The CLI defaults to using the Serverless platform as its context: `https://portal-api.platform.quix.io/`

For Dedicated or BYOC Quix clusters, you can add your own context by running:

```bash 
quix contexts add <name> <portalEndpoint>
```

Select it using the following command:
```bash
quix contexts use <name>
```

## Need Help?

If you encounter any issues, please create an [issue](https://github.com/quixio/quix-cli/issues) or ask for assistance in #quix-help in our [Quix Community on Slack](https://quix.io/slack-invite).

## Community 👭

Join other software engineers in [The Stream](https://quix.io/slack-invite), an online community focused on data streaming. This is a space to share and gain knowledge.

🙌  [Join our Slack community!](https://quix.io/slack-invite)

## Stay in Touch 👋

Follow us on [Twitter](https://twitter.com/quix_io) and [LinkedIn](https://www.linkedin.com/company/70925173) to stay updated with our latest tutorials, community events, and more.

For any questions or feedback, feel free to contact us at support@quix.io.