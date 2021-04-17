# Tips

## Keep docker running

```Dockerfile
CMD ["tail", "-f", "/dev/null"]
```

## Set shell

```Dockerfile
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
```
