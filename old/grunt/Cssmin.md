# Cssmin

```sh
npm install grunt-contrib-cssmin --save-dev
```

```js
grunt.loadNpmTasks('grunt-contrib-cssmin');
```

```js
// Minify CSS files into *.min.css
cssmin: {
  dist: {
    expand: true,
    src: [
      '*.css',
      '!*.min.css'
    ],
    dest: 'dist/',
    ext: '.min.css'
  }
}
```
