# Playwright MCP

<!--
https://www.youtube.com/watch?v=IixdI2bTR1g
https://www.youtube.com/watch?v=FGwtDhjnBMc
-->

## Links

- [Code Repository](https://github.com/microsoft/playwright-mcp)

<!--
.mcp.json
-->

<!--
{
  "mcpServers": {
    "Playwright": {
      "command": "npx",
      "args": ["-y", "@playwright/mcp@latest"]
    }
  }
}
-->

## Claude MCP

### Installation

```sh
#
claude mcp add playwright -- npx -y @playwright/mcp@latest

#
claude mcp list
```

<!--
# On macOS
/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222

# On Windows
chrome.exe --remote-debugging-port=9222

# On Linux
google-chrome --remote-debugging-port=9222
-->

<!--
{
  "mcpServers": {
    "playwright": {
      "command": "npx",
      "args": [
        "@anthropic-ai/mcp-server-playwright",
        "--cdp-endpoint", "http://localhost:9222"
      ]
    }
  }
}
-->
