# FastCGI

## CLI

### Installation

#### Homebrew

```sh
brew install fcgi
```

#### YUM

```sh
yum check-update

# Repo: EPEL
sudo yum -y install fcgi
```

### Commands

```sh
cgi-fcgi
```

### Health Check

```sh
# PHPBrew
phpbrew fpm current
```

### Usage

```sh
# Simple
cgi-fcgi -bind -connect '127.0.0.1:9000'

# Ping
SCRIPT_NAME='/ping' \
  SCRIPT_FILENAME='/ping' \
  REQUEST_METHOD='GET' \
  cgi-fcgi -bind -connect '127.0.0.1:9000'; echo

# Status
SCRIPT_NAME='/status' \
  SCRIPT_FILENAME='/status' \
  QUERY_STRING='' \
  REQUEST_METHOD='GET' \
  cgi-fcgi -bind -connect '127.0.0.1:9000'; echo
```

<!-- #### Application

```sh
SCRIPT_NAME=/index.php \
  SCRIPT_FILENAME=/index.php \
  QUERY_STRING= \
  DOCUMENT_ROOT=/var/www/html \
  REQUEST_METHOD=GET \
  cgi-fcgi -bind -connect 127.0.0.1:9000
``` -->
