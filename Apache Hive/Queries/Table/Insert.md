# Insert

##

```sql
INSERT INTO TABLE [table-name]
  VALUES ([value], [value]), ([value], [value]);
```

##

```sql
INSERT OVERWRITE DIRECTORY '/some/directory' AS SELECT * FROM [name] WHERE partitionField='partitionValue';

INSERT OVERWRITE LOCAL DIRECTORY '/some/local/directory' AS SELECT * FROM [name] WHERE partitionField='partitionValue';

INSERT OVERWRITE TABLE [name] AS SELECT * FROM someOtherTable WHERE partitionField='partitionValue';

INSERT OVERWRITE TABLE accounts_by_state PARTITION(state) SELECT cust_id, fname, lname, address, city, zipcode, state FROM accounts;
```
