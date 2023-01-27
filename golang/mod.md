# Go Modules (mod)

<!--
https://app.pluralsight.com/library/courses/exploring-go-modules/
https://blog.callr.tech/migrating-from-dep-to-go-1.11-modules/
https://itiskj.hatenablog.com/entry/2018/08/30/101017
https://blog.liquidbytes.net/2018/09/quick-and-easy-guide-for-migrating-to-go-1-11-modules/
-->

## CLI

### Commands

```sh
go help mod
```

### Usage

```sh
#
go mod init
# or
go mod init github.com/<owner>/<repository>

#
go mod tidy

#
go mod verify

#
go mod why

#
go mod graph

#
go mod vendor
```

### Extend

#### With Trunk

```sh
# Runs go mod tidy when changes are detected to go.mod
trunk actions enable go-mod-tidy

# Runs go mod tidy followed by go mod vendor
trunk actions enable go-mod-tidy-vendor
```

### Tips

#### Structure

```sh
mkdir -p {cmd,internal,pkg}
```

#### Migration

```sh
#
go mod init github.com/<owner>/<repository>

#
go mod tidy

#
rm -fr ./vendor/

#
go build

#
rm -f ./Gopkg.lock ./Gopkg.toml

#
git commit -m 'chore(dep): migrated from dep to Go 1.11 modules'
```
