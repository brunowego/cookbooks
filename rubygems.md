# RubyGems

## CLI

### Tips

#### No Document

```sh
echo 'gem: --no-document' > ~/.gemrc

# Remove existing docs
rm -fR $(gem env gemdir)/doc/*
```

#### Proxy

```sh
# HTTP(S)
cat << EOF >> ~/.gemrc
http_proxy: http://$PROXY_HOST:$PROXY_PORT
https_proxy: http://$PROXY_HOST:$PROXY_PORT
EOF

# With Authentication
cat << EOF >> ~/.gemrc
http_proxy_user: $PROXY_USERNAME
http_proxy_pass: $PROXY_PASSWORD
https_proxy_user: $PROXY_USERNAME
https_proxy_pass: $PROXY_PASSWORD
EOF

# Check
gem env | grep -i _proxy | sort
```

### Issues

#### File permission error

```log
You don't have write permissions for the /Library/Ruby/Gems/2.6.0 directory.
```

```sh
# Homebrew
sudo chown -R `whoami` /Library/Ruby/Gems
```
