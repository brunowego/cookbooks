# PHP Docker

##

```Dockerfile
FROM docker.io/library/php:8-alpine

RUN apk add -q --no-cache -t .build-deps \
      [package]==[version]

RUN pecl install xdebug && \
      docker-php-ext-enable xdebug

RUN apk del --purge .build-deps
```
