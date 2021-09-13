# kurun

## Links

- [Code Repository](https://github.com/banzaicloud/kurun)

## CLI

### Installation

#### Homebrew

```sh
brew tap banzaicloud/tap
brew install kurun
```

#### go get

```sh
go get github.com/banzaicloud/kurun
```

### Commands

```sh
kurun -h
```

### Usage

```sh
#
kurun run test.go arg1 arg2 arg3

#
kurun port-forward localhost:4443

#
kurun apply -f - <<EOF
apiVersion: v1
kind: Pod
metadata:
  name: myapp
spec:
  containers:
  - image: kurun://cmd/myapp/main.go
    name: myapp
EOF
```
