# Web-ext

<!--
https://www.udemy.com/course/the-complete-web-extensions-development-course-zero-to-hero/
-->

## Links

- [Code Repository](https://github.com/mozilla/web-ext)

## Docs

- [Getting started with web-ext](https://extensionworkshop.com/documentation/develop/getting-started-with-web-ext/)

## CLI

### Installation

#### NPM

```sh
# Using NPM
npm install web-ext -g

# Using Yarn v1.x
yarn global add web-ext
```

### Commands

```sh
#
web-ext -h
```

### Usage

```sh
# https://addons.mozilla.org/developers/addon/api/key/

web-ext sign \
  --api-key {{api_key}} \
  --api-secret {{api_secret}}

#
web-ext lint

#
web-ext build

#
web-ext run \
  --source-dir ./extension-dist/
```

### Issues

#### Missing Firefox

```log
Running web extension from /absolute/path/to/app
Error: spawn /Applications/Firefox.app/Contents/MacOS/firefox-bin ENOENT
    at Process.ChildProcess._handle.onexit (internal/child_process.js:267:19)
    at onErrorNT (internal/child_process.js:469:16)
    at processTicksAndRejections (internal/process/task_queues.js:84:21)
make: *** [run] Error 1
```

```sh
web-ext run \
  --firefox='/Applications/Firefox Developer Edition.app/Contents/MacOS/firefox-bin'
```
