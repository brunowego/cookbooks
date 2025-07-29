# Visual Studio Code Project Manager

## Installation

```sh
#
code --install-extension alefragnani.project-manager

#
jq '."recommendations" += ["alefragnani.project-manager"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

## Tips

### Backup

```sh
# Backup (VS Code)
cat ~/Library/Application\ Support/Code/User/globalStorage/alefragnani.project-manager/projects.json | gh gist create - -f vscode-project-manager

# Backup (Cursor)
cat ~/Library/Application\ Support/Cursor/User/globalStorage/alefragnani.project-manager/projects.json | gh gist create - -f cursor-project-manager

# Restore
gh gist list

# VS Code
gh gist view <hash> > ~/Library/Application\ Support/Code/User/globalStorage/alefragnani.project-manager/projects.json

# Cursor
gh gist view <hash> > ~/Library/Application\ Support/Cursor/User/globalStorage/alefragnani.project-manager/projects.json

history -r
```
