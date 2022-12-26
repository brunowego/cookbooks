# git-standup

## Links

- [Code Repository](https://github.com/kamranahmedse/git-standup)

## CLI

### Installation

#### Homebrew

```sh
brew install git-standup
```

### Commands

```sh
git standup -h
```

### Usage

```sh
#
git standup \
  -a 'Bruno Batista' \
  -A "$(date +%Y-%m-01) 00:00"
```

### Tips

#### Scan Projects

```sh
#
export GIT_AUTHOR_NAME='Bruno Batista'
export GIT_AFTER_DATE="$(date +%Y-%m-01) 00:00"

#
find . \
  -type d \
  -name '.git' \
  -exec bash \
  -c 'cd $(dirname "{}"); git standup -a "$GIT_AUTHOR_NAME" -A "$GIT_AFTER_DATE"' \;
```
