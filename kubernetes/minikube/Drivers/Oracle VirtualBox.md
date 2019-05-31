# Oracle VirtualBox

## Start

```sh
minikube start \
  --cpus 4 \
  --disk-size 40g \
  --host-only-cidr '10.100.1.1/24' \
  --memory 8192 \
  --vm-driver virtualbox
```
