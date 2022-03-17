# PostCSS

## Links

- [Code Repository](https://github.com/postcss/postcss)
- [Main Website](https://postcss.org/)

<!--
link(rel='stylesheet', media='(width: 320px)', href='/assets/styles/app-xs.css')
link(rel='stylesheet', media='(min-width: 321px) and (max-width: 480px)', href='/assets/styles/app-sm.css')
link(rel='stylesheet', media='(min-width: 481px) and (max-width: 749px)', href='/assets/styles/app-md.css')
link(rel='stylesheet', media='(min-width: 750px) and (max-width: 991px)', href='/assets/styles/app-md.css')
link(rel='stylesheet', media='(min-width: 992px) and (max-width: 1169px)', href='/assets/styles/app-lg.css')
link(rel='stylesheet', media='(min-width: 1170px)', href='/assets/styles/app-xl.css')

postcss-combine-media-query
postcss-extract-media-query
-->

<!-- ## Configuration

```sh
cat << EOF > ./.postcssrc.json
{
  "plugins": {
    "autoprefixer": {}
  }
}
EOF
``` -->

## Tips

### Visual Studio Code

```sh
#
code --install-extension csstools.postcss

#
jq '."recommendations" += ["csstools.postcss"]' "$PWD/.vscode/extensions.json" | sponge "$PWD/.vscode/extensions.json"
```

<!-- ####

**Dependencies:** [Emmet](/emmet.md)

```sh
#
jq '."emmet.includeLanguages".postcss |= "css"' "$PWD/.vscode/settings.json" | \
  sponge "$PWD/.vscode/settings.json"

jq '."emmet.syntaxProfiles".postcss |= "css"' "$PWD/.vscode/settings.json" | \
  sponge "$PWD/.vscode/settings.json"
``` -->
