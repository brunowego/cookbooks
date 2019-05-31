# Configuration

- [Grok Debugger](http://grokdebug.herokuapp.com/)

```sh
logstash -e
```

```sh
logstash \
 --path.config /usr/share/logstash/pipeline/logstash.conf \
 --config.reload.automatic \
 --path.data /usr/share/logstash/data
```

## Structure

```conf
input {

}

filter {

}

output {

}
```
