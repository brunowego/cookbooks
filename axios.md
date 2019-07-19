# axios

## References

- [Example](https://github.com/axios/axios#example)

## Installation

```sh
mkdir example-axios && cd "$_"
npm init -y
```

```sh
npm i axios -D
```

## REPL

```sh
node
```

```js
.editor

const axios = require('axios');

axios.get('https://google.com')
  .then(response => console.log(response))
  .catch(error => console.log(error));

// hit ^D
.exit
```
