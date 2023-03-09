# Godoc

<!--
https://github.com/go101/golds
-->

## Link

- [Docs](https://pkg.go.dev/golang.org/x/tools/cmd/godoc)

## CLI

### Installation

```sh
go install -v golang.org/x/tools/cmd/godoc@latest
```

<!--
sudo apt -y install golang-doc
-->

### Commands

```sh
godoc -h
```

### Usage

```sh
#
godoc -http=:6060

# Darwin
open "http://localhost:6060/pkg/$(go list -m)"
```

### Tips

#### Scraping HTML

```sh
#
export PKG='github.com/london-bridge/auth'

#
godoc -http=:6060

#
wget \
  -e 'robots=off' \
  -Erkmp \
  -I '/pkg,/lib' \
  -X '*' \
  "http://localhost:6060/pkg/$PKG/"

#
http-server \
  './localhost:6060' \
  -p 8080
```

<!--
godoc -url "/pkg/$PKG" > ./reference.html
-->
