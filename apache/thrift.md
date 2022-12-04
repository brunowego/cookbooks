# Apache Thrift

<!--
https://github.com/welefen/thrift-hbase-client
https://github.com/sy-records/thrift2-hbase
https://github.com/s2shape/HBaseThrift
https://github.com/joshelser/hbase-thrift1-python-sasl
https://github.com/yxfff/HBase-Thrift-Kerberos
-->

## CLI

### Installation

#### Homebrew

```sh
brew install thrift
```

### Tips

#### Visual Studio Code

```sh
#
code --install-extension mrkou47.thrift-syntax-support

#
jq '."recommendations" += ["mrkou47.thrift-syntax-support"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
