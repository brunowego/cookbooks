# MDX

<!--
<pre>{JSON.stringify(<variable>, null, 2)}</pre>
-->

## Links

- [Code Repository](https://github.com/mdx-js/mdx/)
- [Main Website](https://mdxjs.com)

## Tips

### Visual Studio Code

```sh
#
code --install-extension unifiedjs.vscode-mdx

#
jq '."recommendations" += ["unifiedjs.vscode-mdx"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

## Issues

### TBD

```log
First line in a file should be a top-level heading markdownlint MD041
```

TODO
