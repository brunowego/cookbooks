# Tips

## Show IP

```sh
vagrant ssh -c 'hostname -I | cut -d " " -f 2' 2> /dev/null
```

## Debug

### Environment

```sh
VAGRANT_LOG=DEBUG vagrant [command]
```

### CLI

```sh
vagrant [command] --debug
```
