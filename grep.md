# grep

## References

- [Usage](https://en.wikipedia.org/wiki/Sleep_(command)#Usage)

## Commands

```sh
grep --help
```

## Tips

### Search in Files

```sh
grep -lrnw '[/path/to/files]' -e '[text]'
```

### Before and After

```sh
grep -B 10 -A 10 -i 'john doe' ./users.json
```

### Highlight

```sh
echo 'My name is John Doe!' | grep --color -i 'john doe'
```

### Filter

```sh
cat << EOF | grep -i --line-buffered doe
John Doe
Jane Doe
Richard Roe

EOF
```

### Docker Logs Filter

```sh
#
docker logs [container-name] 2> >(grep '[text]')
#
docker logs [container-name] 2>&1 | grep '[text]'
```
