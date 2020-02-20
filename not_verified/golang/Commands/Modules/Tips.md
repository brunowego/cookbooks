# Tips

## From Repo

```sh
go mod init github.com/[organization|username]/[repository]
```

## Migration

```sh
go mod init
go mod tidy
rm -fr vendor/
go build
rm -f Gopkg.lock Gopkg.toml
git commit -m 'chore(dep): migrated from dep to Go 1.11 modules'
```

<!-- https://blog.callr.tech/migrating-from-dep-to-go-1.11-modules/
https://itiskj.hatenablog.com/entry/2018/08/30/101017
https://blog.liquidbytes.net/2018/09/quick-and-easy-guide-for-migrating-to-go-1-11-modules/ -->
