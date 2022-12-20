# iCloud

## Links

- [Main Website](https://icloud.com)

## Tips

### Shortcut Link

```sh
ln -s "$HOME"/Library/Mobile\ Documents/com\~apple\~CloudDocs/Customers "$HOME"/Customers

ln -s "$HOME"/Library/Mobile\ Documents/com\~apple\~CloudDocs/Workspace "$HOME"/Workspace
```

## Issues

### Case-insensitive Filesystem

```log
You can’t copy “README.md” because it has the same name as another item on the destination volume, and that volume doesn’t distinguish between upper- and lowercase letters in filenames.
```

TODO

### Bird Process

```sh
#
brctl log -w --shorten
```
