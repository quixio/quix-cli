# Quix CLI Commands Summary

This quick reference guide lists common use cases for the Quix CLI with the corresponding commands. Use this guide to quickly find and execute the commands you need while developing Quix data pipelines locally.

## Core commands

| Use Case                                                                           | Command                |
| ---------------------------------------------------------------------------------- | ---------------------- |
| [Update application `.env` files from `quix.yaml`](./CLI%20Reference/init.md)            | `quix init --update`   |
| [Run applications with the variables from `.env`](./CLI%20Reference/run.md)              | `quix run`             |
| [Update pipeline configuration](./CLI%20Reference/pipeline/update.md)                    | `quix pipeline update` |
| [Bring pipeline up in Docker](./CLI%20Reference/pipeline/up.md)                          | `quix pipeline up`     |
| [Get a global status check of the CLI settings](./CLI%20Reference/status.md)             | `quix status`          |
| [Display the current status of the local pipeline](./CLI%20Reference/pipeline/status.md) | `quix pipeline status` |
| [Push local changes to Git and sync with Quix Cloud](./CLI%20Reference/pipeline/sync.md) | `quix pipeline sync`   |

## Initialization

| Use Case                                                                           | Command                    |
| ---------------------------------------------------------------------------------- | -------------------------- |
| [Initialize a new Quix project](./CLI%20Reference/init.md)                               | `quix init`                |
| [Initialize with DevContainer support](./CLI%20Reference/init.md)                        | `quix init --devcontainer` |
| [Initialize a project updating `.env` files from `quix.yaml`](./CLI%20Reference/init.md) | `quix init --update`       |

## Application Management

| Use Case                                                                   | Command              |
| -------------------------------------------------------------------------- | -------------------- |
| [Create a new application](./CLI%20Reference/apps/create.md)                     | `quix app add`       |
| [Edit the variables of an application](./CLI%20Reference/apps/edit.md)           | `quix app edit`      |
| [List applications in the project](./CLI%20Reference/apps/list.md)               | `quix app list`      |
| [Add a variable to an application](./CLI%20Reference/apps/variables/create.md)   | `quix app vars add`  |
| [Edit the variables of an application](./CLI%20Reference/apps/variables/edit.md) | `quix app vars edit` |

## Pipeline Management

| Use Case                                                                                   | Command                     |
| ------------------------------------------------------------------------------------------ | --------------------------- |
| [Update pipeline from current applications configurations](./CLI%20Reference/pipeline/update.md) | `quix pipeline update`      |
| [View pipeline graph](./CLI%20Reference/pipeline/view.md)                                        | `quix pipeline view`        |
| [Bring pipeline up in Docker](./CLI%20Reference/pipeline/up.md)                                  | `quix pipeline up`          |
| [Bring pipeline up in Docker and update the configuration](./CLI%20Reference/pipeline/up.md)     | `quix pipeline up --update` |
| [Bring pipeline down in Docker](./CLI%20Reference/pipeline/down.md)                              | `quix pipeline down`        |
| [Start a deployment in Docker](./CLI%20Reference/pipeline/start.md)                              | `quix pipeline start`       |
| [Stop a deployment in Docker](./CLI%20Reference/pipeline/stop.md)                                | `quix pipeline stop`        |
| [Read the logs from the local pipeline](./CLI%20Reference/pipeline/logs.md)                      | `quix pipeline logs`        |
| [Push local changes to Git and sync with Quix Cloud](./CLI%20Reference/pipeline/sync.md)         | `quix pipeline sync`        |

## Broker Management

| Use Case                                                                                   | Command                  |
| ------------------------------------------------------------------------------------------ | ------------------------ |
| [Start local pipeline broker](./CLI%20Reference/broker/up.md)                                    | `quix broker up`         |
| [Stop local pipeline broker](./CLI%20Reference/broker/down.md)                                   | `quix broker down`       |
| [List all the topics from your pipeline broker](./CLI%20Reference/broker/topics/list.md)         | `quix broker topic list` |
| [Read the content of a topic from your pipeline broker](./CLI%20Reference/broker/topics/read.md) | `quix broker topic read` |

## SDK Broker Configuration

| Use Case                                                                         | Command                                         |
| -------------------------------------------------------------------------------- | ----------------------------------------------- |
| [Set SDK broker to custom local address](./CLI%20Reference/sdk/broker/set.md)          | `quix sdk broker set <broker-address> --enable` |
| [Set SDK broker to Quix Cloud](./CLI%20Reference/sdk/broker/cloud.md)                  | `quix sdk broker cloud`                         |
| [Set SDK broker to default local configuration](./CLI%20Reference/sdk/broker/local.md) | `quix sdk broker local`                         |

## Running Applications

| Use Case                                                                    | Command                |
| --------------------------------------------------------------------------- | ---------------------- |
| [Run with the variables from `.env`](./CLI%20Reference/run.md)                    | `quix run`             |
| [Update the `.env` variables from the pipeline and run](./CLI%20Reference/run.md) | `quix run --update`    |
| [Run and stop deployed version of the application](./CLI%20Reference/run.md)      | `quix run --stop`      |
| [Run and intercept deployed version of the application](./CLI%20Reference/run.md) | `quix run --intercept` |