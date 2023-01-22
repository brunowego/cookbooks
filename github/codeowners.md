# Code Owners

## Links

- [About code owners](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners)

## Configuration

```sh
#
mkdir -p ./.github

#
cat << EOF > ./.github/CODEOWNERS
* @<owner>/<team>
EOF
```

<!--
business
finance
design
develop s
data
security
marketing strategy
-->

## Tips

### Visual Studio Code

```sh
#
code --install-extension jasonnutter.vscode-codeowners

#
jq '."recommendations" += ["jasonnutter.vscode-codeowners"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
