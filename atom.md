# Atom

## App

### Installation

#### Homebrew

```sh
brew cask install atom
```

#### APT

```sh
sudo apt-add-repository ppa:webupd8team/atom
sudo apt update
sudo apt -y install atom
```

#### Chocolatey

```sh
choco install -y atom
```

### Plugins

```sh
# List Installed
apm list -i

#
apm install \
  emmet sort-lines editorconfig filesize \
  language-docker language-env language-gitignore language-pug language-log language-ini language-generic-config \
  linter linter-markdown linter-docker linter-js-yaml linter-ruby linter-jsonlint linter-stylelint linter-pug linter-shellcheck linter-eslint linter-python linter-xmllint
```

### Configuration

```sh
vim ~/.atom/config.cson
```

```cson
"*":
  core:
    telemetryConsent: "limited"
    titleBar: "custom"
  editor: {}
  "exception-reporting":
    userId: ""
  "linter-pug":
    onlyRunWhenConfig: true
  "linter-pylama": {}
  "linter-python":
    executablePath: ""
  "linter-ui-default":
    showPanel: true
  "one-dark-ui":
    stickyHeaders: true
  "spell-check": {}
  welcome:
    showOnStartup: false
```

### Usage

```sh
# Install
apm install --check

# Config List
apm config list

# Ignore SSL
apm config set strict-ssl false
apm config delete strict-ssl
```

### Tips

#### Proxy

```sh
# Set
apm config set http_proxy $http_proxy
apm config set https_proxy $https_proxy

# Delete
npm config delete http_proxy
npm config delete https_proxy
```

#### Transparency

```sh
git clone https://github.com/atom/atom
```

```coffee
frame: false
transparent: true
```

### Uninstall

```sh
# Homebrew
brew cask uninstall atom
```

```sh
rm -fR ~/.atom

# Homebrew
rm -fR ~/Library/Application\ Support/Atom
```
