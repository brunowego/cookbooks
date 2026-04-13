# Vercel MCP

## Connect

```sh
# Remove user server
claude mcp remove vercel
# Or remove from user scope
claude mcp remove -s user vercel

# Add user server
claude mcp add --transport http vercel https://mcp.vercel.com/<owner>/<app-name>
# Or add to user scope
claude mcp add --transport http -s user vercel https://mcp.vercel.com/<owner>/<app-name>

# List servers
claude mcp list
```
