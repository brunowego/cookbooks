# motd

## References

- [Wiki](https://en.wikipedia.org/wiki/Motd_(Unix))

## Tips

### Remove "Last login"

***Warning***: Bad security practice!

```sh
touch ~/.hushlogin || exit
```

#### Rollback

```sh
rm ~/.hushlogin
```
