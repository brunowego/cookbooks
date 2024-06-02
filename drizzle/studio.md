# Drizzle Studio

## Issues

### Missing relation fields and references

```log
Error: There is not enough information to infer relation "__public__.accountsTable.user"
```

<!--
https://stackoverflow.com/questions/77557480/drizzle-studio-there-is-not-enough-information-to-infer-relation
https://www.answeroverflow.com/m/1180072254214766632
-->

TODO

```ts
// From
export const accountsRelations = relations(accountsTable, ({ one }) => ({
  user: one(usersTable),
}))

// To
export const accountsRelations = relations(accountsTable, ({ one }) => ({
  user: one(usersTable, {
    fields: [accountsTable.userId],
    references: [usersTable.id],
  }),
}))
```
