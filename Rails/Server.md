# Server

```sh
rails server -b 0.0.0.0
```

## Finish Instances

```sh
kill -9 $(lsof -i tcp:3000 -t)
```
