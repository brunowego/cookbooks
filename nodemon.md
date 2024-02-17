# Nodemon

**Keywords:** Local Development Server

## Links

- [Code Repository](https://github.com/remy/nodemon)
- [Main Website](https://nodemon.io)

## Library

### Installation

```sh
# Using NPM
npm install nodemon -D
```

### Configuration

**Refer:** `./package.json`

```json
{
  "scripts": {
    "dev": "cross-env NODE_ENV='development' nodemon ./index.js"
  }
}
```

<!--
nodemon.json

{
  "$schema": "http://json.schemastore.org/nodemon",
  "watch": ["./src/**/*"],
  "ext": "ts",
  "exec": "bun ./src/server.ts -- -I"
}
-->

## Docker

### Image

```sh
cat << EOF > ./default.conf
server {
    listen 80;
    server_name localhost;

    location / {
        root /usr/share/nginx/html;
        index index.html index.htm;
    }

    location /server_status {
        stub_status;
    }

    error_page 500 502 503 504 /50x.html;
    location = /50x.html {
        root /usr/share/nginx/html;
    }
}
EOF
```

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
