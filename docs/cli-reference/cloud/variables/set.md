{% include-markdown './set.gen.md' %}

## How It Works

The `quix cloud variables set` command creates the key if the project does not have it yet and overwrites the value if it does. Without `--default` the value is written for a single environment; with `--default` it is written as the project-wide default that environments without their own value resolve to.

`--secret` encrypts the value at rest and stops the API returning it, so [`get`](get.md) and [`list`](list.md) show `***` afterwards. The flag is applied as given on every call: re-setting an existing secret without `--secret` turns it back into a plain value.

After writing, the command prints the project's full variable matrix, the same table [`list`](list.md) produces.

{% include-markdown '../utils/tip-use.md' %}

## Example Usage

Set the value for one environment:

```bash
$ quix cloud variables set shared.db.host db-prod7.internal --workspace-id my-workspace-id
```

```text
✓ Variable shared.db.host set successfully
```

Set the project-wide default without selecting an environment:

```bash
$ quix cloud variables set log.level info --default --repository-id my-repository-id
```

Store a secret:

```bash
$ quix cloud variables set shared.db.password s3cr3t --secret
```

!!! tip
    A secret project variable has no value the CLI can hand to a local run, so add the same key to `.quix.yaml.variables` with the value you want to use on your machine. See [Managing YAML variables](../../../local-development/local-yaml-variables.md).
