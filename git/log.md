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

### Total Commits by Hour

```log
#
git log --since="30 days ago" --pretty=format:"%ad" --date=format:"%Y-%m-%d %H" | \
  while read line; do \
    date_part=$(echo $line | cut -d' ' -f1); \
    hour_part=$(echo $line | cut -d' ' -f2); \
    weekday=$(date -jf "%Y-%m-%d" "$date_part" "+%u"); \
    if [ "$weekday" -lt 6 ]; then echo "$hour_part"; fi; \
  done | sort | uniq -c
```

<!--
git log --since="30 days ago" --pretty=format:"%ad" --date=format:"%H" | sort | uniq -c
-->

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

<!--
git log --pretty=format:"%h,%an,%ad,%s" --date=iso > commits.csv
-->
