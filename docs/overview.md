---
title: Quix CLI
description: The Quix Command-Line Interface. A powerful command-line companion for developing locally, and deploying to local brokers, hosted brokers, or Quix Cloud.
---

# Quix Command-Line Interface (CLI)

The [Quix CLI](https://github.com/quixio/quix-cli){target=_blank} is a free tool that enables you to create, debug, and run streaming pipelines locally using Docker and Quix Streams. It also serves as a companion app for seamlessly managing and interacting with the features of your [Quix Cloud](../quix-cloud/overview.md){target=_blank} account.

Quix CLI offers three groups of functionality:

1. Local commands
2. Cloud commands
3. Utility commands

Using the **local commands**, you can create your pipeline with predefined samples or write your code from scratch in Python, leveraging the power of Quix Streams. The CLI allows you to run these pipelines locally in Docker containers for testing and debugging. Optionally, you can deploy and synchronize your local pipeline to Quix Cloud.

Using the **cloud commands**, you can manage your Quix Cloud account from the command line. While Quix Cloud offers a robust frontend UI for a user-friendly experience, the CLI provides efficiency and flexibility, allowing you to streamline your workflow and take control from the command line. The CLI aims to offer feature parity with the Quix Cloud UI, although some Quix Cloud functionalities are only available through the CLI, such as:

* Permissions - Management of user permissions against the resources
* Auditing - Users auditing data

With the **utility commands**, you can perform tasks such as checking your status, updating the CLI, changing the CLI configuration, using interactive help, and managing contexts (the endpoint or environment the CLI is connected to).

## Development status

!!! warning "Quix CLI is in development"

    Quix CLI is currently Beta, and is under development. This documentation may not be completely up to date, as the CLI is updated frequently, with new commands added, some commands removed, and changes to command syntax. Please use the Quix CLI built-in help for the very latest information.

## GitHub repository

View additional information about the CLI in the [GitHub repository](https://github.com/quixio/quix-cli){target=_blank}.

## Next step

* [Step through the CLI Quickstart](./cli-quickstart.md)
