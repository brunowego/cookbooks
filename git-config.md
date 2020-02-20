# Git Config

## Custom

Access the top level directory where wish add child projects.

```sh
tee -a ~/.gitconfig << EOF
[includeIf "gitdir:$PWD/"]
	path = $PWD/.gitconfig
EOF
```

```sh
tee ./.gitconfig << EOF
[http]
	sslVerify = false
[user]
	email = [name@example.com]
EOF
```

```sh
git config \
  -l \
  --show-origin
```
