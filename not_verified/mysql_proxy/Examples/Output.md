# Output

##

```sh
sudo -u mysql tee /usr/lib/mysql-proxy/lua/proxy/output.lua << EOF
function read_query(packet)
    if string.byte(packet) == proxy.COM_QUERY then
        print(string.sub(packet, 2))
    end
end
EOF
```
