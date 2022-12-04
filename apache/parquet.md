# Apache Parquet

<!--
https://github.com/guihaojin/til/blob/master/big_data/apache-parquet.md
https://github.com/willgarcia/spark-aws-emr/blob/ab41d36d48969544514de43afbcd8d3ee5e03890/README.md
-->

## CLI

### Installation

#### Homebrew

```sh
brew install parquet-tools
```

#### APT

```sh
sudo apt update
sudo apt -y install parquet-tools
```

### Usage

```sh
#
parquet-tools schema -d [filename].parquet

#
parquet-tools dump [filename].parquet

#
parquet-tools meta [filename].parquet
```
