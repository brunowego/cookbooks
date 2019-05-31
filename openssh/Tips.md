# Tips

## Speed up SSH login

### Linux

```sh
cat << EOF | sudo tee -a /etc/ssh/sshd_config
UseDNS no
EOF
```

```sh
sudo systemctl restart ssh
```
