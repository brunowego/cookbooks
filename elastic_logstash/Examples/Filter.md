# Filter

##

```conf
filter {
  if [type] == '[name]' {
    grok {
      patterns_dir => '/usr/share/logstash/patterns.d'
      match => { 'message' => '%{[PATTERN]}' }
    }

    date {
      match => [ 'timestamp', 'ISO8601' ]
      timezone => 'Europe/Madrid'
      target => 'realdate'
    }

    mutate {
      convert => [ 'bytes', 'integer' ]
      convert => [ 'elapsed-time', 'float' ]
    }
  }
}
```
