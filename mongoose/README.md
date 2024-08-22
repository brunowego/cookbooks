# Mongoose

<!--
https://github.com/merlinn-co/merlinn/tree/main/packages/db/src
https://github.com/gashon/scrib/tree/main/packages/db
https://github.com/aditya172001/hungry-hub/tree/main/packages/db

https://github.com/typegoose/typegoose
-->

**Keywords:** ODM

## Links

- [Code Repository](https://github.com/Automattic/mongoose)
- [Main Website](https://mongoosejs.com)

## Glossary

- Object Document Mapping (ODM)

## Learn

- [Speed CRUD](https://youtube.com/watch?v=Lp57L8GLyfQ)

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
