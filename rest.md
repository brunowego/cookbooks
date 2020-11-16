# Representational State Transfer (REST)

## Usage

```http
GET http://github.com
```

```rest
GET http://github.com
```

##

```sh
cat << EOF > ./.rest
@hostname = 127.0.0.1
@port = 8000
@host = {{hostname}}:{{port}}
@baseUrl = http://{{host}}/api/v1
@contentType = application/json

### Health check

GET {{baseUrl}}/health-check HTTP/1.1
Content-Type: {{contentType}}
EOF
```

## Tips

### Visual Studio Code

```sh
code --install-extension humao.rest-client
```

```sh
# Darwin
osascript -e 'quit app "Visual Studio Code"'

code --disable-extension humao.rest-client
```
