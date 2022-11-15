# Capsule

<!--
https://www.youtube.com/watch?v=lsuK3Wusdbg
https://www.youtube.com/watch?v=H8bzEJN7fj8
https://www.youtube.com/watch?v=HAIHgBJhDEE
-->

**Keywords:** Kubernetes Multi-Tenancy, Policy-Based Framework

## Links

- [Code Repository](https://github.com/clastix/capsule)
- [Main Website](https://capsule.clastix.io/)

## Glossary

- OpenID Connect (OIDC)

## Terms

- Tenant Owner

## Lens

### Dependencies

- [Starboard Operator](#helm)

### Installation

1. Lens -> Extensions
2. Copy [TGZ URL Address of latest version](https://github.com/clastix/capsule-lens-extension/releases)
3. Extensions -> Paste in the Field URL -> Install

## Helm

### References

- [General Parameters](https://github.com/clastix/capsule/tree/master/charts/capsule#general-parameters)

### Repository

```sh
helm repo add clastix 'https://clastix.github.io/charts'
helm repo update
```

### Install

```sh
#
kubectl create ns capsule-system
# kubectl create ns tenancies

#
helm search repo -l clastix/capsule

#
helm install capsule clastix/capsule \
  --namespace capsule-system \
  --version 0.1.11

#
helm status capsule -n capsule-system
```

### Status

```sh
kubectl rollout status deployment/capsule-controller-manager \
  -n capsule-system
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=capsule' \
  -n capsule-system \
  -f
```

### Configuration

```sh
#
cat << EOF | kubectl create -f -
apiVersion: capsule.clastix.io/v1beta1
kind: Tenant
metadata:
  name: oil
spec:
  owners:
  - kind: User
    name: alice
  networkPolicies:
    items:
    - ingress:
      - from:
        - namespaceSelector:
            matchLabels:
              capsule.clastix.io/tenant: oil
      podSelector: {}
      policyTypes:
      - Egress
      - Ingress
EOF

#
kubectl get tenants -A
```

### Demo User

```sh
#
wget https://raw.githubusercontent.com/clastix/capsule/master/hack/create-user.sh
chmod +x ./create-user.sh

#
./create-user.sh alice oil

#
export KUBECONFIG='alice-oil.kubeconfig'

#
kubectl auth can-i --list

#
kubectl auth can-i create namespaces
kubectl create namespace oil-development

#
kubectl config set-context \
  --current \
  --namespace oil-development
```

<!--
#
kubectl auth can-i get networkpolicies
kubectl auth can-i create networkpolicies
kubectl auth can-i update networkpolicies
kubectl auth can-i patch networkpolicies
kubectl auth can-i delete networkpolicies
kubectl auth can-i deletecollection networkpolicies

#
kubectl auth can-i get rolebindings
kubectl auth can-i create rolebindings
kubectl auth can-i update rolebindings
kubectl auth can-i patch rolebindings
kubectl auth can-i delete rolebindings
kubectl auth can-i deletecollection rolebindings

#
kubectl auth can-i get roles
kubectl auth can-i create roles
kubectl auth can-i update roles
kubectl auth can-i patch roles
kubectl auth can-i delete roles
kubectl auth can-i deletecollection roles

#
kubectl auth can-i delete ns -n oil-production
kubectl auth can-i get namespaces
kubectl auth can-i get nodes
kubectl auth can-i get persistentvolumes
kubectl auth can-i get tenants
-->

### Delete

```sh
helm uninstall capsule \
  -n capsule-system

kubectl delete ns capsule-system \
  --grace-period=0 \
  --force
```

<!--
https://github.com/gkarthiks/capsule-allow-sa/blob/main/docs/content/general/mtb.md
-->

<!--
```yml
---
apiVersion: capsule.clastix.io/v1beta1
kind: Tenant
metadata:
  name: oil
spec:
  owners:
    - kind: User
      name: alice
  networkPolicies:
    items:
      - ingress:
          - from:
              - namespaceSelector:
                  matchLabels:
                    capsule.clastix.io/tenant: oil
        podSelector: {}
        policyTypes:
          - Egress
          - Ingress

---
apiVersion: capsule.clastix.io/v1alpha1
kind: Tenant
metadata:
  name: team-1
spec:
  limitRanges:
    - limits:
        - max:
            cpu: '1'
            memory: 1Gi
          min:
            cpu: 50m
            memory: 5Mi
          type: Pod
        - default:
            cpu: 200m
            memory: 100Mi
          defaultRequest:
            cpu: 100m
            memory: 10Mi
          max:
            cpu: '1'
            memory: 1Gi
          min:
            cpu: 50m
            memory: 5Mi
          type: Container
        - max:
            storage: 10Gi
          min:
            storage: 1Gi
          type: PersistentVolumeClaim
  namespaceQuota: 3
  networkPolicies:
    - egress:
        - to:
            - ipBlock:
                cidr: 0.0.0.0/0
                except:
                  - 192.168.0.0/12
      ingress:
        - from:
            - namespaceSelector:
                matchLabels:
                  capsule.clastix.io/tenant: team-1
            - podSelector: {}
            - ipBlock:
                cidr: 192.168.0.0/12
      podSelector: {}
      policyTypes:
        - Ingress
        - Egress
  nodeSelector:
    kubernetes.io/os: linux
  owner:
    kind: User
    name: team1-member-1
  resourceQuotas:
    - hard:
        limits.cpu: '8'
        limits.memory: 16Gi
        requests.cpu: '8'
        requests.memory: 16Gi
      scopes:
        - NotTerminating
    - hard:
        pods: '10'
    - hard:
        requests.storage: 100Gi
  storageClasses:
    allowed:
      - default
    allowedRegex: ''
  containerRegistries:
    allowed:
      - docker.io
    allowedRegex: ''
```
-->
