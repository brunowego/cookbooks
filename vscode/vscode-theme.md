# Visual Studio Theme

## Material Theme

```sh
# Install
code --install-extension zhuangtongfa.Material-theme

# Apply
jq '."workbench.colorTheme" |= "One Dark Pro"' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
```
