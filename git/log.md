# Git Log

## Usage

```sh
# Authors
git log | grep Author: | sort -u

# Names
git -P shortlog -s | cut -c8-
git -P shortlog -sn
```

## Tips

### Get First Commit

```sh
#
git log --reverse

#
git log --pretty=oneline --reverse | head -1

#
git log $(git log --pretty=format:%H|tail -1)
```

### Scan Projects

```sh
#
find . \
  -type d \
  -name '.git' \
  -exec bash \
  -c 'cd $(dirname "{}"); git log | grep Author: | sort -u' \;
```

<!--
https://dedupelist.com/#startresults
https://textfixer.com/tools/remove-duplicate-lines.php
-->
