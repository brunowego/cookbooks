# Git Config

## Custom

Access the top level directory where wish add child projects.

```sh
git config --global user.useconfigonly true
```

```sh
tee -a ~/.gitconfig << EOF
[includeIf "gitdir:$PWD/"]
	path = ~/.gitconfig-[vendor]
EOF
```

```sh
tee ~/.gitconfig-[vendor] << EOF
[http]
	sslVerify = false
[user]
	email = [name@example.com]
EOF
```

```sh
#
git config --show-origin user.email

#
git config \
  -l \
  --show-origin
```

## Issues

<!-- ###

```sh
cat /usr/local/etc/gitconfig

rm -rf /usr/local/etc/gitconfig
``` -->
