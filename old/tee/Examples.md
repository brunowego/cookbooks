# Examples

## Append

```sh
tee -a [file]
```

## With EOF

```sh
sudo tee -a [/path/to/file] << EOF

EOF
```

### Prevent interpreting

```sh
sudo tee -a [/path/to/file] << 'EOF'

EOF
```

## EOF and cat command

```sh
cat << EOF | sudo tee -a [/path/to/file]

EOF
```
