# Compress

```sh
npm install grunt-contrib-compress --save-dev
```

```js
grunt.loadNpmTasks('grunt-contrib-compress');
```

```js
// Compress the build folder into an upload-ready zip file
compress: {
  dist: {
    options: {
      mode: 'zip',
      archive: 'dist.zip'
    },
    expand: true,
    dot: true,
    cwd: 'dist/',
    src: ['**/*'],
    dest: '.'
  }
}
```
