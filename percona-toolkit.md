# Percona Toolkit

## CLI

### Installation

#### Homebrew

```sh
brew install percona-toolkit
```

#### APK

```sh
sudo apk update
sudo apk add perl perl-dbd-mysql make
```

#### Source

##### Build & Install

```sh
curl -L https://github.com/percona/percona-toolkit/archive/3.0.13.tar.gz | tar -xzC /tmp
( cd /tmp/percona-toolkit-3.0.13 && perl Makefile.PL && make && make install ) && rm -r /tmp/percona-toolkit-3.0.13
```

### Usage

#### Read

```sh
pt-query-digest /var/lib/mysql/mysql-slow.log
```

#### Filter

##### Database

```sh
pt-query-digest --filter '($event->{db} || "") =~ m/[database]/' /var/lib/mysql/mysql-slow.log
```

##### User

```sh
pt-query-digest --filter '($event->{user} || "") =~ m/^root/i' /var/lib/mysql/mysql-slow.log
```

##### Argument

```sh
pt-query-digest --filter '($event->{arg} || "") =~ m/^SELECT/i' /var/lib/mysql/mysql-slow.log
```

```sh
pt-query-digest --filter '($event->{arg} || "") =~ m/^(INSERT|UPDATE|DELETE)/i' /var/lib/mysql/mysql-slow.log
```

#### Since

```sh
pt-query-digest --since=1h  /var/lib/mysql/mysql-slow.log > mysql-slow_report.log
```

```sh
pt-query-digest --since '2019-01-01 00:00:00' --until '2019-01-02 00:00:00' /var/lib/mysql/mysql-slow.log > mysql-slow_report.log
```

#### Process list

```sh
pt-query-digest --processlist h=127.0.0.1,u=root,p=root
```

#### TCP Dump

```sh
tcpdump -s 65535 -x -nn -q -tttt -i any -c 1000 port 3306 > mysql.tcp.txt

pt-query-digest --type tcpdump mysql.tcp.txt
pt-query-digest --type tcpdump mysql.tcp.txt > slow_report9.log
```

#### Docker

```sh
cat mysql-slow.log | docker run -i --rm matsuu/pt-query-digest > analyzed-slow.log
```

```sh
cat dump.log | docker run -i --rm matsuu/pt-query-digest --type tcpdump > analyzed-slow.log
```

####

```sh
pt-query-digest --filter "\$event->{arg} =~ m/^SELECT/i" --limit 95%:10 /var/lib/mysql/mysql-slow.log
```

####

```sh
pt-query-digest \
  --user root \
  --password root \
  --review h=127.0.0.1,D=slow_query_log,t=global_query_review \
  --history h=127.0.0.1,D=slow_query_log,t=global_query_review_history \
  --no-report \
  --limit=0% \
  --filter "\$event->{Bytes} = length(\$event->{arg}) and \$event->{hostname} = \"$HOSTNAME\"" \
  /var/lib/mysql/mysql-slow.log
```
