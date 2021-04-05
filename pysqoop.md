# pysqoop

## Library

### Installation

```sh
# As user dependency
pip3 install -U \
  pysqoop

# As project dependency
echo 'pysqoop==0.0.15' >> ./requirements.txt
```

### REPL

```py
>>> from pysqoop.SqoopImport import Sqoop
>>>
>>> sqoop = Sqoop(help=True)
# >>> sqoop = Sqoop(fs='hdfs://remote-cluster:8020', hive_drop_import_delims=True, fields_terminated_by='\;', enclosed_by='\'"\'', escaped_by='\\\\', null_string='\'\'', null_non_string='\'\'', table='sample_table', target_dir='hdfs://remote-cluster/user/hive/warehouse/db/sample_table', delete_target_dir=True, connect='jdbc:oracle:thin:@//your_ip:your_port/your_schema', username='user', password='pwd', num_mappers=2, bindir='/path/to/bindir/folder')
# >>> sqoop = Sqoop(connect='"jdbc:sqlserver://127.0.0.1:1433;DatabaseName=SQLDB;user=root;password=password"', table='Rutas', incremental='lastmodified', hbase_table='Rutas', hbase_row_key='Id_Ruta', column_family='Id_Ruta', m=1)
>>>
>>> sqoop.perform_import()
>>> exit()
```

```py
>>> from pysqoop.SqoopJob import Sqoop
>>>
>>> exit()
```

```py
>>> from pysqoop.MapredJob import Sqoop
>>>
>>> exit()
```
