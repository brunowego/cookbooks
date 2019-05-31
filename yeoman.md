# Yeoman

## Installation

### NPM

```sh
npm install -g yo
```

## Issues

### Permission denied

> Yeoman error: “Errno::EACCES on line [”897“] of C: Permission denied”

Remove gems

```sh
gem uninstall sass
gem uninstall compass
```

Install gems

```sh
gem install compass --pre
gem install sass --pre
```

### No "concat" targets found

First check the order of build task.

By default, your `index.html`'s <!-- Usemin block --> will take care of minification. These next options are pre-configured if you do not wish to use the Usemin blocks.
