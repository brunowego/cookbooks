# SonarLint

## Links

- [Main Website](https://sonarlint.org/)
- [Rules](https://rules.sonarsource.com/)

## Dependencies

- [SonarQube Scanner](/sonarsource/sonarqube-scanner.md)

## Tips

### Visual Studio Code

```sh
#
code --install-extension SonarSource.sonarlint-vscode

#
jq '."recommendations" += ["SonarSource.sonarlint-vscode"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
