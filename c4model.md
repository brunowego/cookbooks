# C4 model

**Keywords:** Diagram, Architecture Framework, Design Docs

<!--
Dynamic Diagram
Implementation Diagram
-->

## Links

- [Main Website](https://c4model.com)

## References

- [C4 Modelling little bit easier (c4-draw.io)](https://tobiashochguertel.github.io/c4-draw.io/)

## Tools

- [Carbide](https://carbide.dev)
- [IcePanel](https://icepanel.io)
- [Mermaid](https://mermaid.js.org/syntax/c4c.html)
- [Structurizr](/structurizr.md) 🌟

<!--
https://adrianvlupu.github.io/C4-Builder
-->

<!-- ##

- PlantUML -->

## Diagram Levels (4 C's)

1. Context
2. Containers
3. Components
4. Code

<!--
## Abstractions

- Person
- System
- Container
- Component
-->

## Tips

### Visual Studio Code

```sh
#
code --install-extension systemticks.c4-dsl-extension

#
jq '."recommendations" += ["systemticks.c4-dsl-extension"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
