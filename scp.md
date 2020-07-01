# scp

## Usage

```sh
# Output TTY
echo 'hello' > /dev/tty

echo "$(scp [username]@[hostname]:[/absolute/path/to/file] /dev/tty &> /dev/null)"
```
