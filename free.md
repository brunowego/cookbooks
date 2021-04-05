# free

## CLI

### Usage

```sh
# Memory
free -m | grep 'Mem:' | awk '{print $2*20/100}' | xargs printf "%.0f"M
```
