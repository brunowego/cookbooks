# markdownlint

## Links

- [Code Repository](https://github.com/DavidAnson/markdownlint)

<!-- markdownlint-disable MD010 -->
<!-- markdownlint-disable MD010 MD038 -->
<!-- markdownlint-disable first-line-heading -->

## Tips

### Visual Studio Code

```sh
#
code --install-extension DavidAnson.vscode-markdownlint

#
jq '."recommendations" += ["DavidAnson.vscode-markdownlint"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

<!-- ### Trunk

```yml
---
# ...
lint:
  ignore:
    - linters: [markdownlint]
      paths:
        - apps/landing/src/app/**/page.mdx
``` -->
