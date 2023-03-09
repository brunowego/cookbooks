# SonarLint

## Links

- [Main Website](https://sonarlint.org/)
- [Rules](https://rules.sonarsource.com)

## Dependencies

- [SonarQube Scanner](/sonarsource/sonarqube-scanner.md)

## Tips

### Visual Studio Code

**Dependencies:** [OpenJDK Java Runtime Environment (JRE) 11+](/openjdk/jre.md).

```sh
#
code --install-extension SonarSource.sonarlint-vscode

#
jq '."recommendations" += ["SonarSource.sonarlint-vscode"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
