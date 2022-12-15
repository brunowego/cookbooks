# YouTube

<!--
https://www.youtube.com/channel_switcher
-->

## Links

- [Watch History](https://youtube.com/feed/history)
- [Comment History](https://youtube.com/feed/history/comment_history)

## Terms

- Clickbait
- Copyright Strike
- Shadowban

## Shortcuts

- `t`: Theater Mode

## Tips

### Force Specific Network Interface

```sh
# List
netstat -rn | grep -i default

# Route Info
route get www.youtube.com
ping rio01s25-in-f14.1e100.net
ping rio01s15-in-f14.1e100.net

# Add Route
sudo route add 172.217.162.174 172.20.10.1
sudo route add 216.58.222.78/32 172.20.10.1

#
netstat -rn | grep -i 172.217.162.174
netstat -rn | grep -i 216.58.222.78/32

# Check Route
route get www.youtube.com

# Delete
sudo route delete 172.217.162.174 172.20.10.1
sudo route delete 216.58.222.78/32 172.20.10.1
```

### Change Handle

1. [YouTube Studio](https://studio.youtube.com/)
2. Customization
3. Basic info tab
4. Handle field

## Issues

### Proxy

Bypass external proxies for the following hosts:

```txt
*.youtube.com
```
