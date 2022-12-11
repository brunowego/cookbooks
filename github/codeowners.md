# Code Owners

<!--

-->

## Links

- [About code owners](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners)

## Configuration

```sh
cat << EOF > ./CODEOWNERS
* @henkiz/devops
EOF
```

<!--
/.github @henkiz/devops
/.vscode @henkiz/devops
/chats/ @henkiz/devops
/docs @henkiz/devops
-->

<!--
business -> bizops
finance -> finops
design -> desops
develop -> devops
data -> dataops
security -> secops
marketing strategy -> msops
-->

## Tips

### Visual Studio Code

```sh
#
code --install-extension jasonnutter.vscode-codeowners

#
jq '."recommendations" += ["jasonnutter.vscode-codeowners"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
