# scp

## Examples

### Output TTY

```sh
echo 'hello' > /dev/tty
```

```sh
echo "$(scp [username]@[hostname]:[/absolute/path/to/file] /dev/tty &> /dev/null)"
```
