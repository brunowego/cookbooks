# Webfont

## Configuration

Add [text rules](/gitattributes.md#text)

```sh
cat << EOF >> ./.gitattributes
*.eot binary
*.ttf binary
*.woff binary
*.woff2 binary

*.eot -text diff
*.ttf -text diff
*.woff -text diff
*.woff2 -text diff
EOF
```
