# Fira Code Font

<!--
https://medium.com/@docodemore/an-alternative-to-operator-mono-font-6e5d040e1c7e
https://medium.com/@peterpme/operator-mono-fira-code-the-best-of-both-worlds-191be512fd5e
-->

## Links

- [Code Repository](https://github.com/tonsky/FiraCode)

## Library

### Installation

```sh
# Using Homebrew
brew install --cask font-fira-code

# Using APT
sudo apt update
sudo apt -y install fonts-firacode

# Using Chocolatey
choco install -y firacode-ttf
```

### Tips

#### Zed

```json
{
  "buffer_font_family": "Fira Code"
}
```

#### Visual Studio Code

```sh
#
jq '."editor.fontFamily" |= "'\''Fira Code'\''"' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json

#
jq '."editor.fontLigatures" |= true' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
```

#### Cursor

```sh
#
jq '."editor.fontFamily" |= "'\''Fira Code'\''"' "$HOME"/.cursor/settings.json | sponge "$HOME"/.cursor/settings.json

#
jq '."editor.fontLigatures" |= true' "$HOME"/.cursor/settings.json | sponge "$HOME"/.cursor/settings.json
```
