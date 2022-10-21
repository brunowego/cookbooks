# AWS Glue

<!--
https://medium.com/towards-data-engineering/solutions-to-aws-glue-errors-21be806eddd6
https://github.com/liangruibupt/glue-streaming-etl-demo/blob/master/IoT-Kafka-GlueStreaming-Demo.md
-->

## Links

- [Adding Jobs in AWS Glue](https://docs.aws.amazon.com/glue/latest/dg/add-job.html)

## CLI

### Commands

```sh
aws glue help
```

### Usage

```sh
#
aws glue list-schemas

#
aws glue create-database --database-input "{\"Name\":\"${DATABASE_NAME}\"}"

#
aws glue create-table \
  --database-name ${DATABASE_NAME} \
  --table-input file://${FILE_ATHENA_DOC}
```

### Issues

#### Ingress Ports

```log
JobName:[job-name] and JobRunId:[job-run-id] failed to execute with exception At least one security group must open all ingress ports.To limit traffic, the source security group in your inbound rule can be restricted to the same security group At least one security group must open all egress ports.To limit traffic, the source security group in your outbound rule can be restricted to the same security group At least one security group must open all ingress ports.To limit traffic, the source security group in your inbound rule can be restricted to the same security group At least one security group must open all egress ports.To limit traffic, the source security group in your outbound rule can be restricted to the same security group (Service: AWSGlueJobExecutor; Status Code: 400; Error Code: InvalidInputException; Request ID: 00000000-0000-0000-0000-000000000000)
```

```tf
resource "aws_security_group_rule" "egress_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.glue.id
}

resource "aws_security_group_rule" "ingress_all" {
   type              = "ingress"
   from_port         = 0
   to_port           = 0
   protocol          = "-1"
   cidr_blocks       = ["0.0.0.0/0"]
   security_group_id = aws_security_group.glue.id
}
```

<!-- ####

```log
The TCP/IP connection to the host [name].[hash].us-east-1.rds.amazonaws.com, port 1433 has failed. Error: "connect timed out. Verify the connection properties. Make sure that an instance of SQL Server is running on the host and accepting TCP/IP connections at the port. Make sure that TCP connections to the port are not blocked by a firewall.".
```

TODO -->
