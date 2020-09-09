# Locale

## CLI

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Locale
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
```

```sh
sudo su - "$USER"
```

### Commands

```sh
man locale
```

### Usage

```sh
# Lists all public locales.
locale -a
```

### Issues

#### Set Default Locale

```log
Warning: Failed to set locale category LC_NUMERIC to en_BR.
Warning: Failed to set locale category LC_TIME to en_BR.
Warning: Failed to set locale category LC_COLLATE to en_BR.
Warning: Failed to set locale category LC_MONETARY to en_BR.
Warning: Failed to set locale category LC_MESSAGES to en_BR.
```

Just set `LANG` and `LC_ALL` on environment variables.
