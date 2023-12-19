# Quix CLI

A way of accessing quix features via CLI

## Installation
In order to install the CLI you can use dotnet gobal tools, or download the binaries directly from the release page.

### Installation via Dotet Global tools

```bash
dotnet tool install --global Quix.CLI --prerelease
```
   
### Installation using release binaries

1. Go to the release page and dowload the executable matching your OS/architecture.
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

