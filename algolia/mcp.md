# Algolia MCP

## Links

- [Docs](https://algolia.com/doc/guides/model-context-protocol/productivity-mcp#claude)

## Adding

```sh
# User Level
claude mcp add --transport http -s user algolia https://mcp.algolia.com/mcp

# List servers
claude mcp list
```

## Issues

### TBD

```log
❯ /mcp
  ⎿  Got new credentials, but algolia rejected them on reconnect. Try re-authenticating, or restart Claude Code if it persists.
```

TODO

<!--
 "algolia": {
       "command": "npx",
       "args": ["-y", "@algolia/mcp@latest"],
       "env": {
         "ALGOLIA_APP_ID": "${ALGOLIA_APP_ID}",
         "ALGOLIA_ADMIN_API_KEY": "${ALGOLIA_ADMIN_API_KEY}"
       }
     },
-->
