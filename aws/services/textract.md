# AWS Textract

## Links

- [Main Website](https://aws.amazon.com/textract)

<!--
@aws-sdk/client-textract

https://medium.com/@vitaliyye/use-aws-textract-to-get-text-from-images-in-node-js-520b1a30f764
-->

## CLI

### Commands

```sh
aws textract help
```

### Usage

```sh
#
export BUCKET_NAME='<bucket-name>'
export DOCUMENT_NAME='<document-name>'

#
cat > ./document.json << EOF
{
  "S3Object": {
    "Bucket": "$BUCKET_NAME",
    "Name": "$DOCUMENT_NAME"
  }
}
EOF

#
cat > ./features.json << EOF
["TABLES","FORMS","SIGNATURES"]
EOF

#
aws textract analyze-document \
  --document file://document.json \
  --feature-types file://features.json \
    > ./textract-analysis-results.json
```

<!--
grep -o '"Pages": [0-9]*' textract-analysis-results.json | awk '{print $2}'
-->

<!--
echo "Total blocks detected: $(grep -o '"BlockType":' textract-analysis-results.json | wc -l)"
echo "Pages: $(grep -o '"BlockType": "PAGE"' textract-analysis-results.json | wc -l)"
echo "Lines of text: $(grep -o '"BlockType": "LINE"' textract-analysis-results.json | wc -l)"
echo "Words: $(grep -o '"BlockType": "WORD"' textract-analysis-results.json | wc -l)"
echo "Tables: $(grep -o '"BlockType": "TABLE"' textract-analysis-results.json | wc -l)"
echo "Table cells: $(grep -o '"BlockType": "CELL"' textract-analysis-results.json | wc -l)"
echo "Key-value pairs: $(grep -o '"BlockType": "KEY_VALUE_SET"' textract-analysis-results.json | wc -l)"
echo "Signatures: $(grep -o '"BlockType": "SIGNATURE"' textract-analysis-results.json | wc -l)"
-->

<!-- ```sh
#
aws textract analyze-document \
  --document '{"S3Object":{"Bucket":"bucketname","Name":"filename"}}' \
  --region us-west-1  \
  --feature-types '["TABLES","FORMS","SIGNATURES"]'

#
aws textract start-document-analysis \
  --document '{"S3Object":{"Bucket":"bucketname","Name":"filename"}}' \
  --feature-types '["TABLES","FORMS","SIGNATURES"]' \
  --region us-west-1

#
aws textract get-document-analysis \
  --job-id somerandomstring \
  --region us-west-1
``` -->
