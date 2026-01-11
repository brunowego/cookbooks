# GitHub Authentication

<!--
https://github.com/settings/personal-access-tokens
https://github.com/settings/tokens
-->

## CLI

```sh
#
gh auth login
gh auth login --hostname enterprise.github.com
echo -n '<token>' | gh auth login --with-token

#
gh api user -q .login
gh config get user -h github.com

#
gh auth status

#
gh auth refresh

#
gh auth switch # Alternate account
gh auth switch --user <username>

#
gh auth logout
```
