# Visual Studio Code Project Manager

## Installation

```sh
#
code --install-extension alefragnani.project-manager

#
jq '."recommendations" += ["alefragnani.project-manager"]' "$PWD"/.cursor/extensions.json | sponge "$PWD"/.cursor/extensions.json
```

## Tips

### Backup

```sh
# Backup
cat ~/Library/Application\ Support/Cursor/globalStorage/alefragnani.project-manager/projects.json | gh gist create - -f cursor-project-manager

# Restore
gh gist list
gh gist view <hash> > ~/Library/Application\ Support/Cursor/User/globalStorage/alefragnani.project-manager/projects.json

history -r
```
