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
~/.console-ninja/.bin
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
✘ next.js v13.4.20-canary.15 is not yet supported in the Community edition of Console Ninja.
```

TODO
