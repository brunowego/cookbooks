# Issues

## Binary Used

> npm WARN lifecycle The node binary used for scripts is /Users/[username]/.asdf/shims/node but npm is using /Users/[username]/.asdf/installs/nodejs/9.6.1/bin/node itself. Use the `--scripts-prepend-node-path` option to include the path for the node binary npm was executed with.

```sh
npm config set scripts-prepend-node-path true
```

## No Description

> npm WARN package.json engine@ No description

```json
{
  "description": "The JavaScript Task Runner"
}
```

## No Repository Field

> npm WARN package.json engine@ No repository field.

```json
{
  "repository": {
    "type": "git",
    "url": "git://github.com/gruntjs/grunt.git"
  }
}
```

## No README Data

> npm WARN package.json engine@ No README data

```sh
touch README.md || exit
```
