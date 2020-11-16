# Nodemon

## CLI

### Installation

#### NPM

```sh
npm install nodemon -D
```

### Configuration

```json
{
  "scripts": {
    "dev": "cross-env NODE_ENV=development nodemon ./index.js"
  }
}
```

## Docker

### Image

```Dockerfile
FROM docker.io/library/node:13.5.0-alpine AS build

WORKDIR /usr/src/app

COPY ./package*.json ./

RUN npm i

COPY ./ ./

RUN npm run build

# ---

FROM docker.io/library/nginx:1.17.5-alpine

COPY ./default.conf /etc/nginx/conf.d

COPY --from=build /usr/src/app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
```
