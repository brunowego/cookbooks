# wstunnel

## CLI

### Installation

#### NPM

```sh
npm install -g wstunnel
```

### Commands

```sh
wstunnel
```

### Usage

```sh
#
wstunnel -s 0.0.0.0:8080

#
wstunnel -t 33:2.2.2.2:33 ws://host:8080
```

<!-- ###

```
Host [hostname]
    ProxyCommand wstunnel -L stdio:%h:%p wss://[hostname]:[port]
    User [username]
    IdentitiesOnly yes
    IdentityFile ~/.ssh/id_rsa
``` -->
