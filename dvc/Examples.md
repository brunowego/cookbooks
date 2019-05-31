# Examples

## Init

```sh
dvc init
```

## Add

```sh
dvc add images
```

## Run

```sh
dvc run -d images -o model.p cnn.py
```

## Remote

```sh
dvc remote add [repo] s3://[bucket]
```

## Push

```sh
dvc push
```
