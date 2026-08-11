{% include-markdown './sync.gen.md' %}

## How It Works

Quix Cloud builds an environment from the pipeline stored in your **remote** repository, so `quix pipeline sync` deals with git first and only then asks the cloud to synchronize. What it does with git depends on `--push`:

- **Without `--push` (the default)** the command is interactive: it lists your uncommitted files and unpushed commits and asks whether to commit and whether to push. Declining either is allowed — the cloud sync then runs against whatever the remote already holds.
- **With `--push`** the command stages everything, commits it with `--commit-message` (defaulting to `Modified using Quix CLI`), and pushes, without prompting.

`--update` performs the work of [`quix pipeline update`](update.md) first, so new local applications and `.env` changes reach `quix.yaml` before the sync.

!!! warning
    You need to be logged in to Quix Cloud for the environment sync to happen.

## Outcomes

### Out of sync with the remote

With `--push`, the command fetches `origin` and compares your branch against it before touching anything. If the remote has commits you do not have locally, it refuses:

```text
✗ Your local repository is out of sync with the remote, please push your changes manually
```

Nothing is staged, committed or pushed, and no cloud call is made — your local work is exactly as you left it. The CLI never merges, so pull or rebase yourself, resolve any conflict, and run the command again.

### Already in sync

The environment already matches the repository head, which is what you see when an auto-syncing workspace has picked the push up on its own:

```text
! You are already in sync. Remember to push your changes before syncing. Use the --push option with this command to do so.
```

This is a success path, not an error.

### Accepted but still running

Quix Cloud took the request and is still applying it:

```text
! Sync accepted; synchronization is still in progress.
```

Follow it with [`quix cloud environments sync --status`](../cloud/environments/sync.md).

### Rejected by Quix Cloud

The server's reason is printed with the failure:

```text
✗ Sync failed: Exceeded project CPU quota. 100 millicores remaining of the 100 millicores project quota.
```

### Completed

```text
✓ Sync completed
```

## Example usage

### Interactive synchronization

```bash
$ quix pipeline sync
```

```text
! There are uncommitted changes:

Modified files:
  quix.yaml

? Do you want to commit the changes? Yes
? Commit message: Add hard-braking transformation

? Do you want to push the commits? Yes

✓ Sync completed
```

### Non-interactive synchronization

```bash
$ quix pipeline sync --push --commit-message "Add hard-braking transformation"
```

```text
Sending all changes to git ...
✓ Sync completed
```
