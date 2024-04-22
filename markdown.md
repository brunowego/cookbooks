# Markdown

<!--
https://medium.com/shiwaforce/notion-like-text-editor-with-ai-autocomplete-and-planetscale-database-in-next-js-using-shadcn-ui-d7ca2d56f85e
-->

## Links

- [Basic Syntax](https://markdownguide.org/basic-syntax)

## Implementations

- [markdown-it](https://github.com/markdown-it/markdown-it)
- [Marked](https://github.com/markedjs/marked)
- [MDXEditor](https://github.com/mdx-editor/editor)

## Syntax

### Effects

- ~~Strikethrough~~

## Tools

- [Dillinger](https://dillinger.io)
- [HackMD](https://hackmd.io)
- [StackEdit](https://stackedit.io)

<!--
https://github.com/marktext/marktext
https://markdownlivepreview.com
-->

### Tips

#### Visual Studio Code

**Recommended:** [markdownlint](/markdownlint.md#visual-studio-code)

```sh
#
code --install-extension shuworks.vscode-table-formatter

#
jq '."recommendations" += ["shuworks.vscode-table-formatter"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
