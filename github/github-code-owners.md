# GitHub Code Owners

## Guides

- [About code owners](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners)

## Definition File

```sh
cat << EOF > ./.github/CODEOWNERS
/.github/* @my-org/maintainers
EOF
```

## Tips

### Visual Studio Code

```sh
code --install-extension jasonnutter.vscode-codeowners
```
