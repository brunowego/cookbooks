# kubectl-flagger

## Links

- [Code Repository](https://github.com/mayankshah1607/kubectl-flagger)

## CLI

### Installation

```sh
git clone 'https://github.com/mayankshah1607/kubectl-flagger' kubectl-flagger && "$_"

make

cd ..; rm -fR ./kubectl-flagger
```

### Commands

```sh
kubectl flagger -h
```

### Usage

```sh
#
kubectl flagger promote [name] app \
  -n [namespace]

#
kubectl flagger rollback [name] app \
  -n [namespace]
```
