# xk6 (Custom k6 Builder)

<!--
https://github.com/formancehq/xk6-extension
-->

## Links

- [Code Repository](https://github.com/grafana/xk6)
- Docs
  - [xk6 makes custom binaries](https://k6.io/docs/extensions/#xk6-makes-custom-binaries)

## CLI

### Installation

```sh
GOBIN=/usr/local/bin go install go.k6.io/xk6/cmd/xk6@latest
```

### Usage

```sh
#
xk6 build --with github.com/grafana/xk6-browser
```
