# Git

```sh
npm install grunt-git --save-dev
```

```js
grunt.loadNpmTasks('grunt-git');
```

```js
// Commit, tag, and push the new version
gitcommit: {
  version: {
    options: {
      message: 'New version: <%= pkg.version %>'
    },
    files: {
      // Specify the files you want to commit
      src: [
        'style.css',
        'package.json',
        'functions.php'
      ]
    }
  }
},

gittag: {
  version: {
    options: {
      tag: '<%= pkg.version %>',
      message: 'Tagging version <%= pkg.version %>'
    }
  }
},

gitpush: {
  version: {},
  tag: {
    options: {
      tags: true
    }
  }
}
```
