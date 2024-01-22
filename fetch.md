# fetch

## Links

- [Code Repository](https://github.com/gruntwork-io/fetch)

## CLI

### Installation

#### Homebrew

```sh
brew install fetch
```

### Usage

```sh
#
export GITHUB_OAUTH_TOKEN='<token>'

#
fetch \
  --repo 'https://github.com/<owner>/<repo>' \
  --branch '<branch>' \
  --source-path '<absolute/path/to/file-or-folder>' \
  './<path/to/file-or-folder>'
```
