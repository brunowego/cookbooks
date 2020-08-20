# WP-CLI

## CLI

### Installation

#### Homebrew

```sh
brew install wp-cli
```

#### Unix-like

```sh
# GNU Wget
wget -O /usr/local/bin/wp 'https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar' && \
  chmod +x /usr/local/bin/wp

# cURL
curl -L 'https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar' -o /usr/local/bin/wp && \
  chmod +x /usr/local/bin/wp
```

### Commands

```sh
wp help
```

### Usage

```sh
# Debug mode
wp config set WP_DEBUG true --raw
wp config set WP_DEBUG_LOG true --raw
wp config set WP_DEBUG_DISPLAY false --raw

clear; tail -f ./wp-content/debug.log -n 0

# wp option delete core_updater.lock
```

#### Database

```sh
#
wp db size \
  --size_format=mb \
  --tables

#
wp db export
```

#### Core

```sh
#
wp core download \
  --path='wp' \
  --locale='pt_BR' \
  --version='5.3.2' \
  --skip-content

#
wp core version

#
wp core verify-checksums

#
wp core check-update
wp core update --version=5.3.0
```

#### Config

```sh
wp config create \
  --dbname='wordpress_dev' \
  --dbuser='wordpress' \
  --dbpass='wordpress' \
  --dbhost='127.0.0.1' \
  --path='./wp'

wp config get
wp config path
```

#### Post

```sh
wp post list

#
wp post create <(cat << EOF
Example of content...
EOF
) \
  --post_type='page' \
  --post_status='publish' \
  --post_title='[Title]'

#
wp post delete 1

#
wp post generate --count=5
```

#### User

```sh
wp user list

#
wp user create --prompt

#
wp user remove-role 1

#
wp user add-cap 2 activate_plugins
```

#### Plugin

```sh
wp plugin list

#
wp plugin install [name] --activate
```

#### Theme

```sh
wp theme list

#
wp theme activate [name]
```

#### Package

```sh
wp package list
```

#### Site

```sh
wp site empty --yes
```

#### Rewrite

```sh
wp rewrite structure '/%postname%'
```

#### Menu

```sh
wp menu create 'About'

wp menu item add-custom home 'About' / --target=about
```

#### Scaffold

##### Theme

```sh
wp scaffold _s [name] \
  --theme_name='[Name]' \
  --author='[Fname Lname]'

## Tests
wp scaffold theme-tests \
  --theme \
  --prompt

## Child
wp scaffold child-theme \
  --theme \
  --prompt
```

##### Plugin

```sh
wp scaffold plugin --prompt
```

##### Post Type

```sh
wp scaffold post-type \
  --theme \
  --prompt
```

```sh
cat << EOF >> $(wp eval 'echo get_theme_file_path("functions.php") . "\n";')
/**
 * Custom Post Types.
 */
require get_template_directory() . '/post-types/[name].php';

EOF
```

To add support for other fields, edit `./post-types/[name].php` inside current theme and change the `supports` param adding one or more of this values in array: `title`, `editor`, `thumbnail`, `excerpt`, `comments` and `custom-fields`.

##### Taxonomy

```sh
wp scaffold taxonomy \
  --theme \
  --prompt
```

##### Media

```sh
wp media regenerate --yes
```

##### Block

```sh
wp scaffold block \
  --theme \
  --prompt
```

#### Transient

```sh
wp transient list

#
wp transient delete --all
```

### Packages

#### Admin Command

```sh
php \
  -d memory_limit=8G \
  "$(which wp)" package install wp-cli/admin-command

#
wp admin
```

#### Revisions

```sh
php \
  -d memory_limit=8G \
  "$(which wp)" package install trepmal/wp-revisions-cli

#
wp revisions list
wp revisions list \
  --post_id=1
wp revisions clean \
  --before-date=2019-01-01
```

### Plugins

#### Jetpack

```sh
wp plugin install jetpack --activate

#
wp jetpack module activate contact-form
```

### Tips

#### Command-line completion

```sh
# Using Bash (Homebrew)
brew install bash-completion wp-cli-completion

# Using Oh My Zsh
sed -ri 's/^plugins=\((.*)\)/plugins=\(\1 wp-cli\)/g' ~/.zshrc

source ~/.zshrc

rm ~/.zcompdump*
```

#### Login URL

```sh
wp eval 'echo "[INFO]\t" . wp_login_url() . "\n";'
```

### Issues

#### WebP Converter

```log
WebP Converter for Media (Error): Server configuration: "imagewebp" function is not available.
```

TODO
