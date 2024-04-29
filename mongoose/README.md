# Mongoose

<!--
https://github.com/typegoose/typegoose
-->

**Keywords:** ODM

## Links

- [Code Repository](https://github.com/Automattic/mongoose)
- [Main Website](https://mongoosejs.com)

## Glossary

- Object Document Mapping (ODM)

## Library

### Tips

#### REPL

```js
.editor

const mongoose = require('mongoose');

mongoose.connect('mongodb://localhost:27017/admin', {
  useNewUrlParser: true,
  useCreateIndex: true,
  useUnifiedTopology: true
})
.then(() => console.log('DB Connected!'))
.catch(error => console.log(error));

// hit: Ctrl + D

.exit
```
