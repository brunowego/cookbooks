# Linux

## Installation

### RPM

```sh
curl -LO https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-6.4.2-x86_64.rpm
sudo rpm -vi filebeat-6.4.2-x86_64.rpm && rm -f filebeat-6.4.2-x86_64.rpm
```

### DPKG

```sh
curl -LO https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-6.4.2-amd64.deb
sudo dpkg -i filebeat-6.4.2-amd64.deb && rm -f filebeat-6.4.2-amd64.deb
```
