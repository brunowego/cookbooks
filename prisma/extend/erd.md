# Entity Relationship Diagram (ERD)

## Links

- [Code Repository](https://github.com/keonik/prisma-erd-generator)

## Installation

```sh
# Using NPM
npm install @mermaid-js/mermaid-cli prisma-erd-generator -D

# Using Yarn
yarn add @mermaid-js/mermaid-cli prisma-erd-generator --dev

# Using pnpm
pnpm add @mermaid-js/mermaid-cli prisma-erd-generator -D
```

## Configuration

**Refer:** `./db/prisma/schema.prisma`

```prisma
// ...

generator erd {
  provider = "prisma-erd-generator"
  output = "../../docs/assets/images/ERD.svg"
}

// ...
```

```sh
#
npx prisma generate
```
