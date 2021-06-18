# act

## Links

- [Code Repository](https://github.com/nektos/act)

## CLI

### Installation

#### Homebrew

```sh
brew install act
```

#### Linux Binary

```sh
curl \
  -L \
  'https://github.com/nektos/act/releases/download/v0.2.23/act_Linux_x86_64.tar.gz' | \
    tar -xzC /usr/local/bin act
```

#### Chocolatey

```sh
choco install act-cli
```

### Commands

```sh
act -h
```

### Configuration

```sh
cat << EOF > ~/.actrc
-P ubuntu-latest=catthehacker/ubuntu:act-latest
--secret-file ./.secrets
EOF
```

### Usage

```sh
#
act -l

#
act push
act pull_request

#
act -j build
```

### Tips

### Visual Studio Code

**Dependencies:** [dotENV](/dotenv.md#visual-studio-code) VSCode plugin.

```sh
jq '."files.associations".".secrets" |= "dotenv"' "$HOME/.config/Code/User/settings.json" | \
  sponge "$HOME/.config/Code/User/settings.json"
```

<!-- ### Issues

####

```log
FATA[0000] Unable to build dependency graph!
```

TODO -->
