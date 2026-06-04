# URL Decode

## Tips

```sh
#
echo '<url-encoded-string>' | python3 -c "import sys, urllib.parse; print(urllib.parse.unquote(sys.stdin.read().strip()))"
```
