# Slack MCP

## Links

- [Docs](https://docs.slack.dev/ai/slack-mcp-server/)

## Adding

```sh
# User Level
claude mcp add --transport http -s user slack https://mcp.slack.com/mcp

# List servers
claude mcp list
```

## Issues

### TBD

```log
SDK auth failed: Incompatible auth server: does not support dynamic client registration
```

TODO

<!--
export SLACK_MCP_TOKEN="xoxp-…"
claude mcp remove slack
claude mcp add --transport http slack https://mcp.slack.com/mcp --header "Authorization: Bearer ${SLACK_MCP_TOKEN}"
-->
