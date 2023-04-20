# Git Push

## Tips

### Set Upstream

```sh
git branch --set-upstream-to=origin/<branch> <branch>
```

## Issues

### Erase Credentials

```log
remote: Repository not found.
```

```sh
# OS X Keychain
echo -e 'host=github.com\nprotocol=https' | git credential-osxkeychain erase
```
