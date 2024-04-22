# Million Lint

## Links

- [Main Website](https://million.dev/lint)

<!--
npx @million/lint -h
-->

## Library

### Installation

```sh
# Using pnpm
pnpm add @million/lint
```

### Tips

#### Visual Studio Code

```sh
#
code --install-extension million.million-lint

#
jq '."recommendations" += ["million.million-lint"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
