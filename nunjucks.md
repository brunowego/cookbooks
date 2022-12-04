# Nunjucks

## CLI

### Tips

#### Visual Studio Code

```sh
#
code --install-extension ronnidc.nunjucks

#
jq '."recommendations" += ["ronnidc.nunjucks"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

<!-- **Configuration:** -->

<!-- ```sh
#
jq '."files.associations"."*.html" |= "njk"' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json

#
jq '."emmet.includeLanguages"."njk" |= "html"' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
``` -->
