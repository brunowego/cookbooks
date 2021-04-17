# Gitinfo

```sh
npm install grunt-gitinfo -g
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
