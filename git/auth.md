# Git Auth

## Issues

### Invalid Authentication

```log
remote: Invalid username or password.
fatal: Authentication failed for 'https://github.com/<owner>/<repo>.git'
```

```log
remote: Repository not found.
```

```sh
#
git config --get credential.helper

# OS X Keychain
echo -e 'host=github.com\nprotocol=https' | git credential-osxkeychain erase
```

### TBD

```log
Missing or invalid credentials.
```

TODO

<!--
git commit --author="Nome do Autor <email@example.com>" -m "Mensagem do commit"
-->

<!--
git shortlog -sne

git commit --amend --author="Novo Autor <email@example.com>"
-->
