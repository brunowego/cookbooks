# np

## CLI

### Installation

#### NPM

```sh
npm install np -D
```

### Configuration

```sh
cat << EOF > ./.np-config.json
{
  "anyBranch": true,
  "yolo": true
}
EOF
```

**Refer:** `./package.json`

```js
{
  "scripts": {
    "publish": "np"
  }
}
```
