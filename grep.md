# grep

## References

- [Usage](https://en.wikipedia.org/wiki/Sleep_(command)#Usage)

## Commands

```sh
man grep
```

## More Examples

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
