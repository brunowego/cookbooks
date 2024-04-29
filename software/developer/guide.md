# Developer Guide

## Local Development

### Prerequisites

- [Docker](https://docs.docker.com/get-docker)
- [Docker Compose](https://docs.docker.com/compose/install)
- [Node.js](https://nodejs.org/en/download)
- [pnpm](https://pnpm.io/installation)

### Setup

```sh
# Install dependencies
pnpm install

# Run auxiliary services
pnpm compose:up

# Copy environment files
( cd ./apps/web; cp ./.env.local.sample ./.env.local )
( cd ./packages/db; cp ./.env.sample ./.env )

# Run database migrations
pnpm db:migrate

# Run database seeders
pnpm db:seed

# Start the development server
pnpm dev --filter web
```
