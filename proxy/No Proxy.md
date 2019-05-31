# No Proxy

## Environment

```sh
sudo tee /etc/profile.d/no-proxy.sh << 'EOF'
export no_proxy="localhost,127.0.0.1"
export NO_PROXY=$no_proxy
EOF
```

```sh
sudo su - $USER
```
