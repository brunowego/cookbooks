# PHP Docker

## Dockerfile

```Dockerfile
FROM docker.io/library/php:8-alpine AS build

WORKDIR /usr/src/app

COPY --from=docker.io/library/composer /usr/bin/composer /usr/bin/composer

COPY ./composer.* ./

RUN composer install --no-dev


FROM docker.io/library/php:8-alpine

RUN apk add -q --no-cache -t .build-deps \
      [package]==[version]

RUN pecl install xdebug && \
      docker-php-ext-enable xdebug

WORKDIR /usr/src/app

COPY --from=build /usr/src/app ./

RUN apk del --purge .build-deps
```
