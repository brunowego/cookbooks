# Go Programming Language

<!--
https://github.com/golang-standards/project-layout
https://github.com/bxcodec/go-clean-arch
-->

Efficient compilation, Efficient execution and Ease of programming.

## Links

- [Code Repository](https://github.com/golang/go)
- [Main Website](https://golang.org/)
- [The Go Playground](https://play.golang.org)
- [Download](https://go.dev/dl/)

## References

- [Go (programming language)](<https://en.wikipedia.org/wiki/Go_(programming_language)>)
- [Go go-to guide](https://yourbasic.org/golang/)
- [Go Project Structure](https://github.com/PerimeterX/go-project-structure)
- [go.dev](https://go.dev/)
- [Golang Cheat-Sheet](https://github.com/a8m/go-lang-cheat-sheet)
- [Ken Thompson](https://en.wikipedia.org/wiki/Ken_Thompson)
- [Learn Web Programming in Go by Examples](https://gowebexamples.com)
- [Modules](https://github.com/golang/go/wiki/Modules)
- [Rob Pike](https://en.wikipedia.org/wiki/Rob_Pike)
- [Robert Griesemer](https://en.wikipedia.org/wiki/Robert_Griesemer)
- [The Go Programming Language](https://golang.org/)

## Libraries

- [sprig - Useful template functions for Go templates](https://masterminds.github.io/sprig/date.html)

## Glossary

- Clang Golang (CGO)
- Golang Architecture (GOARCH)
- Golang Operation System (GOOS)

## Docker

### Running

```sh
# Bash
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h golang \
  --name golang \
  docker.io/library/golang:1.19.6
```

## CLI

### Dependencies

- [Git](/git.md)

### Installation

**Prefer:** [Golang Version Manager](./version-manager.md)

#### Homebrew

```sh
brew install golang
```

#### Darwin Binary

```sh
curl 'https://dl.google.com/go/go1.13.5.darwin-amd64.tar.gz' | \
  tar -xzC /usr/local
```

#### Linux Binary

```sh
curl 'https://dl.google.com/go/go1.13.5.linux-amd64.tar.gz' | \
  sudo tar -xzC /usr/local
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

#
go tool dist list

#
go run ./<filename>.go
go run xyz.tld/m

#
go build ./<filename>.go

#
go doc json
go doc json.Decoder
```

### Tips

#### Clean Cache

```sh
#
go env GOCACHE

#
du -hs $(go env GOCACHE)

#
go clean --cache
```

#### Visual Studio Code

**Attention:** Autocompletion only works if the module has been initialized (`go mod init`).

```sh
#
code --install-extension golang.Go

#
jq '."recommendations" += ["golang.Go"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

**Configuration:**

```sh
jq '."[go]"."editor.defaultFormatter" |= "golang.go"' "$PWD"/.vscode/settings.json | sponge "$PWD"/.vscode/settings.json
```

<!--
"go.useLanguageServer": false,
"go.languageServerExperimentalFeatures": {
  "diagnostics": false
}
"go.useCodeSnippetsOnFunctionSuggest": true,
"go.useCodeSnippetsOnFunctionSuggestWithoutType": true,
"go.lintTool": "golint",
"go.testOnSave": true,
"go.formatTool": "goimports",
"go.autocompleteUnimportedPackages": true,
"go.lintOnSave": "package",
"go.testFlags": ["-v"],
"[go]": {
    "editor.formatOnSave": true,
    "editor.codeActionsOnSave": {
        "source.organizeImports": true
    }
}
-->

##### Install Dependencies

1. Main Menu "View"
2. Command Palette...
3. Go: Install/Update Tools
4. Check all Tools

#### EditorConfig

```sh
cat << EOF >> ./.editorconfig

[*.{go,mod}]
indent_size = 8
indent_style = tab
EOF
```

#### Go Debug

```sh
GODEBUG=http2debug=2 \
  # ...
```

#### Arch

<!--
GOOS
android
darwin
freebsd
openbsd
windows
-->

<!--
GOARCH
amd64
arm64
-->

```sh
CGO_ENABLED=0 \
GOOS=linux \
GOARCH=amd64 \
  go build \
    -a \
    -installsuffix cgo \
    -o <binary> \
    ./cmd/<name>.go
```

#### Linking

```sh
# Static
CGO_ENABLED=0 \
  go build -o <binary>

ldd <binary>

# Dynamic
CGO_ENABLED=1 \
  go build -o <binary>

ldd <binary>
```

#### Command-line completion

```sh
# Using Antigen
antigen bundle golang
```

### Issues

#### Different Version of `GOROOT`

```log
compile: version "go1.19.4" does not match go tool version "go1.19.5"
```

```sh
#
echo "$GOROOT"

#
go version

# Workaround
brew uninstall --ignore-dependencies go
```

#### Read-only File System

```log
go build command-line-arguments: mkdir /go: read-only file system
```

TODO

### Uninstall

```sh
# Darwin or Linux
sudo rm -fR /usr/local/go
sudo rm -fR ~/.go
```
