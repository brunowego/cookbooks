# Replace

##

```sh
sudo -u mysql tee /usr/lib/mysql-proxy/lua/proxy/replace.lua << EOF
local patterns = {}

patterns['^select bid'] = "SELECT NOW()"
patterns['^select uid'] = "SELECT NOW()"

function read_query(packet)
    if string.byte(packet) == proxy.COM_QUERY then
        local query = packet:sub(2):lower()

        for k, v in pairs(patterns) do
            local res = query:match(k)

            if res then
                print('rewriting ' .. query)
                proxy.queries:append(1, string.char(proxy.COM_QUERY) .. v)
                return proxy.PROXY_SEND_QUERY
            end
        end
    end
end
EOF
```
