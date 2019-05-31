# Truncate and Drop

Disable all FK constraints from user schema

```sql
begin
  for C1 in (select TABLE_NAME, CONSTRAINT_NAME from user_CONSTRAINTS where CONSTRAINT_TYPE = 'R' and STATUS = 'ENABLED')
  loop
    begin
      execute immediate 'ALTER TABLE '||C1.TABLE_NAME||' DISABLE CONSTRAINT '||C1.CONSTRAINT_NAME;
      dbms_output.put_line('Disable '||C1.CONSTRAINT_NAME||' on table '||C1.TABLE_NAME);
    exception
      when others then
        dbms_output.put_line(sqlerrm||' '||C1.TABLE_NAME);
    end;
  END LOOP;
end;
```

Truncate all tables from user schema

```sql
begin
  for c2 in (select table_name from user_tables)
    loop
      begin
        execute immediate 'truncate table '||c2.table_name;
        dbms_output.put_line('truncate table '||c2.table_name);
      exception
        when others then
          dbms_output.put_line(sqlerrm||' '||c2.table_name);
      end;
    end LOOP;
end;
```

Drop all tables from user schema

```sql
begin
  for c2 in (select table_name from user_tables)
    loop
      begin
        execute immediate 'drop table '||c2.table_name;
        dbms_output.put_line('drop table '||c2.table_name);
      exception
        when others then
          dbms_output.put_line(sqlerrm||' '||c2.table_name);
      end;
    end LOOP;
end;
```

Enable all FK constraints from user schema

```sql
begin
  for C3 in (select TABLE_NAME, CONSTRAINT_NAME from user_CONSTRAINTS where CONSTRAINT_TYPE = 'R' and STATUS = 'DISABLED')
    loop
      begin
        execute immediate 'ALTER TABLE '||C3.TABLE_NAME||' ENABLE CONSTRAINT '||C3.CONSTRAINT_NAME;
        dbms_output.put_line('Enable '||c3.constraint_name || ' on table '||c3.table_name);
      exception
        when others then
          dbms_output.put_line(sqlerrm||' '||c3.table_name);
      end;
   end LOOP;
end;
```
