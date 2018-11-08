# OS X

## Installation

```sh
env \
  LDFLAGS="-L$(brew --prefix openssl)/lib" \
  CFLAGS="-I$(brew --prefix openssl)/include" \
  pip install scrapy
```
