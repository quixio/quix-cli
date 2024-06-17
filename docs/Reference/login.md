{% include-markdown './login.gen.md' %}

## How It Works

The `quix auth login` command allows you to log in to your Quix account. This command provides two ways to authenticate: either through a Personal Access Token (PAT) or via an interactive login process.

- **Using a PAT**: If a PAT is provided, the command uses it to authenticate and set the PAT for future interactions.
- **Interactive Login**: If no PAT is provided, the command initiates an interactive login process where you can manually log in.

After successful authentication, a success message is displayed.

!!! tip
    Using a PAT for authentication can streamline your login process, especially in automated scripts. However, interactive login is useful for a quick one-time setup.

## Example Usage

### Using a Personal Access Token (PAT)

When you execute the `quix login` command with a PAT:

```bash
$ quix login my_personal_access_token
✓ Personal Access Token set successfully
```

### Interactive Login

When you execute the `quix login` command without any options:

```bash
$ quix login
If your browser did not open, please copy the following URL and paste it in your browser:
https://auth.quix.ai/activate?user_code=XVHF-MSMG
+----------------+
| Your code is:  |
| XVHF-MSMG      |
+----------------+

✓ Logged in successfully
```

In the interactive login process, a URL and a user code are provided. If your browser does not open automatically, you can manually navigate to the URL and enter the user code to complete the login process. This ensures a secure and straightforward login experience.

By following these steps, you can easily authenticate to your Quix account using either method.
