# Configuration

## Set

```sh
npm set registry http://0.0.0.0:4873
npm set always-auth true
```

## User

```sh
npm adduser --registry http://0.0.0.0:4873
```

```sh
npm login
```

## Project

### package.json

```json
[...]
"publishConfig": {
  "registry": "http://0.0.0.0:4873"
}
[...]
```

### .npmrc

```sh
touch .npmrc || exit
```

```ini
registry = http://0.0.0.0:4873
```
