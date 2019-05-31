# Tips

## Homebrew

### Hide Dock Icon

```sh
vim /Applications/Spotify.app/Contents/Info.plist
```

Add before last `</dict>`:

```plist
<key>LSUIElement</key>
<true/>
```
