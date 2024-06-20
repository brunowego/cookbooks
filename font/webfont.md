# Webfont

## Tips

### Git Attributes

Add [text rules](/gitattributes.md#text)

```sh
cat << EOF >> ./.gitattributes
/*.eot binary
/*.ttf binary
/*.woff binary
/*.woff2 binary

/*.eot -text diff
/*.ttf -text diff
/*.woff -text diff
/*.woff2 -text diff
EOF
```

### Font Weight

| Weight | Name        |
| ------ | ----------- |
| 100    | Thin        |
| 200    | Extra Light |
| 300    | Light       |
| 400    | Regular     |
| 450    | Book        |
| 500    | Medium      |
| 600    | Semi-bold   |
| 700    | Bold        |
| 800    | Black       |
| 900    | Extra       |
