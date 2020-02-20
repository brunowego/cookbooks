# hostess

## CLI

### Installation

#### Homebrew

```sh
brew install hostess
```

#### Linux

```sh
sudo curl -L "https://github.com/cbednarski/hostess/releases/download/$(curl -s https://api.github.com/repos/cbednarski/hostess/releases/latest | grep tag_name | cut -d '"' -f 4)/hostess_linux_amd64" -o /usr/bin/hostess && sudo chmod +x /usr/bin/hostess
```

### Commands

```sh
hostess -h
```
