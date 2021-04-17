# Output

## ElasticSearch

```conf
output {
  elasticsearch {
    hosts => ['http://elasticsearch:9200']
    index => '[name]_%{+YYYY-MM-dd}'
    document_type => '[name]'
  }
}
```
