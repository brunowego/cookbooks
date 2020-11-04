# JavaScript

## References

- [ECMAScript](/ecmascript.md)

## Tips

### Debugger

```js
/* jshint -W087 */
debugger;
```

### Visual Studio Code

```sh
code --install-extension HookyQR.beautify
```

```sh
jq '."[javascript]"."editor.defaultFormatter" |= "HookyQR.beautify"' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
```
