{% include-markdown './update.gen.md' %}

## How It Works

The `quix update` command updates your Quix CLI to the latest available version, ensuring you have access to the newest features, fixes, and improvements. By default, it installs the latest stable version unless you specify a different version.

- **Latest Version:** Running `quix update` without any arguments updates your CLI to the latest stable version available.
- **Pre-Releases:** Use the `--pre-release` option to install the latest pre-release version, which may include experimental features.

To install a specific version, provide the version number directly:

```bash
quix update 1.2.3
```

To update to the latest pre-release version:

```bash
quix update --pre-release
```

### Where to Get Versions

Check the [Quix CLI Releases Page](https://github.com/quixio/quix-cli/releases) for all available versions, including both stable and pre-release options.