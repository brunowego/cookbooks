# axios

## References

- [Example](https://github.com/axios/axios#example)

## Installation

### NPM

```sh
#
mkdir example-axios && cd "$_"
npm init -y

npm install axios -D

#
npm install axios -g
```

## REPL

```js
.editor

const axios = require('axios');

axios.get('https://google.com')
  .then(response => console.log(response))
  .catch(error => console.log(error));

// hit ^D

.exit
```
