# Portable Document Format (PDF)

<!--
https://github.com/jonaslejon/malicious-pdf
-->

## Tips

### Git Attributes

```sh
cat << EOF >> ./.gitattributes
/documents/*.pdf filter=lfs diff=lfs merge=lfs -text
EOF
```

### Visual Studio Code

```sh
code --install-extension tomoki1207.pdf
```
