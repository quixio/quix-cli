{% include-markdown './delete.gen.md' %}

## How It Works

The `quix cloud variables delete` command removes one stored value: by default the one belonging to the selected environment, with `--default` the project-wide default, and with `--delete-all-values` every value of that key across all environments and the default together.

Removing an environment's value does not remove the variable — the environment falls back to the default from then on. When nothing matches, the command reports that nothing was changed instead of failing.

Either way it then prints the project's full variable matrix, the same table [`list`](list.md) produces, so you can see what the deletion left behind.

{% include-markdown '../utils/tip-use.md' %}

## Example Usage

Remove a value from one environment:

```bash
$ quix cloud variables delete log.level --workspace-id my-workspace-id
```

```text
✓ Variable log.level removed successfully
```

Remove the key from the whole project:

```bash
$ quix cloud variables delete log.level --delete-all-values
```

When the key has no value in the selected environment:

```text
! Nothing was changed
! Variable log.level does not exist in the selected environment
```
