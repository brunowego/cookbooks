# Access

- [Main Reference](https://httpd.apache.org/docs/2.4/logs.html#accesslog)

## Common Log Format

```txt
LogFormat "%h %l %u %t \"%r\" %>s %b" common
CustomLog logs/access_log common
```

```log
127.0.0.1 - frank [10/Oct/2000:13:55:36 -0700] "GET /apache_pb.gif HTTP/1.0" 200 2326
```

## Combined Log Format

```txt
LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-agent}i\"" combined
CustomLog log/access_log combined
```

```log
127.0.0.1 - frank [10/Oct/2000:13:55:36 -0700] "GET /apache_pb.gif HTTP/1.0" 200 2326 "http://www.example.com/start.html" "Mozilla/4.08 [en] (Win98; I ;Nav)"
```

##

```sh
tail -f /etc/httpd/logs/access_log
```
