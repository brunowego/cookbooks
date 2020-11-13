# JSON Server

<!--
https://blog.logrocket.com/how-to-bootstrap-your-project-with-json-server/
-->

## CLI

### Installation

#### NPM

```sh
npm install json-server -g
```

### Commands

```sh
json-server -h
```

### Usage

```sh
#
json-server \
  -H 127.0.0.1 \
  -p 3000 \
  -w \
  -r <(cat << EOF
{
  "/api/*": "/$1"
}
EOF
) \
  ./[name].json

#
cat << EOF > ./json-server.json
{
  "port": "3000",
  "host": "127.0.0.1",
  "watch": true,
  "routes": "./routes.json"
}
EOF

json-server \
  -c ./json-server.json \
  ./[name].json

#
json-server \
  -c ./json-server.json \
  ./[name].json \
  -m ./middlewares.js
```
