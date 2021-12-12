# Kubernetes

<!--
https://github.com/walidshaari/Certified-Kubernetes-Security-Specialist

https://linkedin.com/learning/paths/become-a-docker-administrator

https://linkedin.com/learning/kubernetes-microservices/tracing-issues-with-jaeger
https://linkedin.com/learning/learning-kubernetes/what-is-kubernetes

https://www.youtube.com/watch?v=QyG0WSCszYg
https://www.youtube.com/watch?v=lMb6wzy0PPA
https://www.youtube.com/watch?v=sGZx3OjMPQI
https://www.youtube.com/watch?v=zkDmJRlDqbw

Version 1.9.x
Version 1.21.0

datastore
dataeng

./.k8s
-->

## References

- [Managing Compute Resources for Containers](https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container/)
- [Releases](https://kubernetes.io/releases/)
- [Wiki](https://en.wikipedia.org/wiki/Kubernetes)

## Guides

- [Attach Handlers to Container Lifecycle Events](https://kubernetes.io/docs/tasks/configure-pod-container/attach-handler-lifecycle-event/)
- [Debugging DNS Resolution](https://kubernetes.io/docs/tasks/administer-cluster/dns-debugging-resolution/)
- [DNS Lookups in Kubernetes](https://mrkaran.dev/posts/ndots-kubernetes/)
- [Publishing Services (ServiceTypes)](https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types)
- [Accessing the Kubernetes API from a Pod](https://kubernetes.io/docs/tasks/run-application/access-api-from-pod/)

## Terms

- Custom Resource Definition (CRD)
- Custom Resource Definition (CRD)
- Extended Berkeley Packet Filter (eBPF)
- Horizontal Pod Autoscaler (HPA)
- IP Virtual Server (IPVS)
- Out Of Memory (OOM)

## Tools

- [stern](/stern.md)
- [Lens (a.k.a. OpenLens)](/lens.md)

## Kubernetes Service Discovery Roles

- Node
- Service
- Pod
- Endpoints
- Ingress

## Phrases

- Kubernetes is the OS for cloud and defacto for cloud native apps

<!--
## Kubernetes Special Interest Groups (SIGs)
 -->

## Local Kubernetes

- [K3s](/k3s.md)
- [Kubernetes in Docker (kind)](/kind.md)
- [minikube](/minikube.md)
- [Project Tye](https://github.com/dotnet/tye)
- [Tilt](https://github.com/tilt-dev/tilt)

## Distributions

- Kubernetes
- Rancher
- Red Hat OpenShift

## Container Network Interface (CNI)

- Calico
- Cilium
- Flannel

More at [Cluster Networking](https://kubernetes.io/docs/concepts/cluster-administration/networking).

### Tips

#### Visual Studio Code

```sh
code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools
```

```sh
# Darwin
osascript -e 'quit app "Visual Studio Code"'

code --disable-extension ms-kubernetes-tools.vscode-kubernetes-tools
```

### Issues

#### Persistent Volume Claims

```log
Warning  FailedScheduling  21s (x6 over 4m41s)  default-scheduler  0/4 nodes are available: 4 pod has unbound immediate PersistentVolumeClaims.
```

TODO
