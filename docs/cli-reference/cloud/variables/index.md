{% include-markdown './index.gen.md' %}

## How It Works

A project variable is a named piece of configuration stored once per project and resolved per environment: the same key can hold a different value in Dev, Staging and Production, plus an optional default that every environment without a value of its own falls back to.

A pipeline consumes one by declaring a variable with `inputType: ProjectVariable`, naming the store key in `variableKey` in [`quix.yaml`](../../../yaml-reference/pipeline-descriptor.md) and in `defaultValue` in [`app.yaml`](../../../yaml-reference/app-descriptor.md). Only the key is committed to the repository, so changing a value is a [`set`](set.md) against the environment rather than a commit.

## Secret Variables

[`set --secret`](set.md) marks a variable as encrypted at rest. The API stops returning its value from that point on, so [`get`](get.md) and [`list`](list.md) print `***` in its place and no command reads it back — a forgotten value can only be replaced by setting it again.

## Local Development

`quix init` seeds every project-variable key your pipeline references into `.quix.yaml.variables` with an empty value. When you run the pipeline locally, a value present in that file is used instead of the one from the cloud store, and it is the only way to give a secret project variable a local value. See [Managing YAML variables](../../../local-development/local-yaml-variables.md).
