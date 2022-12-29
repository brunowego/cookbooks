# Git Log

## Usage

```sh
# Authors
git log | grep Author: | sort -u

# Names
git shortlog -s | cut -c8-
```

## Tips

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
