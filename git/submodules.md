# Git Submodules

## Usage

```sh
# Add
git submodule add <repo> <./path/to/destination>

# Update
git submodule update --remote
```

<!--
git submodule foreach git checkout <branch>
git submodule foreach git pull origin <branch>

git submodule sync --recursive
git submodule update --recursive
git submodule update --remote --merge

git clone --single-branch --branch <branchname> <remote-repo>
-->

## Tips

### Remove Submodule

```sh
#
git submodule deinit -f <./path/to/submodule>

#
rm -fR ./.git/modules/<path/to/submodule>

#
git rm -f <./path/to/submodule>
```

### Clone with Submodules

```sh
#
git clone --recursive <repo>
```

<!-- ## Issues

### TBD

```log
fatal: No url found for submodule path '<name>' in .gitmodules
```

TODO -->
