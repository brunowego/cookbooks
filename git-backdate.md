# git-backdate

<!--
https://github.com/bdrupieski/GitCommitDateFaker
-->

## Links

- [Code Repository](https://github.com/rixx/git-backdate)

## CLI

### Installation

```sh
curl https://raw.githubusercontent.com/rixx/git-backdate/main/git-backdate > /usr/local/bin/git-backdate
chmod +x /usr/local/bin/git-backdate
```

### Commands

```sh
git backdate -h
```

### Usage

```sh
git backdate --business-hours --log-level=DEBUG main '10 days ago..today'
```

### Issues

#### TBD

```log
[INFO] Found 0 commits to backdate
```

TODO

#### Missing Linux Date Command

```log
date: illegal option -- -
```

Try install [GNU Core Utilities](/gnu/coreutils.md) and run the command again.
