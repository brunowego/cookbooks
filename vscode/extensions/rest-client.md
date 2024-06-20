# REST Client

<!--
https://github.com/gabrielaigner/audally/blob/main/backend-api/rest-requests/requests.http
-->

**Keywords:** HTTP Requests

## Links

- [Code Repository](https://github.com/Huachao/vscode-restclient)

## Syntax

```sh
cat << EOF > ./.rest
@hostname = 127.0.0.1
@port = 8000
@host = {{hostname}}:{{port}}
@baseUrl = http://{{host}}/api/v1
@contentType = application/json

### Health check

GET {{baseUrl}}/_healthcheck HTTP/1.1
Content-Type: {{contentType}}

### Add comment

POST {{baseUrl}}/comments HTTP/1.1
Content-Type: {{contentType}}

{
  "message": "My message",
  "time": "Thu, 1 Apr 2021 11:43:50 GMT"
}

EOF
```

## Tips

### Visual Studio Code

**Tips**: Behind proxy, start Visual Studio Code with environment `http_proxy` from terminal.

```sh
#
code --install-extension humao.rest-client

#
jq '."recommendations" += ["humao.rest-client"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
