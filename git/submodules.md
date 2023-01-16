# Git Submodules

## Usage

```sh
# Add
git submodule add <repo> ./<destination>

# Remove folder/module from git repository
git rm -r --cached <name>

# Update from submodule folder
cd <destination> && git pull

# Update all submodules
git submodule foreach git pull origin main

# Close with submodules
git clone --recursive <repo>
git submodule foreach git checkout main

# Get submodules from cloned repo
git submodule update --init --recursive
git submodule foreach git pull origin main
git submodule foreach git checkout main

# Sync
git submodule sync --recursive

# Update
git submodule update --init --recursive
```

<!-- git clone --single-branch --branch <branchname> <remote-repo> -->

<!-- ## Issues

### TBD

```log
fatal: No url found for submodule path '<name>' in .gitmodules
```

TODO -->
