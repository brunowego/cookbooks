# Drizzle SQL

## Issues

### TBD

```log
You might need to specify "USING source_id::integer".
```

```sql
ALTER TABLE "<table_name>" ALTER COLUMN "source_id" TYPE integer USING "source_id"::integer;
```

### TBD

```log
You're about to add messages_organization_id_external_id_unique unique constraint to the table, which contains 8 items. If this statement fails, you will receive an error from the database. Do you want to truncate messages table?
```

TODO
