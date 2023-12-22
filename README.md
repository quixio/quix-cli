# Quix Command Line Interface (CLI)

Welcome to Quix CLI, your powerful command-line companion for seamlessly managing and interacting with the features of our Quix Cloud product. While Quix offers a robust Frontend UI for a user-friendly experience, the CLI empowers you with efficiency and flexibility, allowing you to streamline your workflow and take control from the command line.

## Key Features:

- **Effortless Control:** Execute commands effortlessly to manage various aspects of your Quix environment.
  
- **Script Automation:** Integrate Quix operations into your scripts for automated workflows and enhanced productivity.

- **Accessibility:** Access and manipulate Quix features directly from the command line, providing an alternative interface for users who prefer terminal-based interactions.

- **Scalability:** Seamlessly scale your Quix operations, whether you are working on a single instance or orchestrating tasks across multiple environments.

Below are the commands for installing the Quix CLI on Linux, macOS, and Windows. Each command is provided in its own code block for easy copy-pasting into a terminal or PowerShell. Alternatives for each operating system are provided, including commands with and without the version parameter.

### For Linux and macOS:

- **Using Curl with Version:**

  ```bash
  curl -fsSL https://github.com/quixio/quix-cli/raw/cli-install-scripts/install.sh | bash -s -- -v={version}
  ```

- **Using Curl without Version (installs latest):**

  ```bash
  curl -fsSL https://github.com/quixio/quix-cli/raw/cli-install-scripts/install.sh | bash
  ```

  Replace `{version}` with the desired version number in the command that includes the version parameter. If no version is specified, the script typically installs the latest version.

### For Windows:

- **Using PowerShell with Version:**

  ```powershell
  $quixCliInstall = (iwr https://github.com/quixio/quix-cli/raw/cli-install-scripts/install.ps1 -useb).Content; iex "$quixCliInstall {version}"
  ```

- **Using PowerShell without Version (installs latest):**

  ```powershell
  iwr https://github.com/quixio/quix-cli/raw/cli-install-scripts/install.ps1 -useb | iex
  ```

Replace `{version}` with the specific version you want to install in the command that includes the version parameter. If the version is omitted, it defaults to the latest available version.

#### Notes:

- **Permissions:** You may need to run these commands with elevated privileges. On Linux and macOS, use `sudo` if necessary. On Windows, run PowerShell as an Administrator.
- **Version Specification:** The `{version}` parameter is optional. If you know the specific version of Quix CLI you need, replace `{version}` with that version number (e.g., `1.2.3`). If you omit it, the script typically installs the latest version.
- **PATH Verification:** After installation, ensure that the directory where Quix CLI is installed is included in your system's PATH.

### Installation via Dotet Global tools

```bash
dotnet tool install --global Quix.CLI --prerelease
```
### Installation using release binaries

1. Go to the [release page](https://github.com/quixio/quix-cli/releases) and dowload the executable matching your OS/architecture.
2. Copy the executable to a location of your choice.
3. Add the location to your system's PATH.

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

