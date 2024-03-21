# Git Config

## Related

- [Git Workflow](/git/git-workflow.md)

## General Configuration

```sh
#
git config --list --show-origin

#
git config --global --edit

#
git config --global user.name '<Name>'
git config --global user.email '<email>'

#
git config --global init.defaultBranch 'main'

#
git config --global core.editor 'vim'

# Unix-like
git config --global core.excludesfile '~/.gitignore_global'
# Windows
git config --global core.excludesfile "%USERPROFILE%\.gitignore_global"

#
git config --global push.default 'current'

#
git config --global pull.rebase false

# Auto CRLF
git config core.autocrlf 'true' # Use `true`, `input` or `false`

# Merge
git config --global merge.tool 'value' # Use `vimdiff`

# Branch
git config --global branch.autosetupmerge 'always'

#
git config push.autoSetupRemote true
```

<!--
git push --set-upstream origin develop

git reflog
git checkout <sha8>

# Only repository
git config --bool core.bare true
-->

## Tips

### SSL CA Info

```sh
# Unset Certificate
git config --unset --system http.sslcainfo # System
git config --unset --global http.sslcainfo # Global

# SSL CA Info
git config --global http.sslcainfo '</path/to/certificate.pem>'
```

### Hooks

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

### Custom Config

```sh
#
tee /path/to/org/.gitconfig << EOF
[user]
	name = <Name>
	email = <name@xyz.tld>
EOF

#
tee -a ~/.gitconfig << EOF
[includeIf "gitdir:/path/to/org/"]
	path = /path/to/org/.gitconfig
EOF
```

**_Observation:_** Only works if have git initialized in the current folder.

```sh
#
git config --get user.name
git config --get user.email
```

**_Issues_** Remove, if have, `user.name` and `user.email` in project Git config: `cat ./.git/config`

### Proxy

```sh
#
git config --global http.proxy
git config --global https.proxy

#
export http_proxy=
export https_proxy=

# Local
git config http.proxy "$http_proxy"
git config https.proxy "$https_proxy"

# or
git config http.proxy 'http://[hostname]/proxy.pac'
git config https.proxy 'http://[hostname]/proxy.pac'

# Global
git config --global http.proxy "$http_proxy"
git config --global https.proxy "$https_proxy"

# or
git config --global http.proxy 'http://[hostname]/proxy.pac'
git config --global https.proxy 'http://[hostname]/proxy.pac'

# Bypass
git config --global http.proxy ''
git config --global https.proxy ''

# Unsetting
git config --global --unset http.proxy
git config --global --unset https.proxy

# Use HTTPS instead of SSH
git config --global url.'https://'.insteadOf git://
```

## Issues

### Missing Proxy

```log
gnutls_handshake() failed: Error in the pull function.
```

Just set proxy.
