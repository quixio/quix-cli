{% include-markdown './update.gen.md' %}

## How It Works

The `quix sdk broker update` command updates or creates the `.env` files of all your applications with the current SDK broker configuration. This ensures that every application is synchronized with the latest local broker settings.

When you run this command, it scans each application's `.env` file and updates the SDK configuration to match the current local broker configuration. If the `.env` file is already aligned with the current configuration, it will remain unchanged.

!!! note
    The `quix sdk broker update` command only updates the broker configuration in the `.env` files. All other variables remain unchanged. To synchronize all variables with your `quix.yaml` file, use the [`quix init --update`](../../init.md) command.

## Example Usage

### Running the Update

To update the broker configuration across all applications:

```bash
quix sdk broker update
```

The command will output which applications were updated:

```bash
quix sdk broker update
! Application app1: 'path\to\app1\.env' was not updated
! Application app2: 'path\to\app2\.env' was not updated
✓ Application app3: 'path\to\app3\.env' was updated
```

### Before and After

Before running the command, your `.env` file might look like this:

```dotenv title=".env before"
Quix__Broker__Address=localhost:9092
```

After running `quix sdk broker update`, it updates to:

```dotenv title=".env after"
Quix__Broker__Address=localhost:19092
```

This ensures all your applications are pointing to the correct broker, maintaining consistent operation across your local development environment.