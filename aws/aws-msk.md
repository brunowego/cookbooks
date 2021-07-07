# AWS Managed Streaming for Apache Kafka (MSK)

<!--
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

## Content

- [How Goldman Sachs builds cross-account connectivity to their Amazon MSK clusters with AWS PrivateLink](https://aws.amazon.com/blogs/big-data/how-goldman-sachs-builds-cross-account-connectivity-to-their-amazon-msk-clusters-with-aws-privatelink/)

## CLI

### Commands

```sh
aws kafka help
```

<!-- ### Usage

```sh
#
aws kafka list-clusters | \
  jq -r '.ClusterInfoList[0].ClusterArn'

#
aws kafka describe-cluster --cluster-arn $(cat clusterArn) | \
  jq -r '.ClusterInfo.ZookeeperConnectString'

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
``` -->
