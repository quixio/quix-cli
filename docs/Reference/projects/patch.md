{% include-markdown './patch.gen.md' %}

## How It Works

When the `quix project patch` command is executed:

1. The command invokes the project service to patch the project with the provided details.
2. If `--no-pull-request-url-pattern` is set, the pull request URL pattern is removed.
3. The command then outputs the updated project details using the specified output format.

## Example Usage

### Edit Project Name

To edit the name of a project:

```bash
$ quix project patch my-project-id --name "New Project Name"
```

### Set Custom Pull Request URL Pattern

To set a custom pull request URL pattern:

```bash
$ quix project patch my-project-id --pull-request-url-pattern "https://example.com/pr/{{sourceBranch}}/{{destinationBranch}}"
```

### Remove Custom Pull Request URL Pattern

To remove the custom pull request URL pattern:

```bash
$ quix project patch my-project-id --no-pull-request-url-pattern
```
