# Price Column Type

## Snippets

```ts
//
price: decimal('price', { precision: 10, scale: 2 }).notNull().default('0.0'),

//
price: numeric('price', { precision: 10, scale: 2 }).notNull().default('0.0'),

//
price: doublePrecision('price').notNull().default(0.0),
```
