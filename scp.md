# scp

## Usage

```sh
# Output TTY
echo 'hello' > /dev/tty

echo "$(scp [username]@[hostname]:[/absolute/path/to/file] /dev/tty &> /dev/null)"

# Recursive
scp -r /path/to/folder [username]@[hostname]:[/absolute/path/to/folder]
```
