# sysbench

## CLI

### Installation

#### Homebrew

```sh
brew install sysbench
```

#### YUM

```sh
yum check-update
sudo yum -y install sysbench
```

#### APT

```sh
sudo apt update
sudo apt -y install sysbench
```

### Commands

```sh
sysbench --help
```

### Examples

#### CPU

```sh
sysbench cpu --cpu-max-prime=2000 run
```

#### Memory

```sh
sysbench --threads=2 memory run
```

#### IO

```sh
sysbench fileio --file-total-size=5G prepare
```

```sh
sysbench --max-time=300 fileio \
  --file-total-size=5G \
  --file-test-mode=rndrw \
  run
```

```sh
sysbench fileio --file-total-size=5G cleanup
```

#### MySQL

```sh
# Darwin
export SYSBENCH_LIBRARY_PATH=$(brew --prefix sysbench)/share/sysbench

# Linux
export SYSBENCH_LIBRARY_PATH=/usr/share/sysbench
```

```sh
sysbench \
  --db-ps-mode=disable \
  --mysql-host=127.0.0.1 \
  --mysql-port=3306 \
  --mysql-user='sbtest' \
  --mysql-password='' \
  --mysql-db='sbtest' \
  $SYSBENCH_LIBRARY_PATH/oltp_read_write.lua \
    --auto_inc=off \
    --table_size=100000 \
    --tables=1 \
    prepare
```

```sh
sysbench \
  --threads=2 \
  --time=600 # 10m \
  --db-ps-mode=disable \
  --mysql-host=127.0.0.1 \
  --mysql-port=3306 \
  --mysql-user='sbtest' \
  --mysql-password='' \
  --mysql-db='sbtest' \
  $SYSBENCH_LIBRARY_PATH/oltp_read_write.lua \
    --auto_inc=off \
    --table_size=100000 \
    --tables=1 \
    run
```

```sh
sysbench \
  --mysql-host=127.0.0.1 \
  --mysql-port=3306 \
  --mysql-user='sbtest' \
  --mysql-password='' \
  --mysql-db='sbtest' \
  $SYSBENCH_LIBRARY_PATH/oltp_read_write.lua cleanup
```
