# Ignore Files

## Types

- `.atomignore`
- `.coffeelintignore`
- `.dockerignore`
- `.eslintignore`
- `.gitignore`
- `.hgignore`
- `.npmignore`
- `.prettierignore`
- `.slugignore`
- `.stylelintignore`
- `.vercelignore`
- `.vscodeignore`

## Tips

### Visual Studio Code

```sh
#
code --install-extension ldez.ignore-files

#
jq '."recommendations" += ["ldez.ignore-files"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
