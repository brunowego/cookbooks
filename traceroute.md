# traceroute

## CLI

### Commands

```sh
man traceroute
```

### Usage

```sh
#
traceroute [hostname]
```

### Tips

#### Route Table Flush

```sh
#
sudo route \
  -n delete \
  [hostname]

#
route \
  -n flush
```
