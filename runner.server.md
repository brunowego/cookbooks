# Local GitHub Actions and Azure Pipelines Emulator (runner.server)

## Links

- [Code Repository](https://github.com/ChristopherHX/runner.server)

## CLI

### Installation

#### Darwin Binary

```sh
#
export RS_PATH="${HOME}/.runner-server"

#
RS_VERSION="$(curl -s https://api.github.com/repos/ChristopherHX/runner.server/releases/latest | grep tag_name | cut -d '"' -f 4 | tr -d 'v')"; \
  curl -L \
    "https://github.com/ChristopherHX/runner.server/releases/download/v${RS_VERSION}/runner.server-osx-x64.tar.gz" | \
      tar -xzC "$RS_PATH"

#
ln -s "$RS_PATH"/Runner.Client /usr/local/bin/Runner.Client
ln -s "$RS_PATH"/Runner.Server /usr/local/bin/Runner.Server
ln -s "$RS_PATH"/Runner.Worker /usr/local/bin/Runner.Worker
ln -s "$RS_PATH"/Runner.Listener /usr/local/bin/Runner.Listener
```

### Commands

```sh
Runner.Client -h
Runner.Listener --help
```

### Usage

#### GitHub Actions

```sh
#
Runner.Client -l
```

#### Azure Pipelines

```sh
#
Runner.Server --urls http://localhost:5000

#
Runner.Client --event azpipelines -l

#
Runner.Client \
  --event azpipelines \
  -W ./azure-pipelines.yml
```
