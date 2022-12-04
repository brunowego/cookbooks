# Dev Container

**Keywords:** Full-featured Development Environment

## Links

- [Org. Repositories](https://github.com/devcontainers)
- [Main Website](https://containers.dev)

## Related

- [GitHub Codespaces](/github/github-codespaces.md)

## CLI

### Links

- [Code Repository](https://github.com/devcontainers/cli)

### Installation

#### NPM

```sh
npm install -g @devcontainers/cli
```

### Commands

```sh
devcontainer -h
```

### Usage

```sh
#
devcontainer build --workspace-folder ./

#
devcontainer up --workspace-folder ./
```

<!--
#
devcontainer features

#
devcontainer exec --workspace-folder ./
-->

### Tips

#### Visual Studio Code

```sh
#
code --install-extension ms-vscode-remote.remote-containers

#
jq '."recommendations" += ["ms-vscode-remote.remote-containers"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
