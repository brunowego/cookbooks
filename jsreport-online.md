# jsreport online

<!--
https://jsreport.net/learn/docker
https://github.com/jsreport/website/blob/master/_posts/rendering-pdf-reports-in-azure-mobile-services.md
-->

## Links

- [Main Website](https://jsreport.net/online)
- [Playground](https://jsreport.net/playground)

## Guides

- [API](https://jsreport.net/learn/api)

## CLI

### Links

- [Docs](https://jsreport.net/learn/cli)

### Installation

#### Homebrew

```sh
npm install @jsreport/jsreport-cli -g
```

## Library

### Installation

#### NPM

```sh
npm install jsreport-client --save-dev
```

### Commands

```sh
jsreport -h
```

### Usage

```sh
#
jsreport init

#
jsreport start --httpPort 6000
```

<!--
#
jsreport render \
  --template.name MyTemplate \
  --data ./mydata.json \
  --out ./myreport.xlsx

#
jsreport render \
  --serverUrl http://jsreport.com \
  --user [username] \
  --password [password]
-->

### REPL

<!-- ```js
.editor

require('request').post({
  uri: 'https://playground.jsreport.net/api/report',
  body: {
    template: {
      content: '<h1>Hello from jsreport</h1>',
      recipe:'phantom-pdf',
      engine: 'jsrender'
    }
  },
  json: true
})

// hit: Ctrl +D

.exit
``` -->

```js
.editor

const client = require('jsreport-client')('https://playground.jsreport.net/', '[username]', '[password]')

const rendered = await client.render({
  'template': {
    'content': 'Hello world {{name}}',
    'recipe': 'chrome-pdf',
    'engine': 'handlebars',
    'chrome': {
      'landscape': true
    }
  },
  'data': { 'name': 'hello' }
})

await rendered.body()

// hit: Ctrl +D

.exit
```
