# Issues

## Lookup

> Error getting cluster metadata: dial tcp: lookup kafka on \[IPv6]:53: no such host

```sh
sudo sh -c 'echo -e "127.0.0.1\tkafka" >> /etc/hosts'
```
