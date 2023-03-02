# direnv

<!--
https://github.com/hyperupcall/autoenv
https://github.com/untitaker/quickenv
https://github.com/Shopify/shadowenv
-->

**Keywords:** Auto-load Environment Variables

## Links

- [Code Repository](https://github.com/direnv/direnv)
- [Main Website](https://direnv.net)

## CLI

### Installation

#### Homebrew

```sh
brew install direnv
```

#### APT

```sh
sudo apt update
sudo apt -y install direnv
```

#### YUM

```sh
yum check-update
sudo yum -y install direnv
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# direnv
eval "$(direnv hook zsh)" # bash
```

```sh
source ~/.zshrc
```

### Configuration

```sh
#
mkdir ~/.config/direnv

#
cat << EOF > ~/.config/direnv/direnv.toml
[global]
load_dotenv = true
strict_env = true

[whitelist]
prefix = ["/absolute/path/to/folder"]
EOF

#
echo '/.envrc' >> ~/.gitignore_global
```

### Commands

```sh
direnv help
```

### Usage

```sh
#
direnv status

#
direnv allow ./
direnv permit ./
direnv grant ./

#
direnv block ./
direnv deny ./
direnv revoke ./

#
direnv edit

#
direnv prune

#
direnv reload
```

<!--
direnv fetchurl <url>
-->

### Tips

#### Project Environment Variables

```sh
#
cat << EOF > ./.envrc
export <ENV>=<VALUE>
EOF

#
echo '<ENV>=<VALUE>' > ./.env
```

#### Visual Studio Code

```sh
#
code --install-extension Rubymaniac.vscode-direnv

#
jq '."recommendations" += ["Rubymaniac.vscode-direnv"]' "$HOME"/.vscode/extensions.json | sponge "$HOME"/.vscode/extensions.json
```

**Configuration:**

```sh
#
jq '."files.associations".".envrc" |= "dotenv"' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
```

#### Autocomplete

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# direnv
command -v direnv >/dev/null && eval "$(direnv hook zsh)" # bash
```

```sh
source ~/.zshrc
```
