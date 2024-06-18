{% include-markdown './sync.gen.md' %}

## How It Works

When you execute this command, it synchronizes your local pipeline to Quix Cloud. The command checks for any commits that exist locally but not remotely, remotely but not locally, and any differences in content between the branches.

If your local repository is in sync with the remote, the command will:

1. **Add Files**: Stages all the changes in your local repository.
2. **Commit Changes**: Commits the staged changes to the local repository.
3. **Push to Remote**: Pushes the committed changes to the remote repository.
4. **Sync Environment**: Synchronizes your environment in Quix Cloud.

!!! warning
    You need to be logged in to Quix Cloud for the environment sync to happen.

## Example usage

### Basic Synchronization

To synchronize your local pipeline to Quix Cloud without any additional options, use:

```bash
$ quix pipeline sync
```

!!! tip
    Using the `--update` option will perform the same actions as running [`quix pipeline update`](update.md) before syncing.

This command stages all changes in your local repository:

```text
Sending all changes to git ...
```

Then, it commits the staged changes:

```text
Executing commit ...
```

!!! tip "Add a Commit Message"
    Use the `--commit-message` option to include a meaningful commit message, making it easier to track changes:

    ```bash
    $ quix pipeline sync --commit-message "Initial deployment to Quix Cloud"
    ```

Finally, after it pushes the committed changes to the remote repository:

```text
✓ Sync completed
```

!!! Tip
    If you see the message:
    
    ```
    ✗ Your local repository is out of sync with the remote, please push your changes manually"
    ```

    - Your local branch has commits not yet pushed to the remote.
    - The remote branch has commits not yet pulled into your local repository.
    - There are uncommitted changes in your local files that differ from the remote.

    This indicates that your local and remote repositories are not aligned. You need to manually push your local changes to the remote to synchronize them.