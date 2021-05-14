# Postman Recipes

## Tests

### Get last object id from array

```js
let jsonData = JSON.parse(responseBody);

pm.globals.set("APP_ID", jsonData[jsonData.length - 1].id);
```

### Get object id

```js
let jsonData = JSON.parse(responseBody);

pm.globals.set("APP_ID", jsonData.id);
```
