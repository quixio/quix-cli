# Quix Command Line Interface (CLI)

Welcome to Quix CLI, your powerful command-line companion for seamlessly managing and interacting with the features of our Quix Cloud product. While Quix offers a robust Frontend UI for a user-friendly experience, the CLI empowers you with efficiency and flexibility, allowing you to streamline your workflow and take control from the command line.

- **Effortless Control:** Execute commands effortlessly to manage various aspects of your Quix environment.
  
- **Script Automation:** Integrate Quix operations into your scripts for automated workflows and enhanced productivity.

- **Accessibility:** Access and manipulate Quix features directly from the command line, providing an alternative interface for users who prefer terminal-based interactions.

- **Scalability:** Seamlessly scale your Quix operations, whether you are working on a single instance or orchestrating tasks across multiple environments.

For more information and detailed documentation, visit [quix.io](https://www.quix.io/).

## Installation of Quix CLI

To install the Quix CLI, users have multiple methods depending on their operating system. Here's an expanded installation section including the main ways to install Quix CLI on Linux, macOS, and Windows.

**Note:** Replace `{version}` with the actual version number you intend to install (e.g., `1.2.3`). Omitting the `{version}` parameter will automatically default to installing the latest available version of Quix CLI.

### For Linux and macOS:

Install the Quix CLI using the Curl commands in your terminal. Choose between installing the latest version or specifying a specific version. For installations that modify system-wide settings, elevated privileges may be required.

- **Install Latest Version without Specifying Version:**

  ```bash
    curl -fsSL https://github.com/quixio/quix-cli/raw/cli-install-scripts/install.sh | bash
  ```
  
- **Install Specific Version:**

  ```bash
    curl -fsSL https://github.com/quixio/quix-cli/raw/cli-install-scripts/install.sh | bash -s -- -v={version}
  ```
  
<details>
  <summary>
    Elevated Privileges Instructions
  </summary>
  If your user account lacks the necessary permissions to install software globally, you might need to execute the commands with elevated privileges. Use `sudo` to grant these privileges as shown:

  - **Install Latest Version with Elevated Privileges:**

    ```bash
    curl -fsSL https://github.com/quixio/quix-cli/raw/cli-install-scripts/install.sh | sudo bash
    ```
    
  - **Install Specific Version with Elevated Privileges:**

    ```bash
    curl -fsSL https://github.com/quixio/quix-cli/raw/cli-install-scripts/install.sh | sudo bash -s -- -v={version}
    ```
</details>

### For Windows (PowerShell):

- **Using PowerShell without Version (installs latest):**

  ```powershell
  iwr https://github.com/quixio/quix-cli/raw/cli-install-scripts/install.ps1 -useb | iex
  ```
  
- **Using PowerShell with Version:**

  ```powershell
  $quixCliInstall = (iwr https://github.com/quixio/quix-cli/raw/cli-install-scripts/install.ps1 -useb).Content; iex "$quixCliInstall {version}"
  ```

#### Notes:

- **Permissions:** You may need to run these commands with elevated privileges. On Linux and macOS, use `sudo` if necessary. On Windows, run PowerShell as an Administrator.
- **Version Specification:** The `{version}` parameter is optional. If you know the specific version of Quix CLI you need, replace `{version}` with that version number (e.g., `1.2.3`). If you omit it, the script typically installs the latest version.
- **PATH Verification:** After installation, ensure that the directory where Quix CLI is installed is included in your system's PATH.

### Installation using release binaries

1. Go to the [release page](https://github.com/quixio/quix-cli/releases) and dowload the executable matching your OS/architecture.
2. Copy the executable to a location of your choice.
3. Add the location to your system's PATH.

### Installation via Dotet Global tools

```bash
dotnet tool install --global Quix.CLI --prerelease
```

## Usage

in order to get a list of available commands run: 
```bash
quix --help
```

### Context

The CLI will use the Serverless platform as the default context.
For Dedicated or Byoc you can add your own context by running: 
```bash 
quix context add <contextName>
```
 
Select it using the following command:
```bash
quix context use <contextName>
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

After setting up your context and logging in you will be able to run the remaining commands, ex:

#### List Repositories

```bash
quix get repositories
```

#### List Environments

```bash
quix get environments
```

## Need help?

If you run into any problems, please create an [issue](https://github.com/quixio/quix-cli/issues) or ask in #quix-help in our [Quix Community on Slack](https://quix.io/slack-invite).  

## Community 👭

Join other software engineers in [The Stream](https://quix.io/slack-invite), an online community of people interested in all things data streaming. This is a space to both listen to and share learnings.

🙌  [Join our Slack community!](https://quix.io/slack-invite)

## Stay in touch 👋

You can follow us on [Twitter](https://twitter.com/quix_io) and [Linkedin](https://www.linkedin.com/company/70925173) where we share our latest tutorials, forthcoming community events and the occasional meme.  

If you have any questions or feedback - write to us at support@quix.io!

