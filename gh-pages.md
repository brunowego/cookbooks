# gh-pages

## Links

- [Code Repository](https://github.com/tschaub/gh-pages)

## CLI

### Installation

#### NPM

```sh
npm install gh-pages --save-dev
```

### Commands

```sh
npx gh-pages -h
```

### Usage

```sh
#
gh-pages \
  -d ./dist \
  -e ./ \
  -r 'https://github.com/<owner>/<repository>.git'
```

### Tips

#### Repository Configuration

```sh
#
echo 'my.domain.com' > ./public/CNAME

#
git remote -v
git remote add pages 'https://github.com/<owner>/<repository>.git'
```

**Refer:** `./package.json`

```json
{
  "scripts": {
    "predeploy": "npm run build",
    "deploy": "gh-pages -d ./dist -o pages"
  }
}
```

For `grunt-contrib-copy` with `copy.js` task:

```js
module.exports = {
  build: {
    files: [
      {
        expand: true,
        dot: true,
        cwd: './public',
        dest: './dist',
        src: 'CNAME',
      },
    ],
  },
}
```

```sh
npm run deploy
```

#### DNS

```sh
| Type | Name | Value | TTL |
| --- | --- | --- | --- |
| A | @ | `185.199.108.153` | 600 seconds |
| A | @ | `185.199.109.153` | 600 seconds |
| A | @ | `185.199.110.153` | 600 seconds |
| A | @ | `185.199.111.153` | 600 seconds |
```

#### Subdomain

```sh
| Type | Host | Value | TTL |
| --- | --- | --- | --- |
| CNAME | `<subdomain>` | `<owner>.github.io` | 600 seconds |
```
