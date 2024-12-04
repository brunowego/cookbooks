# PostgreSQL Sync

## Issues

### TBD

```log
pg_dump: error: Dumping the contents of table "block_attributes" failed: PQgetCopyData() failed.
pg_dump: detail: Error message from server: server closed the connection unexpectedly
	This probably means the server terminated abnormally
	before or while processing the request.
server closed the connection unexpectedly
	This probably means the server terminated abnormally
	before or while processing the request.
pg_dump: detail: Command was: COPY public.block_attributes (id, cvx_id, cvx_group_attribute_id, meta, monthly_values, cvx_organization_id, cvx_parent_block_id, cvx_parent_group_id, value, created_at, updated_at) TO stdout;
```

TODO
