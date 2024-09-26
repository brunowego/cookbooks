# Playwright Codegen

## Links

- [Docs](https://playwright.dev/docs/codegen)

## Commands

```sh
playwright codegen -h
#
npx playwright codegen -h
```

## Usage

```sh
#
playwright codegen <url>
playwright codegen --save-storage './playwright/.auth/user.json' <url>
playwright codegen --load-storage './playwright/.auth/user.json' <url>

# Emulation
playwright codegen --viewport-size '800,600' <url>
playwright codegen --device 'iPhone 13' <url>
playwright codegen --color-scheme 'dark' <url>
playwright codegen --timezone 'Europe/Rome' --geolocation '41.890221,12.492348' --lang 'it-IT' <url>
```

## Issues

### Missing CLI

```log
sh: playwright: command not found
```

TODO

<!--
Try check if you are using Volta
Try change to another terminal
-->
