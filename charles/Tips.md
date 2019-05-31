# Tips

## Add CLI

```sh
ln -s /Applications/Charles.app/Contents/MacOS/Charles /usr/local/bin/charles
```

## Dock

### Hidden

```sh
/usr/libexec/PlistBuddy -c 'Add :LSUIElement bool true' /Applications/Charles.app/Contents/Info.plist
```

### Show

```sh
/usr/libexec/PlistBuddy -c 'Delete :LSUIElement' /Applications/Charles.app/Contents/Info.plist
```
