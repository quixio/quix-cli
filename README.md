# Quix Command Line Interface (CLI)

> :warning: **WARNING: Internal Use Only & Work In Progress** :warning:
>
> This repository is intended for internal use only and is currently a work in progress. Features and documentation may be incomplete or subject to change. Please ensure you have the necessary permissions and understand the implications of using unreleased or unstable features.

The **Quix CLI** is a free tool that enables you to create, debug, and run streaming pipelines locally using Docker and Quix Streams. 

It also serves as a companion app for seamlessly managing and interacting with the features of your [Quix Cloud](https://quix.io/docs/quix-cloud/overview.md){target=_blank} account. While Quix Cloud offers a robust Frontend UI for a user-friendly experience, the CLI empowers you with efficiency and flexibility, allowing you to streamline your workflow and take control from the command line.

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

To install the Quix CLI, users have multiple methods depending on their operating system. Here's an expanded installation section including the main ways to install Quix CLI on Linux, macOS, and Windows.

### For macOS:

- **Install latest version:**

  ```bash
  curl -fsSL https://github.com/quixio/quix-cli/raw/main/install.sh | bash
  ```
  
- **Install with explicit version:**

  ```bash
  curl -fsSL https://github.com/quixio/quix-cli/raw/main/install.sh | bash -s -- -v={version}
  ```

### For Linux:

- **Install latest version:**

    ```bash
    curl -fsSL https://github.com/quixio/quix-cli/raw/main/install.sh | bash
    ```
    
- **Install with explicit version:**

    ```bash
    curl -fsSL https://github.com/quixio/quix-cli/raw/main/install.sh | bash -s -- -v={version}
    ```

### For Windows (PowerShell):

- **Install latest version:**

  ```powershell
  iwr https://github.com/quixio/quix-cli/raw/main/install.ps1 -useb | iex
  ```
  
- **Install with explicit version:**

  ```powershell
  $quixCliInstall = (iwr https://github.com/quixio/quix-cli/raw/main/install.ps1 -useb).Content; $version="{version}"; iex "$quixCliInstall"
  ```

#### Notes
- **Version Specification:** Replace `{version}` with the actual version number you intend to install (e.g., `1.2.3`). Omitting the `{version}` parameter will automatically default to installing the latest available version of Quix CLI. You have the option to install the latest version or specify a particular version according to your needs. 
To view and choose from all available versions, visit the [releases section](https://github.com/quixio/quix-cli/releases).
- **PATH Verification:** After installation, ensure that the directory where Quix CLI is installed is included in your system's PATH.

### Installation using release binaries

1. Go to the [release page](https://github.com/quixio/quix-cli/releases) and dowload the executable matching your OS/architecture.
2. Copy the executable to a location of your choice.
3. Add the location to your system's PATH.

## Usage

in order to get a list of available commands run: 
```bash
quix --help
```

### Login

You have 2 ways of logging in:

1. Interactive login
```bash
quix login
```
This will open the browser in order to complete the login.

2. PAT Token
```bash
quix login <patToken>
```

### Get Started

After setting up your context and logging in you will be able to access your Quix organisation. For more information visit [Quix Docs](https://quix.io/docs/quix-cli/overview.html).

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

