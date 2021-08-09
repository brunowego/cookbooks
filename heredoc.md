# Here document (heredoc)

## References

- [Wikipedia](https://en.wikipedia.org/wiki/Here_document)

## More Examples

### Pipe Usage

```sh
# End-Of-File
cat << EOF | [command]

EOF

# End-Of-Script
cat << EOS | [command]

EOS

# End-Of-JSON
cat << EOJ | [command]
{}
EOJ
```
