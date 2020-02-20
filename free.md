# free

## CLI

### Examples

#### Memory

```sh
free -m | grep 'Mem:' | awk '{print $2*20/100}' | xargs printf "%.0f"M
```
