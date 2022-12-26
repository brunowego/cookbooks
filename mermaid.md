# mermaid

## Links

- [Main Website](https://mermaid-js.github.io/mermaid)

## Tools

- [Mermaid Live Editor](https://mermaid-js.github.io/mermaid-live-editor/)

## Posts

- [GitHub / Include diagrams in your Markdown files with Mermaid](https://github.blog/2022-02-14-include-diagrams-markdown-files-mermaid/)

## Using

```mermaid
graph TD;
  A-->B;
  A-->C;
  B-->D;
  C-->D;
```

```mermaid
stateDiagram
  [*] --> Still
  Still --> [*]
  Still --> Moving
  Moving --> Still
  Moving --> Crash
  Crash --> [*]
```

## Tips

### Visual Studio Code

```sh
#
code --install-extension bierner.markdown-mermaid
code --install-extension bpruitt-goddard.mermaid-markdown-syntax-highlighting

#
jq '."recommendations" += ["bierner.markdown-mermaid"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json

jq '."recommendations" += ["bpruitt-goddard.mermaid-markdown-syntax-highlighting"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
