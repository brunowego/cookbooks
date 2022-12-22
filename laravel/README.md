# Laravel

<!--
https://www.youtube.com/watch?v=MFh0Fd7BsjE
https://linkedin.com/learning/topics/laravel?entityType=COURSE&sortBy=RECENCY

https://spatie.be/videos/readable-laravel/improving-readability-by-decreasing-indentation
https://spatie.be/products/laravel-beyond-crud
https://spatie.be/videos/laravel-package-training
https://github.com/lucid-architecture/laravel
https://github.com/arquivei/laravel-prometheus-exporter
https://www.especializati.com.br/curso-laravel-multi-tenancy-single-database#comprar
-->

**Keywords:** PHP Framework

## Links

- [Laravel Tips](https://github.com/LaravelDaily/laravel-tips)

## App

### Stack

- [Laravel Blade](/laravel/laravel-blade.md)
- [Laravel Mix](/laravel/laravel-mix.md)

### Tools

- [Sentry](https://sentry.io/for/laravel/)
- [PsySH](/psysh.md)

### Installation

#### Composer

```sh
composer create-project laravel/laravel %s --prefer-dist
```

### Commands

```sh
./artisan -h
```

### Usage

```sh
#
./artisan serve \
  --host 0.0.0.0 \
  --port 8080
```

<!--
#
./artisan translate:files
-->

#### Cache

```sh
#
./artisan optimize:clear

#
./artisan config:clear
./artisan cache:clear
./artisan route:clear
./artisan view:clear
./artisan clear-compiled
```

#### Migrate

```sh
#
./artisan make:migration create_flights_table
./artisan make:migration add_destination_to_flights_table

#
./artisan config:clear

#
./artisan migrate:status

#
./artisan migrate

#
./artisan db:seed
./artisan db:seed --force
```

<!--
./artisan migrate:fresh
-->

#### Test

```sh
#
./artisan test
```

### Tips

#### Command-line completion

```sh
# Using Antigen
antigen bundle jessarcher/zsh-artisan

# Using Oh My Zsh
git clone 'https://github.com/jessarcher/zsh-artisan.git' ~/.oh-my-zsh/custom/plugins/artisan

sed -ri 's/^plugins=\((.*)\)/plugins=\(\1 artisan composer\)/g' ~/.zshrc

source ~/.zshrc

rm ~/.zcompdump*
```

#### Create User

```sh
./artisan tinker
```

```php
>>> $user = new App\User();
>>> $user->password = Hash::make('Pa$$w0rd!');
>>> $user->email = 'user@example.com';
>>> $user->name = 'John Doe';
>>> $user->username = 'johndoe';
>>> $user->save();
>>>
>>> exit
```

#### Generate Hashed Password

```sh
./artisan tinker
```

```php
>>> echo Hash::make('Pa$$w0rd!');
>>>
>>> exit
```

### Issues

#### Missing Laravel Mix Build

```log
PHP Fatal error:  Uncaught Exception: The Mix manifest does not exist.
```

```sh
#
npm install

#
npm run dev # prod
```

#### App Key

```log
The only supported ciphers are AES-128-CBC and AES-256-CBC with the correct key lengths.
```

```sh
#
./artisan key:generate
# or
echo 'yes' | ./artisan key:gen

#
./artisan config:cache
```

## Dockerfile

### Image

#### Build

<!-- ```Dockerfile

``` -->

```sh
#! /bin/sh

if [ ! -f /var/www/html/.env ]; then
    mv env-example .env
    php artisan key:generate
fi

php artisan optimize
php artisan config:cache
php artisan route:cache
php artisan view:cache

pushd /var/www/html
  composer update --no-plugins --no-scripts

  php artisan migrate
  php artisan db:seed
popd

exec "$@"
```

<!-- ####

```Dockerfile
FROM docker.io/library/python:3.7-alpine

WORKDIR /usr/src/app

RUN apk add -q --no-cache -t .build-deps \
      gettext==0.20.2-r0 \
      gettext-dev==0.20.2-r0

COPY ./requirements.txt ./

RUN pip3 install --no-cache-dir -r ./requirements.txt

RUN ./manage.py compilemessages

RUN apk del --purge .build-deps

COPY ./ ./

EXPOSE 5000

CMD ["gunicorn", "-b", "0:5000", "-k", "eventlet", "app:app"]
``` -->
