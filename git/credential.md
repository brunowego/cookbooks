# Git Credential

<!--
https://docs.github.com/en/get-started/getting-started-with-git/updating-credentials-from-the-macos-keychain
-->

## Configuration

```sh
#
git config --get credential.helper

#
git config --global credential.helper 'store'
git config --global credential.helper 'cache'
# Darwin
git config --global credential.helper 'osxkeychain'
# Windows
git config --global credential.helper 'manager-core'

git config --global credential.credentialStore gpg
```

## Issues

### TBD

```log
! [remote rejected] chore/context -> chore/context (refusing to allow a Personal Access Token to create or update workflow `.github/workflows/name.yml` without `workflow` scope)
```

TODO
