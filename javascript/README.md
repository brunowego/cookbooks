# JavaScript

<!--
https://app.pluralsight.com/paths/skill/javascript-core-language
https://linkedin.com/learning/javascript-patterns-2/javascript-design-patterns
https://linkedin.com/learning/learning-javascript-debugging-2/welcome
https://linkedin.com/learning/javascript-web-form-programming/building-modern-web-forms
-->

## Links

- [Brief History of JavaScript](https://roadmap.sh/guides/history-of-javascript)

## References

- [ECMAScript](/ecmascript.md)

## Terms

- Immediately Invoked Function Expression (IIFE)

## Tips

### Debugger

```js
/* jshint -W087 */
debugger
```

### Visual Studio Code

```sh
#
code --install-extension HookyQR.beautify

#
jq '."recommendations" += ["HookyQR.beautify"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

**Configuration:**

```sh
jq '."[javascript]"."editor.defaultFormatter" |= "HookyQR.beautify"' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
```