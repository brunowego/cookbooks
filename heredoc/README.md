# Heredoc

The minus sign - after the << characters means you can indent the terminator.

## Indent

```sh
cat <<-EOF

EOF
```

## Escape

```sh
cat << 'EOF'
`ps`
EOF
```
