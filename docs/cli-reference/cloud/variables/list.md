{% include-markdown './list.gen.md' %}

## How It Works

The `quix cloud variables list` command prints every project variable as a matrix: one row per key, one column per environment in the project, plus the default value column. A cell is empty when that environment has no value of its own and therefore resolves to the default.

Secret variables are marked in the `Secret` column and their values are shown as `***` — the API never returns them. The mark is per key, not per value: one secret value anywhere under a key marks the whole row `Yes` and prints `***` in every cell of it, including environments whose value is not secret.

{% include-markdown '../utils/tip-use.md' %}

## Example Usage

```bash
$ quix cloud variables list
```

```text
Project Quickstart variables:

  Variable key       | Secret | Default value | Dev              | Prod
 --------------------|--------|---------------|------------------|------------------
  shared.db.host     | No     | localhost     | db-dev7.internal | db-prod7.internal
  shared.db.password | Yes    | ***           | ***              | ***
  log.level          | No     | info          |                  | warning
```

Pass an environment explicitly instead of relying on [`quix use`](../../use.md):

```bash
$ quix cloud variables list my-workspace-id
```

{% include-markdown '../utils/note-output.md' %}
