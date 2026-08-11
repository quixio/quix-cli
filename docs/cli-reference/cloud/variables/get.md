{% include-markdown './get.gen.md' %}

## How It Works

The `quix cloud variables get` command reads a single key from the project variables store. It returns the value set for the selected environment, falling back to the variable's default when that environment has no value of its own.

A secret variable prints as `***`, because the API withholds its value. The command fails when the key does not exist in the project.

{% include-markdown '../utils/tip-use.md' %}

## Example Usage

```bash
$ quix cloud variables get shared.db.host
```

```text
shared.db.host = db-prod7.internal
  Description: Primary database hostname
```

Read the value from a specific environment:

```bash
$ quix cloud variables get shared.db.host my-workspace-id
```

A secret variable reports its type instead of its value:

```text
shared.db.password = ***
  Type: secret
```

{% include-markdown '../utils/note-output.md' %}
