# Message of The Day (motd)

## References

- [Wiki](<https://en.wikipedia.org/wiki/Motd_(Unix)>)

## Tips

### Remove "Last login"

**_Warning_**: Bad security practice!

```sh
# Stop message
touch ~/.hushlogin || exit

# Rollback
rm ~/.hushlogin
```
