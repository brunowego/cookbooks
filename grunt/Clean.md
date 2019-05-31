# Clean

```sh
npm install grunt-contrib-clean --save-dev
```

```js
grunt.loadNpmTasks('grunt-contrib-clean');
```

```js
// Empties folders to start fresh
clean: {
  dist: {
    src: ['dist/']
  }
}
```
