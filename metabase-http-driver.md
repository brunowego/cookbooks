# Metabase HTTP Driver

## Dependencies

- [Metabase](/metabase.md)

## Driver

```sh
#
cd /usr/local/src/metabase/$METABASE_VERSION

#
git clone https://github.com/tlrobinson/metabase-http-driver.git ./modules/drivers/http

#
lein install-for-building-drivers

#
./bin/build-driver.sh http

#
mkdir ./plugins

cp ./modules/drivers/http/target/uberjar/http.metabase-driver.jar ./plugins

#
java -jar ./target/uberjar/metabase.jar
```
