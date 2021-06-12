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

### Usage

```sh
# Real-Time HTML Output
goaccess \
  /var/log/nginx/access.log \
  -o /var/www/html/report.html \
  --log-format=COMBINED \
  --real-time-html
```
