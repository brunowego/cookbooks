# Configuration

##

```sh
cat << EOF >> ~/.python-gitlab.cfg
[global]
default = gitlab.com
ssl_verify = true
timeout = 5

[gitlab.com]
url = https://gitlab.com
private_token = [token]
api_version = 4

EOF
```
