# Examples

## End of file

```sh
cat << EOF
[text]
EOF
```

```sh
cat << EOF >> [/path/to/file]
[text]
EOF
```

### Scape variables

```sh
cat << \EOF
[$variable]
EOF
```

```sh
cat << 'EOF'
[$variable]
EOF
```
