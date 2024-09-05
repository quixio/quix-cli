# Quix CLI Commands Summary

This quick reference guide lists common use cases for the Quix CLI with the corresponding commands. Use this guide to quickly find and execute the commands you need while developing Quix data pipelines locally.

## Core commands

| Use Case                                                                               | Command                    |
| -------------------------------------------------------------------------------------- | -------------------------- |
| [Update application `.env` files from `quix.yaml`](./cli-reference/init.md)            | `quix init --update`       |
| [Run applications with the variables from `.env`](./cli-reference/run.md)              | `quix run`                 |
| [Update pipeline configuration](./cli-reference/pipeline/update.md)                    | `quix pipeline update`     |
| [Bring pipeline up in Docker](./cli-reference/pipeline/up.md)                          | `quix pipeline up`         |
| [Get a global status check of the CLI settings](./cli-reference/status.md)             | `quix status`              |
| [Display the current status of the local pipeline](./cli-reference/pipeline/status.md) | `quix pipeline status`     |
| [Push local changes to Git and sync with Quix Cloud](./cli-reference/pipeline/sync.md) | `quix pipeline sync`       |
| [Read messages from a topic in your pipeline](./cli-reference/broker/topics/read.md)   | `quix broker topics read`  |
| [Write messages to a topic in your pipeline](./cli-reference/broker/topics/write.md)   | `quix broker topics write` |

## Initialization

| Use Case                                                                               | Command                    |
| -------------------------------------------------------------------------------------- | -------------------------- |
| [Initialize a new Quix project](./cli-reference/init.md)                               | `quix init`                |
| [Initialize with DevContainer support](./cli-reference/init.md)                        | `quix init --devcontainer` |
| [Initialize a project updating `.env` files from `quix.yaml`](./cli-reference/init.md) | `quix init --update`       |

## Application Management

| Use Case                                                                       | Command              |
| ------------------------------------------------------------------------------ | -------------------- |
| [Create a new application](./cli-reference/apps/create.md)                     | `quix app add`       |
| [Edit the variables of an application](./cli-reference/apps/edit.md)           | `quix app edit`      |
| [List applications in the project](./cli-reference/apps/list.md)               | `quix app list`      |
| [Add a variable to an application](./cli-reference/apps/variables/create.md)   | `quix app vars add`  |
| [Edit the variables of an application](./cli-reference/apps/variables/edit.md) | `quix app vars edit` |

## Pipeline Management

| Use Case                                                                                       | Command                     |
| ---------------------------------------------------------------------------------------------- | --------------------------- |
| [Update pipeline from current applications configurations](./cli-reference/pipeline/update.md) | `quix pipeline update`      |
| [View pipeline graph](./cli-reference/pipeline/view.md)                                        | `quix pipeline view`        |
| [Bring pipeline up in Docker](./cli-reference/pipeline/up.md)                                  | `quix pipeline up`          |
| [Bring pipeline up in Docker and update the configuration](./cli-reference/pipeline/up.md)     | `quix pipeline up --update` |
| [Bring pipeline down in Docker](./cli-reference/pipeline/down.md)                              | `quix pipeline down`        |
| [Start a deployment in Docker](./cli-reference/pipeline/start.md)                              | `quix pipeline start`       |
| [Stop a deployment in Docker](./cli-reference/pipeline/stop.md)                                | `quix pipeline stop`        |
| [Read the logs from the local pipeline](./cli-reference/pipeline/logs.md)                      | `quix pipeline logs`        |
| [Push local changes to Git and sync with Quix Cloud](./cli-reference/pipeline/sync.md)         | `quix pipeline sync`        |

## Broker Management

| Use Case                                                                                       | Command                    |
| ---------------------------------------------------------------------------------------------- | -------------------------- |
| [Start local pipeline broker](./cli-reference/broker/up.md)                                    | `quix broker up`           |
| [Stop local pipeline broker](./cli-reference/broker/down.md)                                   | `quix broker down`         |
| [List all the topics from your pipeline broker](./cli-reference/broker/topics/list.md)         | `quix broker topic list`   |
| [Read the content of a topic from your pipeline broker](./cli-reference/broker/topics/read.md) | `quix broker topic read`   |
| [Read messages from a topic in your pipeline](./cli-reference/broker/topics/read.md)           | `quix broker topics read`  |
| [Write messages to a topic in your pipeline](./cli-reference/broker/topics/write.md)           | `quix broker topics write` |

## SDK Broker Configuration

| Use Case                                                                             | Command                                         |
| ------------------------------------------------------------------------------------ | ----------------------------------------------- |
| [Set SDK broker to custom local address](./cli-reference/sdk/broker/set.md)          | `quix sdk broker set <broker-address> --enable` |
| [Set SDK broker to Quix Cloud](./cli-reference/sdk/broker/cloud.md)                  | `quix sdk broker cloud`                         |
| [Set SDK broker to default local configuration](./cli-reference/sdk/broker/local.md) | `quix sdk broker local`                         |

## Running Applications

| Use Case                                                                        | Command                |
| ------------------------------------------------------------------------------- | ---------------------- |
| [Run with the variables from `.env`](./cli-reference/run.md)                    | `quix run`             |
| [Update the `.env` variables from the pipeline and run](./cli-reference/run.md) | `quix run --update`    |
| [Run and stop deployed version of the application](./cli-reference/run.md)      | `quix run --stop`      |
| [Run and intercept deployed version of the application](./cli-reference/run.md) | `quix run --intercept` |