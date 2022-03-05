# Adobe Illustrator

## Tips

### Git Attributes

Add [text rules](/gitattributes.md#text)

```sh
cat << EOF >> ./.gitattributes
/documents/*.ai -diff -merge -text
EOF
```

### Round Corners

1. Direct Selection Tool (A)
2. Corners -> Radius
