# AWS Managed Streaming for Apache Kafka (MSK)

<!--
https://learn-msk.com/courses/amazon-msk-master-class
https://www.whizlabs.com/amazon-managed-streaming-for-apache-kafka/
https://github.com/cloudposse/terraform-aws-msk-apache-kafka-cluster
https://github.com/lokiloveu1/AWS-MSK/blob/main/Steps-To-Build-MSK-Client-In-Another-VPC
https://github.com/aws-samples/aws-msk-content-streaming
https://github.com/Financial-Times/upp-provisioners/blob/6e59d051488c4609afbb8d9d8d06df1f9604b374/upp-msk-provisioner/scripts/getConfig.sh
https://github.com/liangruibupt/aws-is-how/blob/3121a70cfa634237ef0eaf76303d4b60d13edbfa/analytics/msk/kafka-s3-event-processor.py
-->

## Links

- [Main Website](https://aws.amazon.com/msk/)

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
