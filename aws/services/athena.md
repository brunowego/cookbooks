# AWS Athena

**Keywords:** Query Engine

**TL;DR;**

Athena is Presto + S3. Presto is a distributed SQL query engine for big data.

<!--
https://github.com/josep2/Jathena/
-->

## Alternatives

- Presto
- Apache Spark

## File Formats

- Apache Web Logs
- CSV
- JSON
- ORC
- Parquet
- Text File with Custom Delimiters
- TSV

## CLI

### Commands

```sh
aws athena help
```

### Usage

```sh
#
aws athena list-databases \
  --catalog-name 'AwsDataCatalog' | \
    jq -r '.DatabaseList[].Name'

#
aws athena list-table-metadata \
  --catalog-name 'AwsDataCatalog' \
  --database-name 'sampledb' \
  --query 'TableMetadataList[].Name' \
  --output text
```

<!--
aws athena get-data-catalog \
  --name "hms-catalog-1" \
  --region us-east-1

aws athena list-databases \
  --catalog-name 'AwsDataCatalog' \
  --query "DatabaseList[?Name == 'sampledb'].Name" \
  --output text

aws athena start-query-execution
  --query-string "select * from customer limit 100"
  --query-execution-context "Catalog=hms-catalog-1,Database=hms_tpch_partitioned"
  --result-configuration "OutputLocation=s3://mybucket/lambda/results"

aws athena list-work-groups \
  --query 'WorkGroups[?Name == "sampledb"].Name' \
  --output text
-->
