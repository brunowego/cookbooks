# Examples

## Search

```sh
helm search [repo]/[name]
```

## Repo

```sh
helm repo list
```

## Create

```sh
helm create [name]
```

## Values

```sh
helm get values [name] --all
```

## Upgrade

```sh
helm get values [name] > values.yaml
```

```sh
helm upgrade [release] [chart] -f values.yaml
```

## Delete

```sh
helm list
```

```sh
helm del --purge [name]
```

### PVC

```sh
kubectl delete pvc -l 'app=[name]'
```

## Fetch

```sh
helm fetch [repo]/[name] \
  --version [version] \
  --untar
```

## Lint

```sh
helm lint [name]
```

## History

```sh
helm hist [name]
```

##

```sh
helm get --revision 1 [name]
```

##

```sh
helm rollback --debug [name] 1
```

##

```sh
helm serve --address 0.0.0.0:8879
```
