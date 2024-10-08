# Eclipse Java

## App

### Installation

#### Homebrew

```sh
# Java SE
brew install --cask eclipse-java

# Java EE
brew install --cask eclipse-jee
```

### Configuration

```sh
# Git ignore
cat << EOF >> ~/.gitignore_global
/.classpath
/.factorypath
/.project
/.settings
EOF
```

### Tips

#### VS Code Files Exclude

```sh
jq '."files.exclude"."**/.classpath" |= false' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
jq '."files.exclude"."**/.factorypath" |= false' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
jq '."files.exclude"."**/.project" |= false' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
jq '."files.exclude"."**/.settings" |= false' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
```

### Issues

#### SSL Connect

```log
OpenSSL SSL_connect: SSL_ERROR_SYSCALL in connection to marketplace.eclipse.org:443
```

Configure proxy.
