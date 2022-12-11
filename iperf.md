# iPerf

**Keywords:** Speed Test, Network Performance Measurement

## CLI

### Installation

#### Homebrew

```sh
brew install iperf3
```

### Commands

```sh
iperf3 -h
```

### Usage

```sh
#
iperf3 --server

#
iperf3 \
  --client 10.0.2.1
  --omit 1 \
  --parallel 2 \
  --time 10 \
  --reverse
```
