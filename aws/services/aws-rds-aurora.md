# AWS RDS Aurora

**Keywords:** Relational DB

<!--
https://www.stefanproell.at/posts/2020-08-18-ubuntu20-04-01-mysql5.6/

https://app.pluralsight.com/library/courses/amazon-aurora-best-practices/table-of-contents
https://app.pluralsight.com/library/courses/administering-amazon-aurora-amazon-rds/table-of-contents
https://app.pluralsight.com/library/courses/querying-data-aws-databases/table-of-contents

https://www.linkedin.com/learning/amazon-web-services-data-services-2/scalable-data-solutions-on-aws
https://www.linkedin.com/learning/aws-certified-database-specialty-dbs-c01-1-introduction-and-services/aws-database-specialty-recommended-knowledge
https://www.linkedin.com/learning/aws-certified-solutions-architect-associate-saa-c02-8-databases/database-types
-->

## Alternatives

- MySQL
- PostgreSQL

## Links

- [Main Website](https://aws.amazon.com/rds/aurora/)

## Guides

- [Aurora DB instance classes](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Concepts.DBInstanceClass.html)
- [Aurora MySQL version numbers and special versions](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraMySQL.Updates.Versions.html)
- [Database engine updates for Amazon Aurora MySQL 2.0](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraMySQL.Updates.20Updates.html)
- [Supported features in Amazon Aurora by AWS Region and Aurora DB engine](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Concepts.AuroraFeaturesRegionsDBEngines.grids.html)
- [Working with DB parameter groups and DB cluster parameter groups](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_WorkingWithParamGroups.html)

## Glossary

- Availability Zone (AZ)
- Online Transaction Processing (OLTP)

## Alternatives on AWS

- Redshift
- DynamoDB

## Key Concepts

- Aurora is fully managed by Amazon RDS.
- Aurora is build for high performance and scalability.
- Aurora provides multiple levels of security.
- Optimized for OLTP.
- MySQL-compatible database system.
- Initially 10 GB, scaling in 10 GB increments (Max 64 TB).
- Compute resources max 32 CPUs and max 244 GiB RAM.
- Availability defaults:
  - 2 DB copies in each AZ
  - Minimum of 3 AZs
- Write capability: Continues with up to two copies lost.
- Read capability: Continues with up to three copies lost.
- Up to 15 Aurora replicas: Automatic failover
- Up to 5 MySQL read replicas: No automatic failover

<!-- ##

- Instance hosting the database
- On-demand Instance
- Reserved Instance
- Serverless
- Storage and I/O consumed -->
