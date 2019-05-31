# urandom

```sh
< /dev/urandom tr -dc 'a-zA-Z0-9' | head -c 32; echo
```

```sh
cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1
```
