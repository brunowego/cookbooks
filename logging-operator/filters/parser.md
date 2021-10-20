# Parser

## Links

- [Parser](https://github.com/banzaicloud/logging-operator-docs/blob/master/docs/configuration/plugins/filters/parser.md)

## Parse Types

- apache2
- apache_error
- csv
- json
- logfmt
- ltsv
- multiline
- nginx
- none
- syslog
- tsv

<!--
#

- parser:
    remove_key_name_field: true
    reserve_data: true
    parse:
      type: multi_format
      patterns:
      - format: nginx
      - format: regexp
        expression: /^\[(?<logtime>[^\]]*)\] (?<name>[^ ]*) (?<title>[^ ]*) (?<id>\d*)$/
      - format: none


#

- parser:
    remove_key_name_field: true
    reserve_data: true
    inject_key_prefix: nginx.
    parse:
      type: multi_format
      patterns:
      - format: regexp
        time_key: time
        time_format: '%d/%b/%Y:%H:%M:%S %z'
        # NGINX ingress controller uses a different log format than standard NGINX server
        # Ref: https://kubernetes.github.io/ingress-nginx/user-guide/nginx-configuration/log-format/
        expression: '^(?<remote>[^ ]*) (?<real_ip>[^\]]*) (?<user>[^ ]+) \[(?<time>[^\]]*)\] "(?<method>\S+)(?: +(?<path>[^\"]*) +\S*)?" (?<status>\d+) (?<bytes_sent>\d+) "(?<referrer>[^ ]*)" "(?<user_agent>[^\"]*)" (?<request_length>\d+) (?<request_time>[\d.]+) \[(?<proxy_upstream_name>[^\]]*)\] \[(?<proxy_alternative_upstream_name>[^ ]*)\] (?<upstream_addr>[^ ]*) (?<upstream_response_length>\d+) (?<upstream_response_time>[\d.]+) (?<upstream_status>\d+) (?<request_id>[^ ]*)'
      - format: none


#

- parser:
    remove_key_name_field: true
    reserve_data: true
    parse:
      type: multi_format
      patterns:
      - format: nginx
      - format: regexp
        expression: "^\\[(?<timestamp>\\d{4}-\\d{2}-\\d{2}\\s\\d{2}:\\d{2}:\\d{2}),(?<pid>\\d{3}):\\s(?<severity>\\w*)\\/(?<worker>[a-zA-Z\\-0-9]*)\\]\\s(?<message>.*)$"
        time_key: timestamp
        time_format: "%Y-%m-%d %H:%M:%S"
        keep_time_key: false
      - format: none


#

- parser:
    remove_key_name_field: true
    reserve_data: true
    parse:
      type: regexp
      expression: /^(?<time>[^\s]+) \[(?<level>[^\]]+)\] (?<module>.+?):\d+ - log_id=(?<log_id>[^\s]+) host_name=(?<hostname>[^\s]+) > (?<message>.*)$/
      time_key: time
      time_type: string
      time_format: "%Y-%m-%dT%H:%M:%S.%N%z"
      # utc: true


# vault

- parser:
    remove_key_name_field: true
    reserve_data: true
    parse:
      type: multi_format
      patterns:
      - format: regexp
        expression: '/^(?<time>[^\]]*) \[(?<level>[^ ]*)\] (?<source>[^\":]*): (?<message>.*)$/'
        time_key: logtime
        time_format: '%Y-%m-%dT%H:%M:%S.%LZ'
      - format: regexp
        expression: '/^time="(?<time>[^\]]*)" level=(?<level>[^ ]*) msg="(?<message>[^\"]*)"/'
        time_key: time
        time_format: '%Y-%m-%dT%H:%M:%SZ'
      - format: regexp
        expression: '/^level=(?<level>[^ ]*) ts=(?<time>[^\]]*) caller=(?<source>.*) msg="(?<message>[^\"]*)"/'
        time_key: time
        time_format: '%Y-%m-%dT%H:%M:%S.%LZ'


# nextcloud

- parser:
    remove_key_name_field: true
    reserve_data: true
    parse:
      type: multi_format
      patterns:
      - format: regexp
        expression: '/^(?<time>[^\]]*) \[(?<level>[^ ]*)\] (?<source>[^\":]*): (?<message>.*)$/'
        time_key: logtime
        time_format: '%Y-%m-%dT%H:%M:%S.%LZ'
      - format: regexp
        expression: '/^time="(?<time>[^\]]*)" level=(?<level>[^ ]*) msg="(?<message>[^\"]*)"/'
        time_key: time
        time_format: '%Y-%m-%dT%H:%M:%SZ'
      - format: regexp
        expression: '/^level=(?<level>[^ ]*) ts=(?<time>[^\]]*) caller=(?<source>.*) msg="(?<message>[^\"]*)"/'
        time_key: time
        time_format: '%Y-%m-%dT%H:%M:%S.%LZ'
      - format: regexp
        expression: '^(?<host>[^ ]*) [^ ]* (?<user>[^ ]*) \[(?<time>[^\]]*)\] "(?<method>\S+)(?: +(?<path>[^ ]*) +\S*)?" (?<code>[^ ]*) (?<size>[^ ]*)(?: "(?<referer>[^\"]*)" "(?<agent>[^\"]*)")?$'
        time_key: time
        time_format: '%d/%b/%Y:%H:%M:%S %z'
-->
