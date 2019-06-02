# sleep

## References

- [Usage](https://en.wikipedia.org/wiki/Sleep_(command)#Usage)

## Commands

```sh
man sleep
```

## More Examples

### Timed File Reading

```sh
tail -f [/path/to/file] & sleep 60; kill $!
```
