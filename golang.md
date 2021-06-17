# Go Programming Language

Efficient compilation, Efficient execution and Ease of programming.

<!--
https://github.com/vmasdani/cozypos-full

https://pragprog.com/titles/tjgo/distributed-services-with-go/

https://github.com/makeless/makeless-demo.git

https://www.justforlearning.com/courses/build-your-first-microservices-based-application-using-go-and-grpc/dashboard

https://dominicstpierre.com/getting-started-with-go-guide
https://github.com/youxia999/go-learn-project
https://medium.com/@hatajoe/clean-architecture-in-go-4030f11ec1b1

https://github.com/ehang-io/nps

Pluralsight

https://app.pluralsight.com/paths/skills/go-core-language

https://app.pluralsight.com/library/courses/go-object-oriented-programming/
https://app.pluralsight.com/library/courses/go-horizontal-scaling-apps/
https://app.pluralsight.com/library/courses/creating-web-applications-go-update/
https://app.pluralsight.com/library/courses/go-build-distributed-applications/
https://app.pluralsight.com/library/courses/exploring-go-modules/
https://app.pluralsight.com/library/courses/code-school-on-track-with-golang/
https://app.pluralsight.com/library/courses/grpc-enhancing-application-communication/

LinkedIn Learning

https://linkedin.com/learning/learning-go-8399317/explore-go-s-variable-types
https://linkedin.com/learning/learning-the-go-standard-library/don-t-go-re-inventing-the-wheel
-->

<!--
Write Quality Code in Golang
https://app.pluralsight.com/guides/write-quality-code-in-golang

Testing Code in Go Language
https://app.pluralsight.com/guides/testing-golang-code

Static Golang Code Analysis with Go and SonarQube
https://app.pluralsight.com/guides/static-code-analysis-with-go-and-sonarqube
-->

## References

- [Ken Thompson](https://en.wikipedia.org/wiki/Ken_Thompson)
- [Rob Pike](https://en.wikipedia.org/wiki/Rob_Pike)
- [Robert Griesemer](https://en.wikipedia.org/wiki/Robert_Griesemer)
- [Go (programming language)](https://en.wikipedia.org/wiki/Go_(programming_language))
- [The Go Programming Language](https://golang.org/)
- [Modules](https://github.com/golang/go/wiki/Modules)
- [go.dev](https://go.dev/)
- [Learn Web Programming in Go by Examples](https://gowebexamples.com/)
- [Go go-to guide](https://yourbasic.org/golang/)

## Libraries

- [sprig - Useful template functions for Go templates](https://masterminds.github.io/sprig/date.html)

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

#### Darwin Binary

```sh
curl 'https://dl.google.com/go/go1.13.5.darwin-amd64.tar.gz' | tar -xzC /usr/local
```

#### Linux Binary

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

# List installed packages
go list '...'
```

### Tips

#### Go Debug

```sh
GODEBUG=http2debug=2 \
  # ...
```

#### Arch

<!-- GOOS windows
GOARCH amd64

GOOS darwin
GOARCH amd64

GOOS android
GOARCH arm -->

```sh
CGO_ENABLED=0 \
GOOS=linux \
GOARCH=amd64 \
  go build \
  # ...
```

#### Command-line completion

```sh
# Using Antigen
antigen bundle golang
```

#### Visual Studio Code

```sh
# Dependencies
go get -v golang.org/x/tools/gopls
go get -v github.com/uudashr/gopkgs/v2/cmd/gopkgs
go get -v github.com/ramya-rao-a/go-outline
go get -v github.com/go-delve/delve/cmd/dlv
go get -v honnef.co/go/tools/cmd/staticcheck

#
code --install-extension golang.go
```

### Uninstall

```sh
# Darwin or Linux
sudo rm -fR /usr/local/go
sudo rm -fR ~/.go
```
