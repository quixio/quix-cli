{% include-markdown './use.gen.md' %}
## How It Works

The `quix use` command allows you to set a default workspace for the current context in your local development environment. This command streamlines your workflow by ensuring that the correct workspace is configured without the need for manual adjustments each time, reducing the risk of errors and increasing efficiency.

## Example Usage

### Interactive

When you pass any argument it will show you a list of environments:

``` bash
$ quix use
? Select project:

> Project A
  Project B
  Project C
```
Then you select the desired environment:

```bash
✓ Project: Project A
? Select environment:

> Environment X
  Environment Y
  Environment Z
  ✗ Cancel
  ← Back

✓ Project: Project A
✓ Environment: Environment X
✓ workspace-id: myorg-projecta-environmentx
```

### Non-Interactive

You can directly choose the environment that you want to use

```bash
quix use myorg-projecta-environmentx
```