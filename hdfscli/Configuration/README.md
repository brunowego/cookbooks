# Configuration

## Global

```sh
echo -e '[global]\ndefault.alias = hdfs' >> ~/.hdfscli.cfg
```

## Namenode

```sh
echo -e '\n[hdfs.alias]\nurl = http://[namenode]:[port]' >> ~/.hdfscli.cfg
```

| Version | Port |
| --- | --- |
| 2.x | `50070` |
| 3.x | `9870` |
