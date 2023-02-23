# Prisma Studio

## Links

- [Main Website](https://prisma.io/studio)

## Library

### Dependencies

```sh
# Using pnpm
pnpm add cross-env -D
```

### Configuration

```json
{
  // ...
  "scripts": {
    "db:studio": "cross-env BROWSER=none prisma studio --hostname 0.0.0.0",
  }
  // ...
}
```

## App

### Installation

#### Homebrew

```sh
brew install --cask prisma-studio
```

## CLI

### Usage

```sh
#
npx prisma studio
```
