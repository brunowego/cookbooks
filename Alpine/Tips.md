# Tips

## Bash instead native shell

```sh
apk update
apk add --no-cache bash shadow
```

```sh
chsh -s `which bash`
```

```sh
exec `which bash`
```
