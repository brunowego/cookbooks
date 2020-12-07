# Go Programming Language

<!--
https://github.com/vmasdani/cozypos-full

https://pragprog.com/titles/tjgo/distributed-services-with-go/

https://app.pluralsight.com/paths/skills/go-core-language
https://app.pluralsight.com/library/courses/exploring-go-modules/table-of-contents
https://app.pluralsight.com/library/courses/go-big-picture/table-of-contents
https://app.pluralsight.com/library/courses/go-object-oriented-programming/table-of-contents
https://app.pluralsight.com/library/courses/go-delve-debugging-applications/table-of-contents
https://app.pluralsight.com/library/courses/creating-web-applications-go-update/table-of-contents
https://app.pluralsight.com/library/courses/go-horizontal-scaling-apps/table-of-contents
https://app.pluralsight.com/library/courses/go-build-distributed-applications/table-of-contents

https://github.com/makeless/makeless-demo.git

https://www.justforlearning.com/courses/build-your-first-microservices-based-application-using-go-and-grpc/dashboard

https://dominicstpierre.com/getting-started-with-go-guide
https://github.com/youxia999/go-learn-project
https://medium.com/@hatajoe/clean-architecture-in-go-4030f11ec1b1

https://github.com/ehang-io/nps
-->

## References

- [Modules](https://github.com/golang/go/wiki/Modules)

## Docker

### Running

```sh
# Bash
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h golang \
  --name golang \
  docker.io/library/golang:1.13.5
```

## CLI

### Dependencies

- [Git](/git.md)

### Installation

#### Homebrew

```sh
brew install golang
```

#### Darwin

```sh
curl 'https://dl.google.com/go/go1.13.5.darwin-amd64.tar.gz' | tar -xzC /usr/local
```

#### Linux

```sh
curl 'https://dl.google.com/go/go1.13.5.linux-amd64.tar.gz' | sudo tar -xzC /usr/local
```

#### Chocolatey

```sh
choco install -y golang
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Golang
export GOLANG_HOME='/usr/local/go'
export GOPATH="$HOME/.go"
export GOBIN="$GOPATH/bin"
export PATH="$GOLANG_HOME/bin:$GOBIN:$PATH"
```

```sh
sudo su - "$USER"
```

### Commands

```sh
go help
```

### Usage

```sh
# Version
go version

# Environment
go env
```

### Tips

#### Visual Studio Code

```sh
code --install-extension ms-vscode.Go
```

### Uninstall

```sh
# Darwin or Linux
sudo rm -fR /usr/local/go
sudo rm -fR ~/.go
```
