# Boto3

## Links

- [Code Repository](https://github.com/boto/boto3)
- [Main Website](https://aws.amazon.com/sdk-for-python/)

## Library

### Installation

#### pip

```sh
pip3 install -U boto3
```

### REPL

```sh
export AWS_ACCESS_KEY_ID='minio'
export AWS_SECRET_ACCESS_KEY='minio123'
export AWS_STORAGE_BUCKET_NAME='my-bucket'
export AWS_S3_REGION_NAME='us-east-1'
export AWS_S3_ENDPOINT_URL='http://127.0.0.1:9000'
```

#### List Buckets

```py
>>> import boto3
>>> import os
>>>
>>> s3 = boto3.resource('s3',
...     endpoint_url=os.environ.get('AWS_S3_ENDPOINT_URL'),
...     config=boto3.session.Config(signature_version='s3v4')
... )
>>>
>>> for bucket in s3.buckets.all():
        print(bucket.name)
>>>
>>> exit()
```

#### List Files

```py
>>> bucket = s3.Bucket(os.environ.get('AWS_STORAGE_BUCKET_NAME'))
>>>
>>> for file in bucket.objects.all():
...     print(file.key)
>>>
>>> exit()
```
