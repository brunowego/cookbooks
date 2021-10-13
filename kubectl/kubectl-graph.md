# kubectl-graph

## Links

- [Code Repository](https://github.com/steveteuber/kubectl-graph)

## CLI

### Dependencies

- [Graphviz](/graphviz.md)
- [Cypher Shell](/cypher-shell.md)

### Installation

```sh
kubectl krew install graph
```

### Commands

```sh
kubectl graph -h
```

### Usage

#### Graphviz

```sh
#
kubectl graph pods \
  --field-selector 'status.phase=Running' \
  -n kube-system | \
    dot \
      -T svg \
      -o ./pods.svg

#
open ./pods.svg

#
rm ./pods.svg
```

#### Neo4j

**Dependencies:** Run [Neo4j](/neo4j.md#docker)

```sh
#
kubectl graph all \
  -n kube-system \
  -o cypher | \
    cypher-shell \
      -u neo4j \
      -p 'Pa$$w0rd!'

#
echo -e '[INFO]\thttp://127.0.0.1:7474'
```
