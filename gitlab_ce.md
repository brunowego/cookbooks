# GitLab Community Edition

<!--
/-/graphql-explorer
-->

## References

- [Issues API](https://docs.gitlab.com/ce/api/issues.html)
- [GitLab CI/CD environment variables](https://docs.gitlab.com/ce/ci/variables/)
- [Using Git submodules with GitLab CI](https://docs.gitlab.com/ee/ci/git_submodules.html)
- [GraphQL API](https://docs.gitlab.com/ce/api/graphql/)

## Helm

### References

- [Configure Charts using Globals](https://gitlab.com/charts/gitlab/blob/master/doc/charts/globals.md#connection)
- [Installation command line options](https://gitlab.com/charts/gitlab/blob/master/doc/installation/command-line-options.md)
- [Advanced configuration](https://gitlab.com/charts/gitlab/blob/master/doc/advanced/index.md)
- [TLS](https://gitlab.com/charts/gitlab/blob/master/doc/installation/tls.md)

### Dependencies

- [NGINX Ingress](/nginx-ingress.md)
- [Kubernetes TLS Secret](/k8s-tls-secret.md)

### Repository

```sh
helm repo add gitlab https://charts.gitlab.io
helm repo update gitlab
```

### Install

```sh
kubectl create namespace gitlab
```

```sh
helm install gitlab/gitlab \
  -n gitlab-ce \
  --namespace gitlab \
  --set global.edition=ce \
  --set global.hosts.domain=$(minikube ip).nip.io \
  --set global.hosts.registry.name=registry.gitlab.$(minikube ip).nip.io \
  --set global.hosts.minio.name=minio.gitlab.$(minikube ip).nip.io \
  --set global.ingress.configureCertmanager=false \
  --set global.ingress.class=nginx \
  --set certmanager.install=false \
  --set nginx-ingress.enabled=false \
  --set gitlab-runner.install=false
```

### SSL

#### Dependencies

- [Kubernetes TLS Secret](/k8s-tls-secret.md)

#### Create

```sh
kubectl create secret tls example.tls-secret \
  --cert='/etc/ssl/certs/example/root-ca.crt' \
  --key='/etc/ssl/private/example/root-ca.key' \
  -n gitlab
```

```sh
helm upgrade gitlab-ce gitlab/gitlab -f <(yq w <(helm get values gitlab-ce) global.ingress.tls.secretName example.tls-secret)
```

#### Remove

```sh
helm upgrade gitlab stable/gitlab -f <(yq d <(helm get values gitlab) spec.tls)

kubectl delete secret example.tls-secret -n gitlab
```

### Status

```sh
kubectl rollout status deploy/gitlab-ce-unicorn -n gitlab
```

### Logs

```sh
kubectl logs -l 'app=unicorn' -c unicorn -n gitlab -f
```

### DNS

```sh
dig @10.96.0.10 gitlab-ce-unicorn.gitlab.svc.cluster.local +short
nslookup gitlab-ce-unicorn.gitlab.svc.cluster.local 10.96.0.10
```

```sh
dig @10.96.0.10 gitlab.$(minikube ip).nip.io +short
nslookup gitlab.$(minikube ip).nip.io 10.96.0.10
```

### Secrets

```sh
# MinIO
kubectl get secret gitlab-ce-minio-secret \
  -o jsonpath='{.data.accesskey}' \
  -n gitlab | \
    base64 --decode; echo

kubectl get secret gitlab-ce-minio-secret \
  -o jsonpath='{.data.secretkey}' \
  -n gitlab | \
    base64 --decode; echo

# GitLab
kubectl get secret gitlab-ce-gitlab-initial-root-password \
  -o jsonpath='{.data.password}' \
  -n gitlab | \
    base64 --decode; echo
```

### NGINX Ingress

```sh
helm upgrade nginx-ingress stable/nginx-ingress -f <(yq w <(helm get values nginx-ingress) tcp.22 gitlab/gitlab-ce-gitlab-shell:22)
```

#### Project Features

```sh
# Disable CI/CD
helm upgrade gitlab-ce gitlab/gitlab -f <(yq w <(helm get values gitlab-ce) global.appConfig.defaultProjectsFeatures.builds false)
```

### Shell

```sh
kubectl exec -it \
  $(kubectl get pod -l 'app=unicorn' -o jsonpath='{.items[0].metadata.name}' -n gitlab) \
  -c unicorn \
  -n gitlab \
  -- /bin/bash
```

### Issues

#### Rails Secret

```log
MountVolume.SetUp failed for volume "init-migrations-secrets" : secret "gitlab-ce-rails-secret" not found
```

```sh
helm upgrade gitlab-ce gitlab/gitlab -f <(yq w <(helm get values gitlab-ce) shared-secrets.image.tag 28a3e18b1d65ab0e7a8e086b3c6e6ebbed4aeca3)
```

### Delete

```sh
helm delete gitlab-ce --purge
kubectl delete namespace gitlab --grace-period=0 --force

helm upgrade nginx-ingress stable/nginx-ingress -f <(yq d <(helm get values nginx-ingress) tcp.22)
```

## Docker

### Dependencies

- [mkcert](/mkcert.md#configuration)

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h redis \
  -e REDIS_PASSWORD=gitlab \
  -v gitlab-redis-data:/data \
  -p 6379:6379 \
  --name gitlab-redis \
  --network workbench \
  docker.io/library/redis:5.0.5-alpine3.9 /bin/sh -c 'redis-server --appendonly yes --requirepass ${REDIS_PASSWORD}'
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h postgres \
  -e POSTGRES_USER='gitlab' \
  -e POSTGRES_PASSWORD='gitlab' \
  -e POSTGRES_DB='gitlab' \
  -v gitlab-postgres-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name gitlab-postgres \
  --network workbench \
  docker.io/library/postgres:11.2-alpine
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h gitlab \
  -e GITLAB_OMNIBUS_CONFIG="$(cat << \EOF
external_url 'https://gitlab.example.com'
registry_external_url 'https://registry.example.com'

letsencrypt['enable'] = false

nginx['listen_port'] = 443
nginx['redirect_http_to_https'] = true

nginx['ssl_certificate'] = '/etc/gitlab/ssl/server.pem'
nginx['ssl_certificate_key'] = '/etc/gitlab/ssl/server.key'
registry_nginx['ssl_certificate'] = '/etc/gitlab/ssl/server.pem'
registry_nginx['ssl_certificate_key'] = '/etc/gitlab/ssl/server.key'

gitlab_rails['initial_root_password'] = 'Pa$$w0rd!'
gitlab_rails['initial_shared_runners_registration_token'] = 't0ken'

gitlab_rails['time_zone'] = 'America/Sao_Paulo'

redis['enable'] = false
gitlab_rails['redis_host'] = 'gitlab-redis'
gitlab_rails['redis_password'] = 'gitlab'
gitlab_rails['redis_database'] = 0

postgresql['enable'] = false
gitlab_rails['db_host'] = 'gitlab-postgres'
gitlab_rails['db_username'] = 'gitlab'
gitlab_rails['db_password'] = 'gitlab'
gitlab_rails['db_database'] = 'gitlab'
EOF
)" \
  -v /etc/ssl/certs/example.com/server:/etc/gitlab/ssl \
  -v gitlab-config:/etc/gitlab \
  -v gitlab-logs:/var/log/gitlab \
  -v gitlab-data:/var/opt/gitlab \
  -v /etc/localtime:/etc/localtime:ro \
  -p 2222:22 \
  -p 8080:80 \
  -p 4443:443 \
  --name gitlab-ce \
  --network workbench \
  docker.io/gitlab/gitlab-ce:13.4.4-ce.0
```

> Wait! This process take a while.

```sh
#
sudo hostess add gitlab.example.com 127.0.0.1
sudo hostess add registry.example.com 127.0.0.1

#
echo -e '[INFO]\thttp://gitlab.example.com:8080'
```

| Login | Password |
| --- | --- |
| `root` | `Pa$$w0rd!` |

### Remove

```sh
docker rm -f gitlab-redis gitlab-postgres gitlab-ce

docker volume rm gitlab-redis-data gitlab-postgres-data gitlab-config gitlab-logs gitlab-data
```

## Docs

### Bot

#### Account

1. Admin Area
2. New user
   - Account
     - Name: Bot
     - Username: bot
     - Email: bot@example.com
   - Access
     - Projects limit: 0
     - Uncheck: Can create group
     - Access level: (Check) Regular
   - Create user
3. Impersonate
4. Settings
5. Access Tokens
   - Name: Example
   - Scope: api
   - Create personal access token
6. Stop impersonation
7. Edit
   - Password
     - Password: Pa$$w0rd!
     - Password confirmation: Pa$$w0rd!
   - Save changes

#### Group

1. Groups
2. Your groups
3. Select group
4. Members
   - Add new member to *group*
     - User: Bot
     - Access Level: Developer
     - Add to group

### Issues from project

#### Using API

1. User -> Settings
2. Access Tokens
3. Personal Access Tokens
   - Name: API Access
   - Scopes: api -> Create

```sh
#
export GITLAB_PRIVATE_TOKEN='xyz'
export GITLAB_PROJECT_ID='123'
export GITLAB_DOMAIN='gitlab.example.com'

#
curl \
    --header "PRIVATE-TOKEN: ${GITLAB_PRIVATE_TOKEN}" \
    "https://${GITLAB_DOMAIN}/api/v4/projects/${GITLAB_PROJECT_ID}/issues?scope=all&state=closed" | jq
```

#### Export CSV

**Dependencies**

```sh
# APT
sudo apt -y install libtext-csv-perl libwww-perl libcrypt-ssleay-perl

# YUM
sudo yum -y install perl-Text-CSV perl-Crypt-SSLeay

# Darwin/CPAN
/usr/local/bin/perl -MCPAN -e 'install Text::CSV_XS'
/usr/local/bin/perl -MCPAN -e 'install Bundle::LWP'
/usr/local/bin/perl -MCPAN -we 'install LWP::Protocol::https'
```

```sh
#
wget https://gitlab.com/emobix/get-all-gitlab-issues-as-csv/-/raw/master/get-all-project-issues.pl

#
sed -i 's|gitlab.com|gitlab.example.com|' ./get-all-project-issues.pl

# FIX for Darwin
sed -i 's|/usr/bin/perl|/usr/local/bin/perl|' ./get-all-project-issues.pl

# Only closed
sed -i 's/\/issues/&?scope=all\&state=closed/' ./get-all-project-issues.pl
```

Add after `use ...`

```perl
$ENV{PERL_LWP_SSL_VERIFY_HOSTNAME} = 0;
```

```sh
#
export GITLAB_PRIVATE_TOKEN='xyz'
export GITLAB_PROJECT_ID='123'

#
chmod +x ./get-all-project-issues.pl

#
./get-all-project-issues.pl "$GITLAB_PROJECT_ID" "$GITLAB_PRIVATE_TOKEN"

#
rm ./get-all-project-issues.pl
```

<!-- ##

https://github.com/angristan/gitlab-repo-dl

```sh
wget https://raw.githubusercontent.com/angristan/gitlab-repo-dl/master/gitlab-repo-dl.sh

ssh_url_to_repo http_url_to_repo

chmod +x ./gitlab-repo-dl.sh

GITLAB_URL='https://[hostname]' GITLAB_TOKEN='3SFkZEXTSTVfnFFfD8-s' ./gitlab-repo-dl.sh group mov
```

```sh
ORG=mov; \
ACCESS_TOKEN=3SFkZEXTSTVfnFFfD8-s; \
  curl \
    --header "PRIVATE-TOKEN: $ACCESS_TOKEN" \
    "https://[hostname]/api/v4/groups/$ORG/projects" | \
      sed 's/,/\'$'\n''/g' | \
        grep -e 'http_url_to_repo*' | \
          cut -d \" -f 4 | \
            xargs -L1 git clone
``` -->
