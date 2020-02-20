# reg

## CLI

### References

- [Using Self-Signed Certs with a Registry](https://github.com/genuinetools/reg#using-self-signed-certs-with-a-registry)

### Installation

#### Darwin

```sh
curl -L "https://github.com/genuinetools/reg/releases/download/$(curl -s https://api.github.com/repos/genuinetools/reg/releases/latest | grep tag_name | cut -d '"' -f 4)/reg-darwin-amd64" -o /usr/local/bin/reg && chmod +x /usr/local/bin/reg
```

#### Linux

```sh
sudo curl -L "https://github.com/genuinetools/reg/releases/download/$(curl -s https://api.github.com/repos/genuinetools/reg/releases/latest | grep tag_name | cut -d '"' -f 4)/reg-linux-amd64" -o /usr/local/bin/reg && sudo chmod +x /usr/local/bin/reg
```

### Commands

```sh
reg -h
reg server -h
```
