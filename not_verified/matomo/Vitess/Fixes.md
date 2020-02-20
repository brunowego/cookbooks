# Fixes

##

```sh
sed -i '/SET sql_mode/s|$this|// $this|g' core/Db/Adapter/Pdo/Mysql.php
```

```sh
sed -i '/acquireArchiveTableLock/s|$this|// $this|g' core/DataAccess/Model.php
```
