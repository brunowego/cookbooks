# Dev Container

**Keywords:** Full-featured Development Environment

## Links

- [Org. Repositories](https://github.com/devcontainers)
- [Main Website](https://containers.dev)
- Docs
  - [Developing inside a Container](https://code.visualstudio.com/docs/devcontainers/containers)
  - [Create a Dev Container](https://code.visualstudio.com/docs/devcontainers/create-dev-container)
  - [Specification](https://containers.dev/implementors/json_reference/)

## Related

- [GitHub Codespaces](/github/github-codespaces.md)

## CLI

### Links

- [Code Repository](https://github.com/devcontainers/cli)

### Installation

```sh
# Using NPM
npm install @devcontainers/cli -g

# Using Yarn
yarn global add @devcontainers/cli
```

### Configuration

```sh
#
mkdir ./.devcontainer

#
cat << EOF > ./.devcontainer/devcontainer.json
{
  "name": "Ubuntu",
  "image": "mcr.microsoft.com/devcontainers/base:jammy",
  "features": {
    "ghcr.io/devcontainers/features/git:1": {}
  },
  "settings": {
    "terminal.integrated.profiles.linux": {
      "zsh": {
        "path": "/bin/zsh"
      }
    },
    "terminal.integrated.defaultProfile.linux": "zsh"
  }
}
EOF
```

### Commands

```sh
devcontainer -h
```

<!-- ### Usage

```sh

``` -->

<!--
#
devcontainer build

#
devcontainer up

#
devcontainer features

#
devcontainer exec
-->

### Tips

#### Visual Studio Code

```sh
#
code --install-extension ms-vscode-remote.remote-containers

#
jq '."recommendations" += ["ms-vscode-remote.remote-containers"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

1. Press `Command (⌘)` + `Shift (⇧)` + `P`
2. Select `>Dev Containers: Add Dev Container Configuration Files...`
3. Type `Ubuntu` -> Select `jammy`
4. Select features -> OK
