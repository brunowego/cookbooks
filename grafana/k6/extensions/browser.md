# Grafana k6 Browser Extension

## Links

- [Code Repository](https://github.com/grafana/xk6-browser)
- [Docs](https://k6.io/docs/using-k6-browser/overview/)
  - [Running browser tests](https://k6.io/docs/using-k6-browser/running-browser-tests/)

## Installation

```sh
# Locally
xk6 build --output ./bin/k6 --with github.com/grafana/xk6-browser

# Globally
xk6 build --output /usr/local/bin/k6 --with github.com/grafana/xk6-browser
```
