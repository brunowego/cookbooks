# Git Attributes

## Common

```sh
#
echo '* text=auto\n' >> ./.gitattributes

# NPM
cat << EOF >> ./.gitattributes
package-lock.json -diff
package-lock.json linguist-generated=true
EOF
```
