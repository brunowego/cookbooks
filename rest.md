# Representational State Transfer (REST)

<!--
https://app.pluralsight.com/library/courses/rest-fundamental/table-of-contents
https://www.youtube.com/watch?v=_1xa8Bsho6A
-->

## References

- [REST API Versioning](https://restfulapi.net/versioning/)
- [HATEOAS]()

## Tools

- [{JSON} Placeholder](https://jsonplaceholder.typicode.com/)
- [Apiary]()
- [Swagger]()
- [WADL]()

## Markdown

```http
GET http://github.com
```

```rest
GET http://github.com
```

## Visual Studio Code

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

```sh
code --install-extension humao.rest-client
```

```sh
# Darwin
osascript -e 'quit app "Visual Studio Code"'

code --disable-extension humao.rest-client
```
