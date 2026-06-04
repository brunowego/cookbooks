# Neon MCP

## Connect

```sh
# Remove user server
claude mcp remove neon
# Or remove from user scope
claude mcp remove -s user neon

# Add user server
claude mcp add --transport http neon https://mcp.neon.tech/mcp --header 'x-read-only: true'
# Or add to user scope
claude mcp add --transport http -s user neon https://mcp.neon.tech/mcp --header 'x-read-only: true'
# Or add to local scope
claude mcp add --transport http -s local neon https://mcp.neon.tech/mcp --header 'x-read-only: true'

# List servers
claude mcp list
```
