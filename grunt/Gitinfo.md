# Gitinfo

```sh
npm install -g grunt-gitinfo
```

```js
grunt.loadNpmTasks('grunt-gitinfo');
```

```js
// Get info about Git
gitinfo: {
  commands: {
    'tag': ['describe', '--abbrev=0', '--tags']
  }
}
```
