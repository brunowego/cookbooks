# Config

## Core

### Editor

```sh
git config --global core.editor vim
```

### Excludes file

```sh
git config --global core.excludesfile '~/.gitignore_global'
```

### Auto CRLF

```sh
git config core.autocrlf [value]
```

> Use `true`, `input` or `false`.

## Credential

```sh
git config --global credential.helper [value]
```

> Use `cache`, `store` or `osxkeychain`.

## User

```sh
git config --global user.name '[Name]'
```

```sh
git config --global user.email [email]
```

## Merge

```sh
git config --global merge.tool [value]
```

> Use `vimdiff`.

## Push

```sh
git config --global push.default current
```

## Branch

```sh
git config --global branch.autosetupmerge always
```

## List

```sh
git config --list --show-origin
```

## Edit

```sh
git config --global --edit
```

## Certificate

### Unset

#### System

```sh
git config --unset --system http.sslcainfo
```

#### Global

```sh
git config --unset --global http.sslcainfo
```

## SSL CA Info

```sh
git config --global http.sslcainfo [/path/to/certificate.pem]
```

## Only repository

```sh
git config --bool core.bare true
```
