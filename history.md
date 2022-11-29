# history

## CLI

### Usage

```sh
#
history
```

## Tips

### Backup

**Dependency:** [GitHub CLI](/github/README.md#cli)

```sh
# Backup
cat ~/.zsh_history | gh gist create - -f .zsh_history

# Restore
gh gist list
gh gist view <hash> > ~/.zsh_history

history -r
```
