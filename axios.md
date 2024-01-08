# Axios

## References

- [Code Repository](https://github.com/axios/axios)
- [Main Website](https://axios-http.com)
- [Docs](https://axios-http.com/docs/intro)

## Library

### Installation

```sh
# Using NPM
npm install axios

# Using pnpm
pnpm install axios
```

### REPL

```js
.editor

const axios = require('axios');

axios.get('https://google.com')
  .then(response => console.log(response))
  .catch(error => console.log(error));

// hit: Ctrl + D

.exit
```
