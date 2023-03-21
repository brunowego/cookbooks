# Git

<!--
Version 1.6 (2008)
Version 2.31
-->

**Keywords:** Source Code Management (SCM), Codebase, Version Control System (VCS)

## References

- [Changing Your Git Author Identity](https://www.git-tower.com/learn/git/faq/change-author-name-email)
- Guideline
  - [Commit Message Convention](https://reactiveui.net/contribute/software-style-guide/commit-message-convention)
  - [Commit messages guide](https://github.com/RomuloOliveira/commit-messages-guide)
- [Wiki](https://en.wikipedia.org/wiki/Git)
- [git-flow](/git-flow.md)
- [Version Control Systems: Distributed vs. Centralized](https://www.oshyn.com/blog/2012/06/version-control-systems-distributed-vs-centralized)

## Alternatives

- [Apache Subversion (SVN)](/apache/apache_subversion.md)
- Fossil
- [Mercurial](/mercurial.md)

## CLI

### Installation

#### Homebrew

```sh
brew install git
```

#### APT

```sh
sudo apt update
sudo apt -y install git
```

#### YUM

```sh
yum check-update
sudo yum -y install git
```

#### APK

```sh
sudo apk update
sudo apk add git
```

#### Zypper

```sh
sudo zypper refresh
sudo zypper install -y git-core
```

#### Chocolatey

```sh
choco install -y git
```

### Usage

```sh
# Initialize
git init
# or, define branch
git init --initial-branch='develop'

# Create
git tag <version>

# Describe
git tag -a <version> -m <message>

# Push with Tags
git push origin master --tags

# List
git tag -l

# Checkout
git checkout tags/<version>

# Remote
git ls-remote --tags

# Delete
git tag -d <version>

# Remote
git push --delete origin <version>

# Update Index
git update-index --assume-unchanged <file>
git update-index --no-assume-unchanged <file>

# Prevent to receive changed files
git update-index --no-assume-unchanged <file>

# Ignore local changed files
git update-index --assume-unchanged <file>

# List files with `assume-unchanged`
git ls-files -v | grep '^h'
```

<!-- #### Credentials

```sh
git credential fil

git credential reject
protocol=https
host=github.com

(echo url=https://token@github.com; echo ) | git credential reject

(echo url=https://github.com; echo ) | git credential fill

(echo url=https://github.com; echo username=token; echo password=secret; echo ) | git credential approve

git credential approve
``` -->

### Tips

#### Add Git Keep

```.gitignore
/cache/*
!/cache/.gitkeep
/logs/*
!logs/.gitkeep
```

#### Remove Local Branches Except Main

```sh
git branch --no-color | \
  grep -v 'master\|stable\|main' | \
    xargs git branch -d
```

#### Remove Merged Branches

```sh
git branch --merged | \
  egrep -v '(^\*|main)' | \
    xargs git branch -d
```

#### Tags

```sh
#
git tag -am 'Version 1.0.0' v1.0.0 master
git tag -am 'Version 1' v1 master

#
git tag -am 'Version 1.0.1' v1.0.1 master
git tag -am 'Version 1' --force v1 v1.0.1

#
git push --follow-tags
```

#### Merge Strategies

- Fast Forward Merge

  - No new commits on the base branch
  - No merge commit on the base branch when merged
  - Provides a linear history

  ```sh
  git rebase
  ```

- Recursive Merge

  - New commits on the base branch
  - A merge commit is created on the base branch
  - Merge commit has 2 parents with a true diverged history

  ```sh
  git merge --no-ff
  ```

#### Command-line completion

```sh
# Using Antigen
antigen bundle git
```

<!-- ###

```sh
#
git fetch --all

#
git diff <tag>

#
git diff <tag> -- <path/to/file>

#
git difftool tags/<FIRST TAG>:<FILE PATH> tags/<SECOND TAG>:<FILE PATH>
``` -->

#### Remote

```sh
#
git remote -v

#
git remote remove origin <url>
git remote add origin <url>

# or, using set-url
git remote set-url origin <url>
```

#### Create a New Branch

```sh
# Creating a branch from a commit
git branch <branch-name> <hash>

# Creating a branch from a tag
git branch <branch-name> <tag-name>
```

#### Visual Studio Code

```sh
#
code --install-extension mhutchie.git-graph

#
jq '."recommendations" += ["mhutchie.git-graph"]' "$HOME"/.vscode/extensions.json | sponge "$HOME"/.vscode/extensions.json
```

##### Search Exclusion

```sh
# Globally
jq '."search.exclude"."**/.git" |= true' "$HOME"/.vscode/settings.json | \
  sponge "$HOME"/.vscode/settings.json

# Locally
jq '."search.exclude"."**/.git" |= true' "$PWD"/.vscode/settings.json | \
  sponge "$PWD"/.vscode/settings.json
```

##### Files Exclusion

```sh
# Globally
jq '."files.exclude"."**/.git" |= false' "$HOME"/.vscode/settings.json | \
  sponge "$HOME"/.vscode/settings.json

# Locally
jq '."files.exclude"."**/.git" |= false' "$PWD"/.vscode/settings.json | \
  sponge "$PWD"/.vscode/settings.json
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

<!-- ####

```sh
#
git rebase -i HEAD~10 -x "git commit --amend --author 'Author Name <author.name@mail.com>' --no-edit"

#
git rebase --root -i develop -x "git commit --amend --author 'Author Name <author.name@mail.com>' --no-edit"

#
git push -f
``` -->

#### Command-line completion

```sh
# Using Oh My Zsh
sed -ri 's/^plugins=\((.*)\)/plugins=\(\1 git\)/g' ~/.zshrc

source ~/.zshrc

rm ~/.zcompdump*
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

#### Developer Certificate of Origin (DCO)

- [Reference](https://github.com/apps/dco)

```sh
# Commit
git commit -sm '<message>'

# Ammend
git commit --amend --signoff

# Push
git push --force-with-lease
```

#### Clean GitHub Pages

```sh
#
git clone --no-checkout <repo>

#
git checkout --orphan gh-pages

#
git clean -fdx

#
git push origin gh-pages
```

<!-- ####

Access the top level directory where wish add child projects.

```sh
git config --global user.useconfigonly true
``` -->

### Issues

#### TBD

```log
error: cannot lock ref 'refs/remotes/origin/Feat/HAB-337': unable to resolve reference 'refs/remotes/origin/Feat/HAB-337'
```

TODO

<!-- ```sh
rm ./.git/refs/remotes/origin/Feat/HAB-337

git fetch

git pull
``` -->

#### Missing Logs Directory

```log
error: cannot update the ref 'refs/remotes/origin/Feat/HAB-357': unable to create directory for '.git/logs/refs/remotes/origin/Feat/HAB-357': No such file or directory
```

```sh
mkdir ./.git/logs/refs/remotes/origin/Feat/HAB-357
```

#### Broken Reference

```log
error: cannot lock ref 'refs/remotes/origin/fix/dbml': 'refs/remotes/origin/fix' exists; cannot create 'refs/remotes/origin/fix/dbml'
```

```sh
git remote prune origin
```

<!--
git update-ref -d refs/tags
-->

#### Allow Unrelated Histories

```log
fatal: refusing to merge unrelated histories
```

```sh
git pull origin master --allow-unrelated-histories
```

<!-- #### Host Resolve

```log
fatal: unable to access 'https://domain.tld/organization/repository.git/': Could not resolve host: <hostname>
```

TODO -->

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
GIT_SSL_NO_VERIFY=true git clone <repo>
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
git config --global core.editor <value>
```

> Use `vim`, `atom --wait`, `subl -n -w` and `mate -w`.

```sh
export GIT_EDITOR=vim
```

#### Push

```log
error: src refspec project does not match any.
error: failed to push some refs to 'project@domain.tld:project'
```

```sh
git push -u origin master
```

<!--
## Interview

https://www.youtube.com/watch?v=bte3ozSIU_0
https://www.youtube.com/watch?v=Av5QlKEUOKo
https://www.youtube.com/watch?v=pdzwBHARHmU
-->
