# Examples

## Services

```sh
micro --registry=consul list services
```

## New

```sh
micro new \
  --namespace 'com.example' \
  --type 'srv' \
  --gopath=false \
  github.com/[organization|username]/[repository]
```

```sh
cd github.com/[organization|username]/[repository]
```

```sh
go mod init github.com/[organization|username]/[repository]
```

```sh
micro get service com.example.srv.[service]
```

```sh
micro call com.example.srv.[service] [Service].Call '{"name": "John"}'
```
