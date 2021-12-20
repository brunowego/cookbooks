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

### JPEG to PDF

```sh
convert [filename].jpg -auto-orient [filename].pdf
```

### Visual Studio Code

```sh
code --install-extension tomoki1207.pdf
```
