# Tips

## Change permissions

```sh
sudo find . -type d -exec chmod 755 {} \;
sudo find . -type f -exec chmod 644 {} \;
```

## Find and remove

```sh
find . -type f -name [filename] -exec rm -f {} \;
```

## Create directory for every file and move

```sh
find *.md -prune -type f -exec sh -c 'mkdir -p "${0%.*}" && mv "$0" "${0%.*}"' {} \;
```

## Create file each sub-directory

```sh
find . -type d -exec touch {}/"${name}" \;
```

## Whitespace to underline

```sh
find . -depth -name '* *' -execdir rename 's/ /_/g' '{}' \;
```

## Run in each subdirectory

```sh
find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c 'cd "{}" && pwd' \;
```

## Replace multiple files

```sh
find . -iname '*.txt' -exec bash -c 'mv "$0" "${0%\.txt}.md"' {} \;
```

## Remove underscore from start of name file

```sh
find . -type f -name '_*' -exec sh -c 'd=$(dirname "$1"); mv "$1" "$d/$(basename "$1" | tr -d _)"' sh {} \;
```

## Add underscore at start of name file

```sh
find . -type f -name '*' -exec sh -c 'd=$(dirname "$1"); mv "$1" "$d/_$(basename "$1")"' sh {} \;
```
