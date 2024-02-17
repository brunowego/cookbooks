# Create Mintlify App

## Clone

```sh
git clone https://github.com/mintlify/starter.git ./apps/docs
```

## Configuration

**Refer:** `./apps/docs/package.json`

```json
{
  "$schema": "https://json.schemastore.org/package.json",
  "name": "@acme/docs",
  "version": "0.0.0",
  "private": true,
  "license": "COPYRIGHT",
  "scripts": {
    "dev": "mintlify dev",
    "build": "mintlify broken-links"
  },
  "devDependencies": {
    "mintlify": "~4.0.122"
  }
}
```
