# tsvector

**Keywords:** Vector Search

## Tips

### Example

```sql
SELECT extname FROM pg_extension;

CREATE EXTENSION pg_trgm;

ALTER TABLE users ADD COLUMN search_vector tsvector;

UPDATE users SET search_vector = to_tsvector('english', first_name || ' ' || last_name);

CREATE INDEX idx_search_vector ON users USING GIN(search_vector);

SELECT id, first_name, last_name
FROM users
WHERE search_vector::text % 'Jackson';
```

<!--
SELECT id, first_name, last_name
FROM users
WHERE search_vector @@ plainto_tsquery('english', 'C.R Jackson')
ORDER BY ts_rank(search_vector, plainto_tsquery('english', 'C.R Jackson')) DESC;
-->

## Issues

### TBD

```log
SQL Error [XX001]: ERROR: missing chunk number 0 for toast value 17417 in pg_toast_16701
```

```sql
--
SELECT relname
FROM pg_class
WHERE oid = 16701;

--
SELECT ctid, id
FROM <table-name>
WHERE search_vector IS NOT NULL;

--
REINDEX TABLE <table-name>;

--
DROP INDEX IF EXISTS idx_search_vector;
ALTER TABLE blocks DROP COLUMN search_vector;
```

TODO
