# kubectl-janitor

## Links

- [Code Repository](https://github.com/dastergon/kubectl-janitor)

## Installation

### Krew

```sh
kubectl krew install janitor
```

## Commands

```sh
kubectl janitor -h
```

## Usage

```sh
#
kubectl janitor pods status -A

#
kubectl janitor pods unhealthy -A

#
kubectl janitor pods unready -A

#
kubectl janitor pods unscheduled -A

#
kubectl janitor jobs failed -A

#
kubectl janitor pvs unclaimed -A

#
kubectl janitor pvcs pending -A
```
