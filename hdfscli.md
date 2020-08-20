# HdfsCLI

## CLI

### Installation

#### PIP

```sh
pip install -U ipython hdfs
```

### Configuration

```sh
# Global
echo -e '[global]\ndefault.alias = hdfs' >> ~/.hdfscli.cfg

# Namenode
echo -e '\n[hdfs.alias]\nurl = http://[namenode]:[port]' >> ~/.hdfscli.cfg
```

| Version | Port |
| --- | --- |
| 2.x | `50070` |
| 3.x | `9870` |

### Commands

```sh
hdfscli --alias=hdfs
```

### Queries

- [API](https://hdfscli.readthedocs.io/en/latest/api.html)

```sh
# List
CLIENT.list('/')
```

### Tips

#### Kerberos

##### Dependencies

- [MIT Kerbeos](/mit_krb5.md)

###### PIP

```sh
pip install kerberos requests-kerberos
```

##### Configuration

```sh
# Global
sed -i '/\[global\]/a autoload.modules = hdfs.ext.kerberos' ~/.hdfscli.cfg

# Namenode
sed -i '/\[hdfs\.alias\]/a client = KerberosClient' ~/.hdfscli.cfg
```

> Before proceed, don't forget to initialize the keytab.
