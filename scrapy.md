# Scrapy

<!--
https://app.pluralsight.com/library/courses/scrapy-extracting-structured-data/table-of-contents
https://app.pluralsight.com/guides/web-scraping-with-scrapy
https://app.pluralsight.com/guides/implementing-web-scraping-with-scrapy
https://app.pluralsight.com/guides/crawling-web-python-scrapy
-->

## CLI

### Installation

#### PIP

```sh
pip install -U scrapy
```

### Commands

```sh
scrapy -h
```

### Usage

```sh
# Create project
scrapy startproject [pname]
```

### Issues

#### OpenSSL

```sh
# Darwin
LDFLAGS="-L$(brew --prefix openssl)/lib" \
  CFLAGS="-I$(brew --prefix openssl)/include" \
  pip install -U scrapy
```
