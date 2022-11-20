# Git Configu

## Hooks

```sh
#
mkdir -p ~/.config/git/hooks

#
cat << EOF >> ~/.config/git/config
[core]
	hooksPath = ~/.config/git/hooks
EOF

#
echo '#! /bin/bash\n' > ~/.config/git/hooks/pre-commit

#
git config --get core.hookspath
```
