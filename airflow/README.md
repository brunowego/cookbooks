# Apache Airflow

<!--
https://app.pluralsight.com/library/courses/productionalizing-data-pipelines-apache-airflow/table-of-contents

https://airflow.apache.org/docs/apache-airflow/stable/howto/connection.html
https://airflow.apache.org/docs/apache-airflow-providers-amazon/stable/connections/aws.html
-->

## Alternatives

- [Argo Workflows](/argo/argo-workflows.md)

## Guides

- [Operators](https://airflow.apache.org/_api/airflow/operators/index.html)
- [Scheduler](https://airflow.apache.org/scheduler.html)
- [Airflow SSH](https://airflow.readthedocs.io/en/latest/howto/connection/ssh.html)

## CLI

### Installation

#### pip

```sh
export SLUGIFY_USES_TEXT_UNIDECODE=yes​

pip3 install apache-airflow[postgres]
```

### Commands

```sh
airflow -h
```

### Usage

```sh
#
airflow initdb

#
airflow webserver
```

## Helm

### References

- [Chart Repository](https://github.com/airflow-helm/charts/tree/main/charts/airflow)

### Repository

```sh
helm repo add airflow-stable 'https://airflow-helm.github.io/charts'
helm repo update
```

### Install

```sh
#
kubectl create ns airflow

#
export INGRESS_HOST='127.0.0.1'

#
helm install airflow airflow-stable/airflow \
  --namespace airflow \
  --version 8.5.2 \
  -f <(cat << EOF
airflow:
  fernetKey: '$(echo -n $(openssl rand -base64 32))'
  webserverSecretKey: '$(echo -n $(openssl rand -base64 32))'

  users:
  - username: admin
    password: admin
    role: Admin
    email: admin@example.com
    firstName: admin
    lastName: admin

  config:
    AIRFLOW__CORE__DEFAULT_TIMEZONE: America/Sao_Paulo
    AIRFLOW__CORE__LOAD_EXAMPLES: 'True'

ingress:
  enabled: true
  web:
    host: airflow.${INGRESS_HOST}.nip.io
  flower:
    host: flower.${INGRESS_HOST}.nip.io
EOF
)
```

### Persistence

#### Local

```sh
helm upgrade airflow airflow-stable/airflow \
  --namespace airflow \
  -f <(yq m <(cat << EOF
logs:
  persistence:
    enabled: true
    size: 1Gi

dags:
  persistence:
    enabled: true
    size: 1Gi
EOF
) <(helm get values airflow --namespace airflow))
```

#### Remote (Logging)

**Dependencies:** [MinIO](/minio/README.md#helm)

```sh
#
helm upgrade airflow airflow-stable/airflow \
  --namespace airflow \
  -f <(yq m <(cat << EOF
airflow:
  config:
    AWS_DEFAULT_REGION: us-east-1
    AIRFLOW__LOGGING__REMOTE_LOGGING: 'True'
    AIRFLOW__LOGGING__REMOTE_BASE_LOG_FOLDER: s3://airflow/logs
    AIRFLOW__LOGGING__REMOTE_LOG_CONN_ID: local_minio

  connections:
    - id: local_minio
      type: s3
      login: minio
      password: minio123
      extra: |-
        {
          "host": "http://minio:9000",
          "region_name": "us-east-1"
        }
EOF
) <(helm get values airflow --namespace airflow))
```

### Prometheus Stack

**Dependencies:** [kube-prometheus (a.k.a prometheus-stack, p.k.a. prometheus-operator)](/prometheus/prometheus-stack.md)

```sh
#
kubectl get prometheus \
  -o jsonpath='{.items[*].spec.serviceMonitorSelector}' \
  -n monitoring

#
helm upgrade airflow airflow-stable/airflow \
  --namespace airflow \
  -f <(yq m <(cat << EOF
serviceMonitor:
  enabled: true
  selector:
    release: prometheus-stack

prometheusRule:
  enabled: true
EOF
) <(helm get values airflow --namespace airflow))
```

### Status

```sh
kubectl rollout status deploy/airflow-web \
  -n airflow
```

### Logs

```sh
kubectl logs \
  -l 'component=web' \
  -n airflow \
  -f
```

### Issues

#### Missing SSM Full Access Policy

```log
An error occurred (AccessDeniedException) when calling the GetParameter operation: User: arn:aws:sts::[...]:assumed-role/nodes.[...].k8s.local/i-[...] is not authorized to perform: ssm:GetParameter on resource: arn:aws:ssm:us-east-1:[...]:parameter/airflow/connections/aws_s3
```

1. Go to Identity and Access Management (IAM)
2. Roles tab -> Find the role
3. Atache "AmazonSSMFullAccess" policy

<!-- ####

```log
Warning  FailedScheduling  15s   default-scheduler  running PreBind plugin "VolumeBinding": Operation cannot be fulfilled on persistentvolumeclaims "airflow-dags": the object has been modified; please apply your changes to the latest version and try again
```

TODO -->

<!-- ####

```log
Warning  ProvisioningFailed  30s (x6 over 95s)  persistentvolume-controller  Failed to provision volume with StorageClass "default": invalid AccessModes [ReadWriteMany]: only AccessModes [ReadWriteOnce] are supported
```

TODO -->

<!-- ####

```log
*** Log file does not exist: /opt/airflow/logs/example_bash_operator/runme_0/2021-09-14T23:18:43.579004+00:00/1.log
*** Fetching from: http://airflow-worker-0.airflow-worker.at-airflow.svc.cluster.local:8793/log/example_bash_operator/runme_0/2021-09-14T23:18:43.579004+00:00/1.log
```

TODO -->

### Delete

```sh
helm uninstall airflow \
  -n airflow

kubectl delete ns airflow \
  --grace-period=0 \
  --force
```

## Kubectl

```sh
kubectl run -it \
  curl \
  --image docker.io/apache/airflow:2.1.3-python3.8 \
  --command \
  -- /bin/bash
```

<!-- ## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

#### MySQL

```sh
#
docker run -d \
  -h mysql \
  -e MYSQL_ROOT_PASSWORD=root \
  -e MYSQL_USER=airflow \
  -e MYSQL_PASSWORD=airflow \
  -e MYSQL_DATABASE=airflow \
  -v airflow-mysql-data:/var/lib/mysql \
  -p 3306:3306 \
  --name airflow-mysql \
  mysql:5.7

#
docker run -d \
  -h airflow \
  -e LOAD_EX=n \
  -e EXECUTOR=Local \
  -e AIRFLOW__CORE__SQL_ALCHEMY_CONN='mysql://airflow:airflow@airflow-mysql:3306/airflow' \
  -e AIRFLOW__CELERY__RESULT_BACKEND='db+mysql://root:root@airflow-mysql:3306/airflow' \
  -v airflow-dags:/usr/local/airflow/dags \
  -p 8080:8080 \
  --name airflow \
  docker.io/apache/airflow:2.1.3-python3.8 webserver

#
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

#### PostgreSQL

```sh
#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h postgres \
  -e POSTGRES_USER=airflow \
  -e POSTGRES_PASSWORD=airflow \
  -e POSTGRES_DB=airflow \
  -v airflow-postgres-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name airflow-postgres \
  --network workbench \
  docker.io/library/postgres:11.2-alpine

#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h airflow \
  -e LOAD_EX=n \
  -e EXECUTOR=Local \
  -e POSTGRES_HOST=airflow-postgres \
  -e POSTGRES_USER=airflow \
  -e POSTGRES_PASSWORD=airflow \
  -e POSTGRES_DB=airflow \
  -v airflow-dags:/usr/local/airflow/dags \
  -p 8080:8080 \
  --name airflow \
  --network workbench \
  docker.io/apache/airflow:2.1.3-python3.8 webserver

#
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

### Dags

```sh
#
docker exec -iu root airflow /bin/sh << EOSHELL
cat << EOF > /usr/local/airflow/dags/[name].py

EOF
EOSHELL

#
docker exec -i airflow ls /usr/local/airflow/dags

#
docker exec -itu root airflow /bin/bash
```

### Remove

```sh
# MySQL
docker rm -f \
  airflow-mysql \
  airflow

docker volume rm \
  airflow-mysql-data \
  airflow-dags

# PostgreSQL
docker rm -f \
  airflow-postgres \
  airflow

docker volume rm \
  airflow-postgres-data \
  airflow-dags
``` -->
