# Kubernetes DNS

## References

- [Debugging DNS Resolution](https://kubernetes.io/docs/tasks/administer-cluster/dns-debugging-resolution/)

## Providers

- [CoreDNS](/coredns.md)
- [Kube-DNS](/kube-dns.md)

## Tips

### DNS tools

```sh
kubectl run dnstools -it --rm \
  --image='docker.io/infoblox/dnstools:latest' \
  --restart='Never' \
  -n big-deploy
```

```sh
dig @10.96.0.10 nginx.domain.tld +short
```

<!-- ### minikube Hosts

```sh
minikube ssh -- sudo cat /etc/hosts
```

```sh
minikube ssh -- 'sudo /usr/bin/sh -c "echo -e \"127.0.0.1\tsubdomain.domain.tld\" >> /etc/hosts"'
``` -->
