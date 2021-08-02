# GitHub Pages

## CLI

### Installation

#### NPM

```sh
npm install gh-pages -D
```

### Configuration

```sh
#
echo 'my.domain.com' > ./public/CNAME

#
git remote -v
git remote add pages https://github.com/[]/[repository].git
```

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
    files: [{
      expand: true,
      dot: true,
      cwd: './public',
      dest: './dist',
      src: 'CNAME'
    }]
  }
};
```

```sh
npm run deploy
```

### Tips

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
| CNAME | `[subdomain]` | `[username].github.io` | 600 seconds |
```
