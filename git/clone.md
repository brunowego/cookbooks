# Git Clone

## Usage

```sh
#
git clone <repo>

#
git clone <repo> </path/to/folder> && cd "$_"
```

## Tips

### Specific Branch

```sh
git clone \
  --branch <branch> \
  --single-branch \
  --depth <depth> \
  <repo>
```

| Param     | Value |
| --------- | ----- |
| `--depth` | `1`   |

### Root Permissions

```sh
#
sudo mkdir -p </path/to/folder> && cd "$_"

#
sudo chown "$(whoami)": ./

#
git clone <repo> ./
```

### Clone All Repos

**Dependencies:** [GitHub CLI](/github/README.md#cli)

```sh
gh repo list <owner> --limit 1000 | \
  awk '{print $1; }' | \
    xargs -L1 gh repo clone
```
