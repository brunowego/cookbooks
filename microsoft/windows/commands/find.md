# Find

## Usage

```sh
#
find c:\ -name [filename]

# Find and remove Thumbs.db files
find . -name Thumbs.db -print0 | xargs -0 git rm -f --ignore-unmatch
```
