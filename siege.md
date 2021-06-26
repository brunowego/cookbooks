# Siege

## Links

- [Code Repository](https://github.com/JoeDog/siege)

## CLI

### Installation

#### Homebrew

```sh
brew install siege
```

<!-- ### Configuration

```sh
cat << EOF > ~/.siegerc

EOF
``` -->

### Commands

```sh
siege -h
```

## Kubectl

### Running

```sh
#
kubectl run -it --rm \
  siege \
  --image docker.io/yokogawa/siege \
  --generator run-pod/v1 \
    -- \
      -c 10 \
      -t 30S \
      github.com
```
