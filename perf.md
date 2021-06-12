# perf

**Keywords:** Performance

## Link

- [perf Examples](http://www.brendangregg.com/perf.html)

## Alternatives

- [GNU Debugger (gdb)](/gnu-debugger.md)

## Books

- [Systems Performance: Enterprise and the Cloud, 2nd Edition (2020)](http://www.brendangregg.com/systems-performance-2nd-edition-book.html)
- [BPF Performance Tools (book)](http://www.brendangregg.com/bpf-performance-tools-book.html)

<!--
gperftools
-->

## CLI

### Installation

<!-- #### APT

```sh
https://github.com/torvalds/linux.git

tools/perf
``` -->

#### YUM

```sh
yum check-update
sudo yum -y install perf
```

### Commands

```sh
perf help
```

### Usage

```sh
#
perf stat

#
perf report -p <process_id>

#
perf record

#
perf top

#
perf list
```
