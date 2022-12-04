# Jenkins

<!--
https://linkedin.com/learning/jenkins-essential-training/
https://linkedin.com/learning/learning-jenkins/
https://app.pluralsight.com/paths/skill/continuous-integration-with-jenkins

https://github.com/kiegroup/kogito-pipelines

Jenkins Configuration as Code (aka JCasC)
-->

**Keywords:** Continuous Integration

## Links

- [Main Website](https://jenkins.io/)
- [Plugins](https://plugins.jenkins.io/)
- [CD Foundation](https://cd.foundation/)

## Related

- [Groovy](/apache/apache_groovy.md)

## Helm

### References

- [Configuration](https://github.com/jenkinsci/helm-charts/tree/main/charts/jenkins#configuration)

### Dependencies

- [NGINX Ingress](/nginx-ingress.md)
- [Kubernetes TLS Secret](/k8s-tls-secret.md)

### Repository

```sh
helm repo add jenkins 'https://charts.jenkins.io'
helm repo update
```

### Install

```sh
#
kubectl create ns jenkins-system

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install jenkins jenkins/jenkins \
  --namespace jenkins-system \
  --version 3.5.2 \
  -f <(cat << EOF
controller:
  installPlugins:
  - kubernetes:1.29.4
  - workflow-aggregator:2.6
  - git:4.7.1
  - configuration-as-code:1.51
  ingress:
    enabled: true
    hostName: jenkins.${DOMAIN}
EOF
)
```

### Status

```sh
kubectl rollout status statefulset/jenkins \
  -n jenkins-system
```

### Logs

```sh
#
kubectl logs $(kubectl get pod -l 'app.kubernetes.io/name=jenkins' -o jsonpath='{.items[0].metadata.name}' -n jenkins-system) init \
  -n jenkins-system \
  -f

#
kubectl logs \
  -l 'app.kubernetes.io/name=jenkins' \
  -n jenkins-system \
  -c init \
  -f
```

### Secrets

```sh
kubectl get secret jenkins \
  -o jsonpath='{.data.jenkins-admin-password}' \
  -n jenkins-system | \
    base64 -d; echo
```

### Plugins

```sh
# Default
helm upgrade jenkins jenkins/jenkins \
  -n jenkins-system \
  -f <(yq m <(helm get values jenkins -n jenkins-system) <(yq p <(yq r <(helm get --all jenkins values -n jenkins-system) controller.installPlugins) controller.installPlugins))
```

```sh
# GitLab
helm upgrade jenkins jenkins/jenkins -n jenkins-system -f <(yq w <(helm get values jenkins -n jenkins-system) 'controller.installPlugins[+]' gitlab:1.5.12)

# NXRM OSS
helm upgrade jenkins jenkins/jenkins -n jenkins-system -f <(yq w <(helm get values jenkins -n jenkins-system) 'controller.installPlugins[+]' nexus-jenkins:3.7.20190823-091836.9f85050)

# Kubernetes CD
helm upgrade jenkins jenkins/jenkins -n jenkins-system -f <(yq w <(helm get values jenkins -n jenkins-system) 'controller.installPlugins[+]' kubernetes-cd:2.1.2)

# Blue Ocean
helm upgrade jenkins jenkins/jenkins -n jenkins-system -f <(yq w <(helm get values jenkins -n jenkins-system) 'controller.installPlugins[+]' blueocean:1.18.3)
```

### Custom Agent

```sh
helm upgrade jenkins jenkins/jenkins -n jenkins-system -f <(yq m <(cat << EOF
agent:
  image: docker.io/brunowego/jnlp-slave-s2i
  tag: 3.29-1
  volumes:
  - type: HostPath
    hostPath: /var/run/docker.sock
    mountPath: /var/run/docker.sock
  envVars:
  - name: DOCKER_REGISTRY_URL
    value: https://registry.${DOMAIN}
  - name: DOCKER_REGISTRY_CREDENTIAL
    value: nxrm-oss-credential
EOF
) <(helm get values jenkins -n jenkins-system))
```

<!-- ### DNS

```sh
kubectl exec -it \
   $(kubectl get pod -l 'app.kubernetes.io/name=jenkins' -o jsonpath='{.items[0].metadata.name}' -n jenkins-system) \
  -n jenkins-system \
  -- cat /etc/resolv.conf
```

- [Kubernetes DNS](/k8s-dns.md) -->

### Proxy

```sh
helm upgrade jenkins jenkins/jenkins \
  -n jenkins-system \
  -f <(yq m <(cat << EOF
master:
  initContainerEnv:
    - name: http_proxy
      value: "$http_proxy"
    - name: https_proxy
      value: "$http_proxy"
    - name: no_proxy
      value: "$no_proxy"
  containerEnv:
    - name: http_proxy
      value: "$http_proxy"
    - name: https_proxy
      value: "$http_proxy"
  javaOpts: "$JAVA_OPTS"
EOF
) <(helm get values jenkins -n jenkins-system))
```

### Shell

```sh
kubectl exec -it \
  $(kubectl get pod -l 'app.kubernetes.io/name=jenkins' -o jsonpath='{.items[0].metadata.name}' -n jenkins-system) \
  -c jenkins \
  -n jenkins-system \
  -- /bin/bash
```

### Issues

#### PVCs Resizing

```log
Error: UPGRADE FAILED: cannot patch "jenkins" with kind PersistentVolumeClaim: PersistentVolumeClaim "jenkins" is invalid: spec.resources.requests.storage: Forbidden: field can not be less than previous value
```

Kubernetes PVCs resizing only allows to expand volumes, not to decrease them. If you try to decrease the storage size, you will get a message like above.

#### Git SSL no Verify

```log
stderr: fatal: unable to access 'https://gitlab.example.com/[group]/[project].git/': server certificate verification failed. CAfile: /etc/ssl/certs/ca-certificates.crt CRLfile: none
```

1. Manage Jenkins
2. Configure System
3. Global properties
   - Check: Environment variables
     - Name: GIT_SSL_NO_VERIFY
     - Value: true
   - Save

<!-- FIXME: Find a better alternative. -->

```sh
kubectl exec -it \
  $(kubectl get pod -l 'app.kubernetes.io/name=jenkins' -o jsonpath='{.items[0].metadata.name}' -n jenkins-system) \
  -n jenkins-system \
  -- git config --global http.sslVerify false
```

#### Member User

```log
stderr: remote: The project you were looking for could not be found.
fatal: repository 'https://gitlab.example.com/[group]/[project].git/' not found
```

Try add user to group.

#### GitLab Outbound Requests

```log
Url is blocked: Host cannot be resolved or invalid
```

1. Admin Area
2. Settings
3. Network
4. Outbound requests
5. Whitelist to allow requests to the local network from hooks and services
   - Add: jenkins.example.com

#### Unknown Host Exception

##### Nexus

```log
java.net.UnknownHostException: nexus.example.com: Temporary failure in name resolution
```

Add [https://nexus.example.com](https://nexus.example.com) to [CoreDNS](/coredns.md).

##### GitLab CE

```log
Client error: gitlab.example.com: Temporary failure in name resolution
```

Add [https://gitlab.example.com](https://gitlab.example.com) to [CoreDNS](/coredns.md).

##### Jenkins

```log
Url is blocked: Host cannot be resolved or invalid
```

Add [https://jenkins.example.com](https://jenkins.example.com) to [CoreDNS](/coredns.md).

#### Sun Cert Path Builder Exception

```log
sun.security.provider.certpath.SunCertPathBuilderException: unable to find valid certification path to requested target
```

```sh
kubectl exec -it \
  "$(kubectl get pod -l 'app.kubernetes.io/name=jenkins' -o jsonpath='{.items[0].metadata.name}' -n jenkins-system)" \
  -n jenkins-system \
  -- mkdir -p /etc/ssl/certs/example
```

```sh
kubectl cp /etc/ssl/certs/example/root-ca.crt jenkins/"$(kubectl get pod -l 'app.kubernetes.io/name=jenkins' -o jsonpath='{.items[0].metadata.name}' -n jenkins-system)":/etc/ssl/certs/example/root-ca.crt
```

```sh
kubectl exec -it \
  "$(kubectl get pod -l 'app.kubernetes.io/name=jenkins' -o jsonpath='{.items[0].metadata.name}' -n jenkins-system)" \
  -n jenkins-system \
  -- keytool -importcert \
       -noprompt \
       -trustcacerts \
       -alias 'example-root-ca' \
       -file '/etc/ssl/certs/example/root-ca.crt' \
       -keystore '/usr/local/openjdk-8/jre/lib/security/cacerts' \
       -storepass changeit
```

<!-- https://stackoverflow.com/questions/46123457/restart-container-within-pod -->
<!-- https://medium.com/faun/how-to-restart-kubernetes-pod-7c702ca984c1 -->

<!-- ```sh
kubectl exec -it \
  "$(kubectl get pod -l 'app.kubernetes.io/name=jenkins' -o jsonpath='{.items[0].metadata.name}' -n jenkins-system)" \
  -c jenkins \
  -n jenkins-system \
  -- /bin/sh -c 'kill 1'
``` -->

#### SSL Peer Unverified Exception

```log
javax.net.ssl.SSLPeerUnverifiedException: Certificate for <subdomain.example.com> doesn't match any of the subject alternative names: []
```

```sh
# kubectl exec -it \
#   $(kubectl get pod -l 'app.kubernetes.io/name=jenkins' -o jsonpath='{.items[0].metadata.name}' -n jenkins-system) \
#   -n jenkins-system \
#   -- keytool -list \
#        -keystore '/usr/local/openjdk-8/jre/lib/security/cacerts' \
#        -storepass changeit
```

### Delete

```sh
helm uninstall jenkins \
  -n jenkins-system

kubectl delete ns jenkins-system \
  --grace-period=0 \
  --force
```

## Docker

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h jenkins \
  -v jenkins-data:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  -e JAVA_OPTS="$JAVA_OPTS" \
  -p 8080:8080 \
  -p 50000:50000 \
  --name jenkins \
  jenkins/jenkins:2.176.3
```

```sh
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'
echo -e '[INFO]\thttp://127.0.0.1:50000'
```

### Remove

```sh
docker rm -f jenkins
docker volume rm jenkins-data
```

## CLI

### Dependencies

- [OpenJDK](/openjdk/README.md)

### Installation

#### Homebrew

```sh
brew install jenkins
```

<!-- #### WAR

```sh
#
wget 'https://get.jenkins.io/war-stable/latest/jenkins.war'

#
java -jar ./jenkins.war \
  --httpPort=9090
``` -->

<!--
java -jar Jenkins.war
-->

#### YUM

```sh
yum check-update
sudo yum -y install jenkins
```

### Commands

```sh
jenkins --help
jenkins-cli help
```

### Service

```sh
# Homebrew
brew services start jenkins

# Systemd
sudo systemctl enable --now jenkins
```

### Tips

#### Visual Studio Code

```sh
#
code --install-extension ivory-lab.jenkinsfile-support

#
jq '."recommendations" += ["ivory-lab.jenkinsfile-support"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

#### EditorConfig

```sh
cat << EOF >> ./.editorconfig

[Jenkinsfile]
indent_size = 4
EOF
```

## Docs

### Enable security

1. Manage Jenkins
2. Configure Global Security
3. Check: Enable security
4. Select: Jenkins’ own user database
5. Save

### Create User

1. Manage Jenkins
2. Manage Users
3. Create User

### GitLab

#### Integration

- [Global plugin configuration](https://github.com/jenkinsci/gitlab-plugin#global-plugin-configuration)

1. Manage Jenkins
2. Configure System
3. Gitlab -> GitLab connections
   - Connection name: GitLab CE Example
   - Gitlab host URL: [https://gitlab.example.com](https://gitlab.example.com)
   - Credentials: Add -> [Jenkins](https://github.com/jenkinsci/gitlab-plugin#jenkins-to-gitlab-authentication)
     - Domain: Global credentials (unrestricted)
     - Kind: GitLab API token
     - Scope: Global (Jenkins, nodes, items, all child items, etc)
     - API token: Create on [https://gitlab.example.com/profile/personal_access_tokens](https://gitlab.example.com/profile/personal_access_tokens)
       - Name: jenkins
       - Scopes: api
     - ID: gitlab-ce-token
     - Description: GitLab CE token for Jenkins
     - Add
   - Advanced...
   - Check (if needed): Ignore SSL Certificate Errors
   - Test Connection
4. Save

#### Credentials

1. Credentials
2. System
3. Global credentials (unrestricted)
4. Add Credentials
   - Kind: Username with password
   - Scope: Global (Jenkins, nodes, items, all child items, etc)
   - Username: ...
   - Password: ...
   - ID: gitlab-ce-credential
   - Description: GitLab CE user for Jenkins
   - OK

#### Job

1. New Item
   - Enter an item name: project
   - Select: Pipeline
   - Ok
2. Job
   - Geleral
     - GitLab Connection: GitLab CE Example
   - Build Triggers
     - Check: Build when a change is pushed to GitLab. GitLab webhook URL: ...
     - Advanced...
     - Secret token: (Click) Generate
   - Pipeline
     - Definition: (Select) Pipeline script from SCM
     - SCM: (Select) Git
     - Repositories:
       - Repository URL: ...
       - Credentials: ...

#### Webhook

Access GitLab project:

1. Settings
2. Integrations
   - URL: ...
   - Secret Token: ...
   - Trigger: (check) Push events
   - SSL verification: (Uncheck) Enable SSL verification

### Sonatype Nexus

#### Nexus Repository Manager Servers

- [Global Configuration](https://help.sonatype.com/repomanager2/maven-and-other-build-tools/jenkins#Jenkins-GlobalConfiguration)

1. Manage Jenkins
2. Configure System
3. Sonatype Nexus -> Nexus Repository Manager Servers
   - (Select) Nexus Repository Manager 3.x Server
   - Display Name: NXRM OSS Example
   - Server ID: nxrm-oss-example
   - Server URL: [https://nexus.example.com](https://nexus.example.com)
   - Credentials: Add -> Jenkins
     - Domain: Global credentials (unrestricted)
     - Kind: Username with password
     - Scope: Global (Jenkins, nodes, items, all child items, etc)
     - Username: ...
     - Password: ...
     - ID: nxrm-oss-credential
     - Description: NXRM OSS user for Jenkins
     - Add
   - Test connection
   - Save

<!--
## Interview

https://www.youtube.com/watch?v=nEoXhKSLzbE
https://www.youtube.com/watch?v=TCl-x9camEQ
https://www.youtube.com/watch?v=2AVp9kie6s8
-->
