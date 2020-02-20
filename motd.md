# motd

## References

- [Wiki](https://en.wikipedia.org/wiki/Motd_(Unix))

## Tips

### Remove "Last login"

```sh
touch ~/.hushlogin || exit
```

#### Rollback

```sh
rm ~/.hushlogin
```
