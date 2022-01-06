# Actions PHP

<!--
https://github.com/staudenmeir/laravel-adjacency-list/blob/master/.github/workflows/ci.yml

https://github.com/wp-cli/export-command/blob/4d3e920eae3f3a2f9a7eba1884ce0bbced837a95/.github/workflows/code-quality.yml
https://github.com/wp-cli/export-command/blob/4d3e920eae3f3a2f9a7eba1884ce0bbced837a95/.github/workflows/testing.yml
-->

## Links

- [Local Testing Setup](https://github.com/shivammathur/setup-php#local-testing-setup)

## Issues

### Wrong Platform Image

```log
php: error while loading shared libraries: libargon2.so.1: cannot open shared object file: No such file or directory
```

```sh
# For runs-on: ubuntu-latest
act -P ubuntu-latest=shivammathur/node:latest

# For runs-on: ubuntu-20.04
act -P ubuntu-20.04=shivammathur/node:2004

# For runs-on: ubuntu-18.04
act -P ubuntu-18.04=shivammathur/node:1804
```
