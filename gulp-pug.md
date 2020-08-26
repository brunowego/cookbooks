# Gulp Pug

## Library

###

```js
.pipe(gulpData( file => ({
    require: require,
    fs : require("fs")
  })
))
```

```pug
- const icons = require('../src/images/icons/.codepoints.json')

ul.list.list--inline
  each code, name in icons
    unless name.endsWith('-x')
      li.list__item
        span.list__icon
          i.i(class='i--' + name)

          - let x = Object.keys(icons).includes(name + '-x');

          if x
            i.i(class='i--' + name + '-x')
```
