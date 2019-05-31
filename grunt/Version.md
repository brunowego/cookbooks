# Version

```sh
npm install grunt-version --save-dev
```

```js
grunt.loadNpmTasks('grunt-version');
```

```js
// Bump version numbers
version: {
  css: {
    options: {
      prefix: 'Version\\:\\s'
    },
    src: ['style.css']
  },
  php: {
    options: {
      prefix: '\@version\\s+'
    },
    src: ['functions.php']
  }
}
```

- CSS prefix: `Version: x.x.x`
- PHP prefix: `@version: x.x.x`

```sh
grunt version
grunt version:css
```
