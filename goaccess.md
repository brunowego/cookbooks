# GoAccess

## CLI

### Installation

#### Homebrew

```sh
brew install goaccess
```

### Commands

```sh
goaccess -h
```

### Examples

### Real-Time HTML Output

```sh
goaccess \
  access.log \
  -o /var/www/html/report.html \
  --log-format=COMBINED \
  --real-time-html
```
