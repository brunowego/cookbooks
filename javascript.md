# JavaScript

<!--
https://app.pluralsight.com/paths/skill/javascript-core-language
https://www.linkedin.com/learning/javascript-patterns-2/javascript-design-patterns
https://www.linkedin.com/learning/learning-javascript-debugging-2/welcome
https://www.linkedin.com/learning/javascript-web-form-programming/building-modern-web-forms
-->

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
