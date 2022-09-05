# Visual Studio Theme

## Material Theme

```sh
# Install
code --install-extension zhuangtongfa.Material-theme

# Recommendations
jq '."recommendations" += ["zhuangtongfa.Material-theme"]' "$HOME/.config/Code/User/extensions.json" | sponge "$HOME/.config/Code/User/extensions.json"

# Apply
jq '."workbench.colorTheme" |= "One Dark Pro"' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
```
