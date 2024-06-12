{% include-markdown './use.gen.md' %}

## How It Works

The `quix environment use` command allows you to set a default workspace for the current context in your local development environment. This command streamlines your workflow by ensuring that the correct workspace is configured without the need for manual adjustments each time, reducing the risk of errors and increasing efficiency.

## Exemple Usage

### Interactivity

When you pass any argument it will show you a list of environments:

``` bash
$ quix use
? Select project:

> EnvA
  EnvB
  EnvC
```
Then you select the desired environment:

```bash
$ quix use
✓ Project: quick start
✓ Environment: quick start - EnvA
✓ workspace-id: quix-quickstart-enva
```

### No Interactivity

You can directly choose the environment that you want to use

```bash
quix use quix-quickstart-enva
```