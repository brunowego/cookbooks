# GitHub Actions Runner

## Links

- [Code Repository](https://github.com/actions/runner)

## CLI

### Installation

#### Darwin Library

```sh
#
sudo mkdir -p /usr/local/actions-runner
sudo chown -R "$(whoami)" /usr/local/actions-runner

#
GHAR_VERSION="$(curl -s https://api.github.com/repos/actions/runner/releases/latest | grep tag_name | cut -d '"' -f 4 | tr -d 'v')"; \
  curl -L \
    "https://github.com/actions/runner/releases/download/v${GHAR_VERSION}/actions-runner-osx-x64-${GHAR_VERSION}.tar.gz" | \
      tar -xzC /usr/local/actions-runner
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# GitHub Actions Runner
export GHAR_HOME='/usr/local/actions-runner'
export PATH="$GHAR_HOME/bin:$PATH"
```

```sh
sudo su - "$USER"
```
