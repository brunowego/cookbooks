# Blast Radius

**Keyword:** Terraform Graph

> Note: Not working! Problem with Python and Terraform versions.

## Links

- [Code Repository](https://github.com/28mm/blast-radius)
- [Main Website](https://28mm.github.io/blast-radius-docs/)

## CLI

### Dependencies

- [Graphviz](/graphviz.md)

### Installation

### pip

```sh
#
pip3 install -U blastradius
```

<!--
https://github.com/Ianyliu/blast-radius-fork/tree/main
-->

### Commands

```sh
blast-radius -h
```

### Usage

```sh
#
terraform graph | blast-radius --svg > ./graph.svg
terraform graph | blast-radius --json > ./graph.json

#
BLAST_RADIUS_PORT=8080 blast-radius --serve .
```

### Issues

### TBD

```log
ERROR: Cannot install Flask, blastradius and blastradius==0.1.25 because these package versions have conflicting dependencies.
```

TBD

#### TBD

```log
AttributeError: 'NoneType' object has no attribute 'groupdict'
```

TODO

#### Incompatibility with Python

```log
AttributeError: module 'collections' has no attribute 'MutableSet'
```

Try Python v3.9.16.

## Docker

### Running

```sh
#
docker run --rm -it \
  -p 5000:5000 \
  -v $(pwd):/data:ro \
  --security-opt apparmor:unconfined \
  --cap-add=SYS_ADMIN \
  docker.io/28mm/blast-radius:0.12.3
```
