# Images

## Usage

```sh
# List Images
docker images -q

# Remove
docker rmi <image>

# Remove All Images
docker rmi $(docker images -q)

# Filter
docker rmi $(docker images -q --no-trunc --filter "dangling=true")

# Remove Untagged Images
docker rmi $(docker images | grep 'none' | awk '/ / { print $3 }') -f
```
