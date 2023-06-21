# PlantUML

## Links

- [Code Repository](https://plantuml.com)
- [Web Server](https://plantuml.com/plantuml/uml)

## Tools

- [PlantText](https://planttext.com)

## Tips

### Visual Studio Code

```sh
#
code --install-extension jebbs.plantuml

#
jq '."recommendations" += ["jebbs.plantuml"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

## Issues

### Missing Java

```log
Command 'Plant UML' resulted in an error (command 'plantuml.preview' not found)
```

Missing Java Runtime Environment (JRE) 11
