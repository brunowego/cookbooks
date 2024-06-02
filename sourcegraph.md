# Sourcegraph

**Keywords:** Code Search and Navigation

## Links

- [Code Repository](https://github.com/sourcegraph/sourcegraph)
- [Main Website](https://sourcegraph.com)
- [Docs](https://sourcegraph.com/docs)

## CLI

### Installation

#### Homebrew

```sh
brew tap sourcegraph/src-cli
brew install src-cli
```

### Commands

```sh
src -h
```

### Usage

```sh
#
src serve-git
# http://localhost:3434

#
src search 'r:github.com/vercel/next.js turbo'
```

### Tips

#### Visual Studio Code

```sh
#
code --install-extension sourcegraph.sourcegraph

#
jq '."recommendations" += ["sourcegraph.sourcegraph"]' "$HOME"/.vscode/extensions.json | sponge "$HOME"/.vscode/extensions.json
```

### Issues

#### TBD

```log
error: 429 Too Many Requests
```

<!--
https://github.com/sourcegraph/sourcegraph/issues/58283
-->

TODO
