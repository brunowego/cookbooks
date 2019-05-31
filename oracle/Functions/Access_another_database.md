# Access another database

```sql
BEGIN
  FOR tables IN (SELECT table_name FROM all_tables WHERE owner = 'username1') LOOP
    execute IMMEDIATE
      'GRANT ALL ON table.' ||tables.table_name|| ' TO username2';
  END loop;
END;
```
