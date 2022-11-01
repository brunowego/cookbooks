# Kubernetes Security

<!--
https://app.pluralsight.com/paths/certificate/certified-kubernetes-security-specialist-cks
-->

## Guides

- [Kubernetes Security](https://kubernetes.io/docs/concepts/security/)

## Terms

- Pod Security Policy (PSP)

## Securing the API Server

### Authentication

- Client Certificates
  - Most commonly usage
  - Default when using kubeadm
  - Common Name (CN) is the username
- Authentication Tokens
  - HTTP Authorization Header in the client request
  - Service Accounts
  - Bootstrap Tokens and Static File
- Basic HTTP
  - Static password file
  - Only read during API server startup
  - Simple to set up and use (dev)

<!-- - OpenID Connect -->

#### Users in Kubernetes (kubectl)

- Users are managed by external systems
- No User API Object
- Authentication plugin implements authentication
- Authentication is plugable
- Usernames used for access control and logging
- Users can be aggregated into groups

#### Service Accounts (Pods)

- Authenticate Pods to the API Server
- Apply permissions for authorization
- Namespaced API Object
- Default ServiceAccount per Namespace
- All Pods must have a ServiceAccount defined
- Create ServiceAccounts Object
- Credentials
  - Credential stored as a Secret
    - CA Certificate
    - Token
    - Namespace
  - Interact with the API server
  - Image pull secret
  - Mounted inside a Pod as files using a Volume (`/var/run/secrets/kubernetes.io/serviceaccount`)

### Authorization

- Role-based Access Control (RBAC)
- Node
- Attribute-based Access Control (ABAC)

### Admission Control

TODO

## Certificates and PKI in Kubernetes

- TLS Encryption
- User and System Component authentication
- `kubeadm-based` clusters
  - Creates a self-signed Certificate Authority
  - Generates certificates for System Components
  - `kubernetes-admin` user
- Can use an external/trusted CA ([Certificate Management with kubeadm](https://kubernetes.io/docs/tasks/administer-cluster/kubeadm/kubeadm-certs/))
- Single self-signed Certificate Authority
  - `/etc/kubernetes/pki/`
    - `ca.key` - This is the private key
    - `ca.crt` - CA Certificate
  - Distribute to clients to trust your self-signed CA
  - Copied to Nodes in the cluster during build

## Kubernetes Architecture

### Control Plane

- etcd
- Scheduler
- Controller Manager
- API Server

### Node

- Kubelet
- Kube-proxy
- Container Runtime

## Tips

### Creating a Certificate Signing Request in OpenSSL

```sh
#
kubectl get certificatesigningrequests

#
export CN='[username]'

# Create a private key
openssl genrsa \
  -out "./$CN.key" \
  2048

# Generate a CSR
# CN (Common Name) is your username. O (Organization is the Group)
openssl req \
  -new \
  -key "./$CN.key" \
  -out "./$CN.csr" \
  -subj "/CN=$CN"

#
cat "./$CN.csr" | \
  base64 | \
    tr -d '\n' \
      > "./$CN.base64.csr"

#
cat << EOF | kubectl apply -f -
apiVersion: certificates.k8s.io/v1
kind: CertificateSigningRequest
metadata:
  name: $CN
spec:
  groups:
  - system:authenticated
  request: $(cat ./$CN.base64.csr)
  usages:
  - client auth
EOF

#
kuberctl certificate approve "$CN"

#
kubectl get certificatesigningrequest "$CN" \
  -o jsonpath '{.status.certificate}' | \
    base64 -d \
      > "./$CN.crt"
```
