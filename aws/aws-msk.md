# AWS Managed Streaming for Apache Kafka (MSK)

<!--
https://www.youtube.com/watch?v=4C_FT2Ie9E4

https://github.com/troydieter/tf-msk

https://github.com/lokiloveu1/AWS-MSK/blob/6e717eb8c89110ae0707e096e8fb6fb3e47b11fd/Steps-To-Build-MSK-Client-In-Another-VPC

https://aws.amazon.com/blogs/big-data/how-goldman-sachs-builds-cross-account-connectivity-to-their-amazon-msk-clusters-with-aws-privatelink/

https://maikelpenz.medium.com/building-a-kafka-playground-on-aws-part-1-setting-the-foundation-3065ecf51c19

https://learn-msk.com/courses/amazon-msk-master-class
https://www.whizlabs.com/amazon-managed-streaming-for-apache-kafka/
https://github.com/cloudposse/terraform-aws-msk-apache-kafka-cluster
https://github.com/lokiloveu1/AWS-MSK/blob/main/Steps-To-Build-MSK-Client-In-Another-VPC
https://github.com/aws-samples/aws-msk-content-streaming
https://github.com/Financial-Times/upp-provisioners/blob/6e59d051488c4609afbb8d9d8d06df1f9604b374/upp-msk-provisioner/scripts/getConfig.sh
https://github.com/liangruibupt/aws-is-how/blob/3121a70cfa634237ef0eaf76303d4b60d13edbfa/analytics/msk/kafka-s3-event-processor.py

https://github.com/msfidelis/aws-msk-glue-kafka-setup

https://github.com/vipertoothlabs/terraform-msk-cluster-config
https://github.com/ngodec/terraform-aws-msk/tree/main/modules/aws-msk
https://github.com/juliocesarscheidt/aws-msk-cluster
https://github.com/gaarm/terraform-aws-msk
https://github.com/brunocamboim/terraform-aws-msk-example/blob/master/src/msk.tf
https://github.com/troydieter/tf-msk
https://github.com/linxiaow/AWS-MSK-Transaction-Fraud-Detection
https://github.com/garystafford/terraform-msk-demo
https://github.com/cloudposse/terraform-aws-msk-apache-kafka-cluster
https://github.com/angelabad/terraform-aws-msk-cluster
https://github.com/aws-samples/aws-msk-content-streaming
https://github.com/hyprnz/terraform-aws-msk-module
https://github.com/aws-samples/aws-dms-msk-demo
https://github.com/stefanfreitag/msk_demo
https://github.com/cgetzen/terraform-aws-public-msk
https://github.com/aws-samples/amazon-msk-java-app-cdk
https://github.com/JamesWoolfenden/terraform-aws-msk
https://github.com/rishiraj824/cc-fraud-detection-aws-microservice
https://github.com/TanAlex/msk-glue-redshift
https://github.com/cfn-modules/msk-cluster
https://github.com/taufiqibrahim/serverless-stream-processing-aws-msk-lambda
https://github.com/leosilvadev/fetch-aws-msk-brokers-bootstrap-strings-action
https://github.com/brunocamboim/serverless-aws-msk-trigger-lambda
https://github.com/matwerber1/aws-msk-kafka-connect-docker/tree/master/src
https://github.com/harshdev93/AWS-MSK-Sample-Producer-Consumer
https://github.com/cmcconnell1/terraform-aws-msk-kafka
https://github.com/jalcalaroot/msk-aws-tf/blob/master/main.tf
https://github.com/infrablocks/terraform-aws-msk
https://github.com/zerosoftwere/aws-msk-demo
https://github.com/karthikeayan/terraform-aws-msk/blob/master/kms.tf
https://github.com/karthikeayan/terraform-aws-msk/blob/master/kms.tf
https://github.com/insight-infrastructure/terraform-aws-msk
https://github.com/rtacconi/aws-msk-terraform/blob/master/terraform/modules/msk/main.tf
https://github.com/awslabs/aws-glue-schema-registry

https://github.com/swetavkamal/SchemaRegistryMSK/blob/master/src/main/java/person.avsc
-->

## Links

- [Main Website](https://aws.amazon.com/msk/)

## Guides

- [Username and password authentication with AWS Secrets Manager](https://docs.aws.amazon.com/msk/latest/developerguide/msk-password.html)
- [Step 6: Produce and Consume Data](https://docs.aws.amazon.com/msk/latest/developerguide/produce-consume.html)
- [Amazon MSK Metrics for Monitoring with CloudWatch](https://docs.aws.amazon.com/msk/latest/developerguide/metrics-details.html)

## Content

- [How Goldman Sachs builds cross-account connectivity to their Amazon MSK clusters with AWS PrivateLink](https://aws.amazon.com/blogs/big-data/how-goldman-sachs-builds-cross-account-connectivity-to-their-amazon-msk-clusters-with-aws-privatelink/)

## CLI

### Commands

```sh
aws kafka help
```

### Usage

```sh
#
aws \
  --output json \
  kafka list-clusters | \
    jq -r '.ClusterInfoList[0].ClusterArn'

#
aws kafka get-bootstrap-brokers \
  --region us-east-1 \
  --cluster-arn $(aws --output json kafka list-clusters | jq -r '.ClusterInfoList[0].ClusterArn')

dig +short '[broker-hostname]'

#
aws \
  --output json \
  kafka describe-cluster \
    --cluster-arn $(aws --output json kafka list-clusters | jq -r '.ClusterInfoList[0].ClusterArn') | \
      jq -r '.ClusterInfo.ZookeeperConnectString'
```

#### Cluster Creation

```sh
#
aws kafka create-cluster \
  --cli-input-json <(cat << EOF

EOF
)

#
aws kafka create-configuration \
  --name "WorkshopMSKConfig" \
  --description "Configuration used for MSK workshop - Auto topic creation; topic deletion; 8hrs retention" --kafka-versions "2.8.0" \
  --server-properties <(cat << EOF

EOF
)
```

### Tips

#### Prometheus Stack

```sh
#
cat << EOF | kubectl apply -f -
apiVersion: v1
kind: Endpoints
metadata:
  name: msk-lb-metrics
  labels:
    app.kubernetes.io/component: msk-lb-metrics
subsets:
- addresses:
  - ip: [nlb-ip]
  ports:
  - name: jmx-exporter
    port: 11001
    protocol: TCP
  - name: node-exporter
    port: 11002
    protocol: TCP
EOF

#
cat << EOF | kubectl apply -f -
apiVersion: v1
kind: Service
metadata:
  name: msk-lb-metrics
  labels:
    app.kubernetes.io/component: msk-lb-metrics
spec:
  type: ExternalName
  externalName: [nlb-ip]
EOF

#
kubectl get prometheus \
  -o jsonpath='{.items[*].spec.serviceMonitorSelector}' \
  -n monitoring

#
cat << EOF | kubectl apply -f -
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  name: msk-lb-metrics
  labels:
    release: prometheus-stack
spec:
  selector:
    matchLabels:
      app.kubernetes.io/component: msk-lb-metrics
  namespaceSelector:
    matchNames:
    - $(kubens -c)
  endpoints:
  - port: jmx-exporter
    interval: 15s
    path: /metrics
    targetPort: 11001
  - port: node-exporter
    interval: 15s
    path: /metrics
    targetPort: 11002
EOF
```

#### Grafana Dashboards

<!--
CloudWatch
https://grafana.com/grafana/dashboards/12009
https://grafana.com/grafana/dashboards/12010
-->

```sh
#
kubectl logs \
  $(kubectl get pods -o jsonpath='{.items[0].metadata.name}' -l app.kubernetes.io/name=grafana -n monitoring) \
  -n monitoring \
  -f \
  grafana-sc-dashboard

# MSK Overview (https://grafana.com/grafana/dashboards/12669)
cat << EOF | kubectl apply \
  -n monitoring \
  -f -
apiVersion: v1
kind: ConfigMap
metadata:
  name: msk-overview-dashboard
  labels:
    grafana_dashboard: "true"
data:
  msk-overview-dashboard.json.url: https://grafana.com/api/dashboards/12669/revisions/1/download
EOF
```

<!-- ### Issues

####

```log
%3|1626980066.465|FAIL|rdkafka#producer-1| [thrd:sasl_ssl://b-3.my-project-msk-clus.deord2.c3.kafka.us-east-1]: sasl_ssl://b-3.my-project-msk-clus.deord2.c3.kafka.us-east-1.amazonaws.com:9096/3: Connect to ipv4#0.0.0.0:9096 failed: Operation timed out (after 76531ms in state CONNECT)

%3|1626980065.359|FAIL|rdkafka#consumer-1| [thrd:sasl_ssl://b-3.my-project-msk-clus.deord2.c3.kafka.us-east-1]: sasl_ssl://b-3.my-project-msk-clus.deord2.c3.kafka.us-east-1.amazonaws.com:9096/3: Connect to ipv4#0.0.0.0:9096 failed: Operation timed out (after 76722ms in state CONNECT)
% ERROR: Local: Broker transport failure: sasl_ssl://b-3.my-project-msk-clus.deord2.c3.kafka.us-east-1.amazonaws.com:9096/3: Connect to ipv4#0.0.0.0:9096 failed: Operation timed out (after 76722ms in state CONNECT)
```

```sh
#
export AT_EVENTS_KAFKA_SASL_PASSWORD=''
export KAFKACAT_OPTS="-X security.protocol=SASL_SSL -X sasl.mechanisms=SCRAM-SHA-512 -X sasl.username=admin -X sasl.password=$AT_EVENTS_KAFKA_SASL_PASSWORD"

# List brokers
kafkacat \
  -b my-project-msk-lb-71fa4743565da371.elb.us-east-1.amazonaws.com:9096 \
  $(echo "$KAFKACAT_OPTS") \
  -L

# Produce
kafkacat \
  -b my-project-msk-lb-71fa4743565da371.elb.us-east-1.amazonaws.com:9096 \
  $(echo "$KAFKACAT_OPTS") \
  -P \
  -t eem_escola \
  -p 0

# Consume
kafkacat \
  -b my-project-msk-lb-71fa4743565da371.elb.us-east-1.amazonaws.com:9096 \
  $(echo "$KAFKACAT_OPTS") \
  -C \
  -t eem_escola \
  -o earliest
``` -->
