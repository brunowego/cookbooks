# Input

## File

```conf
input {
  file {
    path => [path/to/log]
    codec => json
    start_position => 'beginning'
  }
}
```

## Beats

```conf
input {
  beats {
    port => [port]
    type => '[name]'
  }
}
```

## TCP/UDP

```conf
input {
  tcp {
    port => [port]
    type => '[name]'
  }
}
```
