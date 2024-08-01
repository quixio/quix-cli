# Quix CLI Commands Summary

This quick reference guide lists common use cases for the Quix CLI with the corresponding commands. Use this guide to quickly find and execute the commands you need.

## Core commands

| Use Case                                                                           | Command                |
| ---------------------------------------------------------------------------------- | ---------------------- |
| [Update application from `quix.yaml`](./Reference/init.md)                         | `quix init -update`    |
| [Run applications with the variables from `.env`](./Reference/run.md)              | `quix run`             |
| [Update pipeline configuration](./Reference/pipeline/update.md)                    | `quix pipeline update` |
| [Bring pipeline up in Docker](./Reference/pipeline/up.md)                          | `quix pipeline up`     |
| [Get a global status check of the CLI settings](./Reference/status.md)             | `quix status`          |
| [Display the current status of the local pipeline](./Reference/pipeline/status.md) | `quix pipeline status` |
| [Push local changes to Git and sync with Quix Cloud](./Reference/pipeline/sync.md) | `quix pipeline sync`   |

## Initialization

| Use Case                                                    | Command                    |
| ----------------------------------------------------------- | -------------------------- |
| [Initialize a new Quix project](./Reference/init.md)        | `quix init`                |
| [Initialize with DevContainer support](./Reference/init.md) | `quix init --devcontainer` |
| [Update application from `quix.yaml`](./Reference/init.md)  | `quix init --update`       |

## Application Management

| Use Case                                                                           | Command              |
| ---------------------------------------------------------------------------------- | -------------------- |
| [Create a new application](./Reference/applications/create.md)                     | `quix app add`       |
| [Edit the variables of an application](./Reference/applications/edit.md)           | `quix app edit`      |
| [List applications in the project](./Reference/applications/list.md)               | `quix app list`      |
| [Add a variable to an application](./Reference/applications/variables/create.md)   | `quix app vars add`  |
| [Edit the variables of an application](./Reference/applications/variables/edit.md) | `quix app vars edit` |

## Pipeline Management

| Use Case                                                                               | Command                     |
| -------------------------------------------------------------------------------------- | --------------------------- |
| [Update pipeline configuration](./Reference/pipeline/update.md)                        | `quix pipeline update`      |
| [View pipeline graph](./Reference/pipeline/view.md)                                    | `quix pipeline view`        |
| [Bring pipeline up in Docker](./Reference/pipeline/up.md)                              | `quix pipeline up`          |
| [Bring pipeline up in Docker and update the configuration](./Reference/pipeline/up.md) | `quix pipeline up --update` |
| [Bring pipeline down in Docker](./Reference/pipeline/down.md)                          | `quix pipeline down`        |
| [Start a deployment in Docker](./Reference/pipeline/start.md)                          | `quix pipeline start`       |
| [Stop a deployment in Docker](./Reference/pipeline/stop.md)                            | `quix pipeline stop`        |
| [Read the logs from the local pipeline](./Reference/pipeline/logs.md)                  | `quix pipeline logs`        |
| [Push local changes to Git and sync with Quix Cloud](./Reference/pipeline/sync.md)     | `quix pipeline sync`        |

## Broker Management

| Use Case                                                                       | Command                  |
| ------------------------------------------------------------------------------ | ------------------------ |
| [Start local pipeline broker](./Reference/sdk/broker/up.md)                    | `quix broker up`         |
| [Stop local pipeline broker](./Reference/sdk/broker/down.md)                   | `quix broker down`       |
| [List all the topics from your pipeline broker](./Reference/broker.md)         | `quix broker topic list` |
| [Read the content of a topic from your pipeline broker](./Reference/broker.md) | `quix broker topic read` |

## SDK Broker Configuration

| Use Case                                                                         | Command                                         |
| -------------------------------------------------------------------------------- | ----------------------------------------------- |
| [Set SDK broker to custom local address](./Reference/sdk/broker/set.md)          | `quix sdk broker set <broker-address> --enable` |
| [Set SDK broker to Quix Cloud](./Reference/sdk/broker/cloud.md)                  | `quix sdk broker cloud`                         |
| [Set SDK broker to default local configuration](./Reference/sdk/broker/local.md) | `quix sdk broker local`                         |

## Running Applications

| Use Case                                                  | Command                |
| --------------------------------------------------------- | ---------------------- |
| [Run with the variables from `.env`](./Reference/run.md)  | `quix run`             |
| [Update the `.env` variables and run](./Reference/run.md) | `quix run --update`    |
| [Run and stop deployed version](./Reference/run.md)       | `quix run --stop`      |
| [Run and intercept deployed version](./Reference/run.md)  | `quix run --intercept` |