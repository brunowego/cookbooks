# kOps Controller

## Issues

<!-- ###

```log
E1119 19:19:25.768787       1 deleg.go:144] setup "msg"="unable to start server" "error"="reading \"kubernetes-ca\" certificate: open /etc/kubernetes/kops-controller/pki/kubernetes-ca.crt: no such file or directory"
```

TODO-->

### Security Token Service (STS)

<!--
https://kops.sigs.k8s.io/cluster_spec/#service-account-issuer-discovery-and-aws-iam-roles-for-service-accounts-irsa
https://github.com/kubernetes/kops/issues/12299
https://github.com/kubernetes/kops/pull/12043
https://github.com/kubernetes/kops/pull/12146
https://www.opensourceagenda.com/projects/kops/versions
https://kops.sigs.k8s.io/releases/1.21-notes/
https://githubmemory.com/repo/kubernetes/kops/issues/12042
-->

```log
kops-controller-ztlpm kops-controller I1119 00:01:44.709258       1 server.go:109] bootstrap 10.98.53.156:33262 verify err: received status code 403 from STS: <ErrorResponse xmlns="https://sts.amazonaws.com/doc/2011-06-15/">
kops-controller-ztlpm kops-controller   <Error>
kops-controller-ztlpm kops-controller     <Type>Sender</Type>
kops-controller-ztlpm kops-controller     <Code>SignatureDoesNotMatch</Code>
kops-controller-ztlpm kops-controller     <Message>The request signature we calculated does not match the signature you provided. Check your AWS Secret Access Key and signing method. Consult the service documentation for details.</Message>
kops-controller-ztlpm kops-controller   </Error>
kops-controller-ztlpm kops-controller   <RequestId>0f2bd0e6-e85e-4d15-a8c6-fdd22a61b94f</RequestId>
kops-controller-ztlpm kops-controller </ErrorResponse>
```

```sh
#
stern kops-controller -n kube-system
```

TODO
