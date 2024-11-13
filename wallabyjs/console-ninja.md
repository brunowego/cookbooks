# Console Ninja

<!--
https://github.com/wallabyjs/console-ninja/issues/36
https://github.com/wallabyjs/console-ninja/issues/127
-->

## Links

- [Main Website](https://console-ninja.com)

## CLI

TODO

<!--
# Console Ninja
PATH=~/.console-ninja/.bin:$PATH
-->

## Tips

### Visual Studio Code

```sh
#
code --install-extension WallabyJs.console-ninja

#
jq '."recommendations" += ["WallabyJs.console-ninja"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

**Configuration:**

```sh
#
jq '."console-ninja.featureSet" |= "Community"' "$PWD"/.vscode/settings.json | sponge "$PWD"/.vscode/settings.json
```

## Issues

### TBD

```log
tail -f ~/.console-ninja/trace.log
```

### TBD

```log
✘ node v20.18.0, and next.js v15.0.1 are not yet supported in the Community edition of Console Ninja.
```

TODO

### TBD

```log
✘ next.js v13.4.20-canary.15 is not yet supported in the Community edition of Console Ninja.
```

TODO
