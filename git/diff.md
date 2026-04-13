# Git Difference (diff)

## Configuration

```sh
echo '/**/*.diff' >> ~/.gitignore_global
```

## Usage

```sh
#
git diff HEAD

#
git diff > ./file.path
git diff <./path/to/dir_file> > ./file.path

#
git apply ./file.path
```

<!--
#
git apply --3way --reject ./fix.patch
git apply --exclude=pnpm-lock.yaml ./fix.patch

pnpm install

git apply --reverse ./fix.patch
-->
