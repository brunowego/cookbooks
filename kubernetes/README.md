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

**Keywords:** Infrastructure as Code

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
- [Lens (a.k.a. OpenLens)](/lens/README.md)

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
- [Tilt](/tilt/README.md)

<!--
Skaffold
Podman
Linux Container Daemon (LXD)
Buildah
Kaniko
-->

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
#
code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools

#
jq '."recommendations" += ["ms-kubernetes-tools.vscode-kubernetes-tools"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

<!-- ####

```sh
export KUBERNETES_IP='<kubernetes-ip>'
export K8S_DOMAIN="${KUBERNETES_IP}.nip.io"

export K8S_DOMAIN='k8s.orb.local'
``` -->

### Issues

#### Error Image Pull

```log
Failed to pull image "opensearchproject/opensearch:2.4.1": rpc error: code = Unknown desc = context deadline exceeded
```

```log
Error: ErrImagePull
Error: ImagePullBackOff
```

```sh
#
kubectl get events

# Workaround for minikube
minikube ssh docker pull opensearchproject/opensearch:2.4.1
```

#### Persistent Volume Claims

```log
Warning  FailedScheduling  21s (x6 over 4m41s)  default-scheduler  0/4 nodes are available: 4 pod has unbound immediate PersistentVolumeClaims.
```

<!-- 0/1 nodes are available: pod has unbound immediate PersistentVolumeClaims. preemption: 0/1 nodes are available: 1 Preemption is not helpful for scheduling. -->

TODO
