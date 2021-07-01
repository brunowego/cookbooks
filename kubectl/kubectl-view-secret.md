# kubectl-who-can

## Links

- [Code Repository](https://github.com/aquasecurity/kubectl-who-can)

## Installation

### Krew

```sh
kubectl krew install who-can
```

## Commands

```sh
kubectl who-can -h
```

## Usage

```sh
#
kubectl who-can get pods -A

#
kubectl who-can create persistentvolumes

#
kubectl who-can delete pods -A

#
kubectl who-can delete nodes
```
