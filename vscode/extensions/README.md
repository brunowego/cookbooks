# Visual Studio Code (a.k.a. VS Code) Extensions

## Usage

```sh
# Open without extensions
code ./ --disable-extensions

# List installed
code --list-extensions

# Install extension
code --install-extension <extension>

# Disable
code --disable-extension <extension>

# Uninstall
code --uninstall-extension <extension>
```

## Tips

### All Extensions

```sh
# Upgrade
code --list-extensions | while read extension; do
  code --install-extension "$extension" --force
done

# Disable
code --list-extensions | while read extension; do
  code --disable-extension "$extension" --force
done

# Uninstall
code --list-extensions | while read extension; do
  code --uninstall-extension "$extension" --force
done
```
