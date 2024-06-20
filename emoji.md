# Emoji

<!--
🌟
-->

<!--
https://github.com/googlefonts/noto-emoji
-->

## Tools

- [EmojiDB](https://emojidb.org) 🌟
- [GetEmoji](https://getemoji.com)

## Tips

### Visual Studio Code

```sh
#
code --install-extension bierner.emojisense

#
jq '."recommendations" += ["bierner.emojisense"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
