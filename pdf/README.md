# Portable Document Format (PDF)

<!--
https://github.com/jonaslejon/malicious-pdf
-->

## Tools

- [Adobe Acrobat Reader](/adobe/acrobat-reader.md)

## Tips

### Git Attributes

```sh
cat << EOF >> ./.gitattributes
/documents/*.pdf filter=lfs diff=lfs merge=lfs -text
EOF
```

### JPEG to PDF

```sh
convert <filename>.jpg -auto-orient <filename>.pdf
```

### Visual Studio Code

```sh
#
code --install-extension tomoki1207.pdf

#
jq '."recommendations" += ["tomoki1207.pdf"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
