# JSON Server

<!--
https://blog.logrocket.com/how-to-bootstrap-your-project-with-json-server/
-->

**Keywords:** Fake REST API

## Links

- [Code Repository](https://github.com/typicode/json-server)

## CLI

### Installation

```sh
# Using NPM
npm install json-server -g

# Using Yarn
yarn global add json-server
```

### Commands

```sh
json-server --help
```

### Usage

```sh
#
cat << EOF > ./db.json
{
  "posts": [
    { "id": "1", "title": "a title", "views": 100 },
    { "id": "2", "title": "another title", "views": 200 }
  ],
  "comments": [
    { "id": "1", "text": "a comment about post 1", "postId": "1" },
    { "id": "2", "text": "another comment about post 1", "postId": "1" }
  ],
  "profile": {
    "name": "typicode"
  }
}
EOF

#
json-server ./db.json

#
curl http://localhost:3000/posts/1
```
