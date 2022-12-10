# Kill

## CLI

### Usage

```sh
# Finish Process
kill -9 <pid>

# Filter
kill -9 "$(ps aux | grep [name] | grep -v grep | sed 's/^[^ ][^ ]*[ ][ ]*\([0-9][0-9]*\).*$/\1/g')"
```
