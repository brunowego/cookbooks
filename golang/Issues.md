# Issues

##

> cannot find package "\[path/to/package]" in any of:

```sh
ln -s "$PWD" $(go env GOPATH)/src/$(basename "$PWD")
```
