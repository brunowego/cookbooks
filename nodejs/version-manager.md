# Node.js Version Manager

## Tools

- [asdf](/asdf/nodejs.md)
- [n](/n.md)
- [nvm](/nvm.md)
- [Volta](/volta.md) 🌟

## Options for Setup Node.js Version

1. Environment Variable: `export NODE_VERSION=20.15.1`
2. Project root file: `.node-version` with `20.15.1` inside
3. Engines in `package.json`:

```json
"engines": {
  "node": ">=20.15.1 <20.16.0"
}
```
