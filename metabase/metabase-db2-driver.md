# Metabase DB2 Driver

<!--
https://github.com/metabase/metabase/issues/1509
-->

## Dependencies

- [Metabase](/metabase.md)

## Driver

<!-- ###

```sh
wget -P ./plugins https://github.com/alisonrafael/metabase-db2-driver/releases/download/v1.1.0/db2.metabase-driver.jar
``` -->

### Build & Run

```sh
#
cd /path/to/metabase

#
# git clone https://github.com/dludwig-jrt/metabase-db2-driver.git ./modules/drivers/db2
git clone https://github.com/alisonrafael/metabase-db2-driver.git ./modules/drivers/db2

#
lein install-for-building-drivers

#
./bin/build-driver.sh db2

#
mkdir ./plugins

cp ./modules/drivers/db2/target/uberjar/db2.metabase-driver.jar ./plugins

#
java -jar ./target/uberjar/metabase.jar
```
