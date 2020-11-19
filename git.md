# Git

## References

- [Changing Your Git Author Identity](https://www.git-tower.com/learn/git/faq/change-author-name-email)
- Guideline
  - [Commit Message Convention](https://reactiveui.net/contribute/software-style-guide/commit-message-convention)
  - [Commit messages guide](https://github.com/RomuloOliveira/commit-messages-guide)

## CLI

### Installation

#### Homebrew

```sh
brew install git
```

#### Zypper

```sh
sudo zypper refresh
sudo zypper install -y git-core
```

#### YUM

```sh
yum check-update
sudo yum -y install git
```

#### APT

```sh
sudo apt update
sudo apt -y install git
```

#### APK

```sh
sudo apk update
sudo apk add git
```

#### Chocolatey

```sh
choco install -y git
```

### Initialize

```sh
#
git init

#
git init --initial-branch='develop'
```

### Usage

```sh
# Create
git tag [version]

# Describe
git tag -a [version] -m [message]

# Push with Tags
git push origin master --tags

# List
git tag -l

# Checkout
git checkout tags/[version]

# Remote
git ls-remote --tags

# Delete
git tag -d [version]

# Remote
git push --delete origin [version]

# Update Index
git update-index --assume-unchanged [file]
git update-index --no-assume-unchanged [file]

# Prevent to receive changed files
git update-index --no-assume-unchanged [file]

# Ignore local changed files
git update-index --assume-unchanged [file]

# List files with `assume-unchanged`
git ls-files -v | grep '^h'
```

### Configuration

```sh
# List
git config --list --show-origin

# Edit
git config --global --edit

# Default Branch
git config --global init.defaultBranch 'develop'

# Default Editor
git config --global core.editor 'vim' # Vim
git config --global core.editor 'code -n -w' # Visual Studio Code

# Excludes file
git config --global core.excludesfile '~/.gitignore_global'

# Auto CRLF
git config core.autocrlf '[value]' # Use `true`, `input` or `false`

# Credential
git config --global credential.helper '[value]' # Use `cache`, `store` or `osxkeychain`

# User and Email
git config --global user.name '[Name]'
git config --global user.email '[email]'

# Merge
git config --global merge.tool [value] # Use `vimdiff`

# Push
git config --global push.default 'current'

# Branch
git config --global branch.autosetupmerge 'always'

# Unset Certificate
git config --unset --system http.sslcainfo # System
git config --unset --global http.sslcainfo # Global

# SSL CA Info
git config --global http.sslcainfo [/path/to/certificate.pem]

# Only repository
git config --bool core.bare true
```

### Tips

###

```sh
#
git fetch --all

#
git diff [tag]

#
git diff [tag] -- [path/to/file]

#
git difftool tags/<FIRST TAG>:<FILE PATH> tags/<SECOND TAG>:<FILE PATH>
```

#### Create a New Branch

```sh
# Creating a branch from a commit
git branch [branch-name] [hash]

# Creating a branch from a tag
git branch [branch-name] [tag-name]
```

#### Visual Studio Code

```sh
code \
  --install-extension codezombiech.gitignore \
  --install-extension sidneys1.gitconfig
```

#### Most recent changed branch

```sh
git for-each-ref --sort=committerdate refs/heads/ --format='%(committerdate:short) %(refname:short)'
```

#### Show latest committer

```sh
git for-each-ref \
  --sort=-committerdate refs/heads/ \
  --format='%(committerdate:short) %(authorname) %(refname:short)'
```

#### Run Push Subdirectories

```sh
find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c 'cd "{}" && git push' \;
```

<!-- ####

```sh
git rebase -i HEAD~10 -x "git commit --amend --author 'Author Name <author.name@mail.com>' --no-edit"
git rebase --root -i develop -x "git commit --amend --author 'Author Name <author.name@mail.com>' --no-edit"

git push -f
``` -->

#### Command-line completion

```sh
# Using Oh My Zsh
sed -ri 's/^plugins=\((.*)\)/plugins=\(\1 git\)/g' ~/.zshrc

source ~/.zshrc

rm ~/.zcompdump*
```

#### Pull Rebase

```sh
git config --global pull.rebase false
```

#### Version

```sh
# Current
git describe --tags

#
git describe --tags --abbrev=0

#
git describe --tags | sed 's/^v//'

#
git describe --tags | cut -d - -f 1 | sed 's/^v//'
```

#### Orphan Branch

```sh
git checkout --orphan [branch]
git rm -r .
```

#### Developer Certificate of Origin (DCO)

- [Reference](https://github.com/apps/dco)

```sh
# Commit
git commit -sm '[message]'

# Ammend
git commit --amend --signoff

# Push
git push --force-with-lease
```

#### Clean GitHub Pages

```sh
git clone --no-checkout [repo]
```

```sh
git checkout --orphan gh-pages
```

```sh
git rm -r .
git clean -fdx
git push origin gh-pages
```

<!-- ####

Access the top level directory where wish add child projects.

```sh
git config --global user.useconfigonly true
``` -->

#### Custom Git Config

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
# Need in git

#
git config --show-origin user.email

#
git config \
  -l \
  --show-origin
```

### Issues

#### Certificate

```log
SSL certificate problem: unable to get local issuer certificate
```

```sh
# Local
git config http.sslVerify false

# Or, global
git config --global http.sslVerify false

# Or, environment
GIT_SSL_NO_VERIFY=true git clone [repo]
```

#### Received HTTP code 502 from proxy after CONNECT

```log
Received HTTP code 502 from proxy after CONNECT
```

```sh
git config --unset http.sslVerify
```

#### RPC failed

```log
error: RPC failed; result=22, HTTP code = 411
```

```sh
git config http.postBuffer 524288000
```

#### Editor Issue

Output message after run `git commit --amend`:

```log
error: Terminal is dumb, but EDITOR unset
Please supply the message using either -m or -F option.
```

Solve this issue setting the `core.editor` value:

```sh
git config --global core.editor [value]
```

> Use `vim`, `atom --wait`, `subl -n -w` and `mate -w`.

```sh
export GIT_EDITOR=vim
```

#### Push

```log
error: src refspec project does not match any.
error: failed to push some refs to 'project@example.com:project'
```

```sh
git push -u origin master
```
