{% include-markdown './status.gen.md' %}
## How it Works

The `quix status` command is used to perform a global status check within the Quix CLI environment. It provides information about the current user's authentication status, context information, Git repository status, installed IDEs, and the presence of Docker and Git installations.

When the `quix status` command is executed:

1. It checks if the user is logged into Quix Cloud and displays the user's information if logged in.
3. It displays information about the current context, including name, URL, workspace ID, and local broker settings.
4. It attempts to find the root directory of the Git repository and displays it.
5. It checks for installed IDEs and reports any issues encountered.
6. It checks if Docker is installed and reports the result.
7. It checks if Git is installed and reports the result.

## Example usage

```bash
$ quix status
✗ Not logged in
  User:                 ! Not logged in to Quix Cloud
  Current context:      default (https://portal-api.platform.quix.io)
  Default environment:  ! Not set
  Local Broker:         ! Not set
  Local Broker enabled? ✗ No
✗ No git root detected
✓ VS Code installed
! PyCharm not installed
✓ Docker installed
✓ Git installed
```