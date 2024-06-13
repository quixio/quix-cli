{% include-markdown './metrics.gen.md' %}

## How It Works

This command retrieves and displays real-time metrics for a specified deployment. This command helps you monitor the performance and resource usage of your deployments, providing insights into memory, CPU usage, and the last update times for each replica. Here’s an overview of how it functions:

## Example Usage

The `quix deployment metrics` command is used to retrieve and display real-time metrics for a specific deployment. Below are examples showcasing how to use this command:

### Fetching Metrics for a Specific Deployment

If you know the deployment ID, you can provide it directly as an argument:

```bash
$ quix deployment metrics my-deployment-id

Deployment metrics for my-deployment
Deployment ID: my-deployment-id

| Replica | Memory (MB) | CPU (millicores) | Last Update        |
|---------|--------------|------------------|--------------------|
| 0       | 256          | 500              | 2024-06-12 12:34:56|
| 1       | 128          | 250              | 2024-06-12 12:35:00|
```

### Interactive Deployment Selection

If no deployment ID is provided, the command will prompt you to select a workspace and deployment interactively:

```bash
$ quix deployment metrics
? Select project:
  petertestconfluentsource
  quick start
  QuixDemo
  QuixTets2
  Simon COWL
  Test Performance
  Test Secrets
  tim testing
> WEF
  ✗ Cancel

? Select deployment:
  deployment-1
  deployment-2
  deployment-3
> deployment-4
  ✗ Cancel

Deployment metrics for deployment-4
Deployment ID: deployment-4

| Replica | Memory (MB) | CPU (millicores) | Last Update        |
|---------|--------------|------------------|--------------------|
| 0       | 512          | 1000             | 2024-06-12 12:40:00|
| 1       | 256          | 500              | 2024-06-12 12:40:05|
```