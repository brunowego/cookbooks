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
#
cat << EOP > ~/.actrc
-P ubuntu-latest=catthehacker/ubuntu:act-latest
--secret-file ./.secrets
EOP

# Git ignore
echo '/.secrets' >> ~/.gitignore_global
```

### Usage

```sh
# List actions
act -l \
  -W ./.github/workflows/[name].yaml

# Run on push
act push \
  -v

# Run on pull request
act pull_request \
  -v

# Run specific job
act -j build \
  -W ./.github/workflows/[name].yaml
  -v
```

### Tips

### Visual Studio Code

**Dependencies:** [dotENV](/dotenv.md#visual-studio-code) VSCode plugin.

```sh
jq '."files.associations".".secrets" |= "dotenv"' "$HOME/.config/Code/User/settings.json" | \
  sponge "$HOME/.config/Code/User/settings.json"
```

### Issues

#### Missing GitHub Token

```log
Error: Error undefined: Parameter token or opts.auth is required
```

```sh
export GITHUB_TOKEN=''
```

#### Update Token

```log
DEBU[0003] authentication required
```

Update your `GITHUB_TOKEN` in `.secrets` file.

<!-- ####

```log
FATA[0000] Unable to build dependency graph!
```

TODO -->

<!-- ####

```log
Error: unable to find api field in struct HorizontalPodAutoscalerSpec for the json field "behavior"
```

TODO -->
