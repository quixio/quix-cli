{% include-markdown './update.gen.md' %}

## How It Works

The `quix sdk broker update` command ensures that the `.env` files for all your applications are synchronized with the current SDK broker configuration. By updating these files, the command guarantees that every application is correctly configured to connect with the latest local broker settings.

Upon execution, the command scans each application's `.env` file and updates the SDK configuration to reflect the current local broker. If an application's `.env` file is already up-to-date, it remains unchanged, ensuring stability and consistency across your development environment.

!!! note
    The `quix sdk broker update` command specifically updates the broker configuration within the `.env` files. Other environment variables remain unchanged. To update all variables according to your `quix.yaml` configuration, use the [`quix init --update`](../../init.md) command.

## Example Usage

### Running the Update

To synchronize the broker configuration across all your applications, use:

```bash
quix sdk broker update
```

After running this command, you will see which applications were updated:

```bash
quix sdk broker update
! Application app1: 'path\to\app1\.env' was not updated
! Application app2: 'path\to\app2\.env' was not updated
✓ Application app3: 'path\to\app3\.env' was updated
```

### Before and After

Consider the following example of an `.env` file before running the update:

```dotenv title=".env before"
Quix__Broker__Address=localhost:9092
```

After running `quix sdk broker update`, the file is updated to reflect the new broker address:

```dotenv title=".env after"
Quix__Broker__Address=localhost:19092
```

This update ensures that all your applications are correctly pointing to the current broker, maintaining consistent and reliable operation across your local development environment.
