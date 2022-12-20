# Symfony

<!--
https://linkedin.com/learning/learning-symfony-4/build-web-apps-with-symfony
https://symfony.com/doc/current/configuration.html#configuration-secrets
-->

## Links

- [Code Repository](https://github.com/symfony/symfony)
- [Main Website](https://symfony.com)
- [Symfony Releases](https://symfony.com/releases/)

## Solution

### Bundles

- [Flagception](https://github.com/bestit/flagception-bundle)

## CLI

### References

- [Symfony Documentation](https://symfony.com/doc/current/index.html#gsc.tab=0)

### Dependencies

- [PHP](/php/README.md)
- [Composer](/composer.md)

### Installation

#### Unix-like

```sh
curl -sS 'https://get.symfony.com/cli/installer' | \
  /bin/bash
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Symfony
export PATH="$HOME/.symfony/bin:$PATH"
```

```sh
sudo su - "$USER"
```

### Commands

```sh
symfony -h
```

### Usage

**Note:** Available versions: `lts`, `stable`, `next`, or `previous`.

```sh
#
symfony new --version=lts [name] && cd "$_"

#
symfony server:ca:install
symfony server:start

#
symfony server:start --no-tls

#
symfony check:security

#
php ./bin/console secrets:generate-keys

#
php ./bin/console cache:clear --no-warmup
php ./bin/console assets:install --no-interaction
```

### Tips

#### HTTP Error 500 (Enable Debug)

If showing HTTP error 500, try set `debug` to `true` in `./public/index.php`.

#### Migrations

**Bundles:** [DoctrineMigrationsBundle](https://symfony.com/bundles/DoctrineMigrationsBundle/current/index.html)

```sh
#
php ./bin/console doctrine:migrations:list

#
php ./bin/console doctrine:migrations:status

#
php ./bin/console doctrine:migrations:migrate
```

#### Git Attributes

Add [text rules](/gitattributes.md#text)

```sh
echo '/symfony.lock export-ignore' >> ./.gitattributes
```

### Issues

#### Missing Requirements

```log
Could not find package symfony/skeleton with version 5.4.* in a version installable using your PHP version, PHP extensions and Composer version.
```

```sh
symfony check:requirements
```

#### Missing Symfony CMD

```log
sh: symfony-cmd: command not found
Script symfony-cmd handling the auto-scripts event returned with error code 127
Script @auto-scripts was called via post-install-cmd
```

```sh
composer install \
  --no-scripts
```

<!--
php composer.phar update symfony/flex --no-plugins --no-scripts
-->

<!-- ####

```log
Error: Uncaught RuntimeException: Unable to create the "cache" directory (/var/www/app/var/cache/dev). in /var/www/app/vendor/symfony/http-kernel/Kernel.php:637
``` -->

<!--
env | grep MESSENGER_TRANSPORT_DSN
-->
