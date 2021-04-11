# PHP Debugging

## Dependencies

- [PHP Xdebug](/php-xdebug.md)
- [Xdebug Helper for Firefox](https://addons.mozilla.org/en-US/firefox/addon/xdebug-helper-for-firefox/)

## Visual Studio Code

### Installation

```sh
code --install-extension felixfbecker.php-debug
```

### Running

Verify if port 9000 is being used:

```sh
# Darwin
lsof -i :9000

# Linux
sudo lsof -i :9000
```

**PHP-FPM**: Change port 9000 if FPM is using it:

```sh
sed -i '/^xdebug.remote_port/ s/9000/9001/' "$(php -i | grep -oE /.+/php.ini)"
```

1. Debug
2. Configure or Fix 'launch.json'
3. PHP
4. Start Debugging

### Configuration

```jsonc
// Enable Log
{
  // ...
  "configurations": [
    {
      // ...
      "log": true
    }
  ]
}
```
