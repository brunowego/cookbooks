# Slack MCP

## Links

- [Docs](https://docs.slack.dev/ai/slack-mcp-server)

## Adding

Slack's hosted MCP server (`https://mcp.slack.com/mcp`) does **not** support Dynamic Client Registration, so Claude Code's automatic OAuth fails with:

```text
SDK auth failed: Incompatible auth server: does not support dynamic client registration
```

The fix: create your own Slack app, mint a user token (`xoxp-...`) via a manual OAuth exchange, and pass it to Claude Code as a static bearer header.

> The token acts **as you** in the workspace. Fine for personal/dev use; use OAuth 2.0 + PKCE for shared/production.

### 1. Create a Slack app

1. Go to [Slack API](https://api.slack.com/apps) → **Create New App** → **From scratch**.
2. Name it (e.g. `Claude Code MCP`), pick your workspace → **Create**.

### 2. OAuth & Permissions

- Add redirect URL `http://localhost:8080/callback` → **Save**. Skip the token-rotation/PKCE "Opt In" buttons.
- Add the 13 **User Token Scopes**: `chat:write, channels:read, channels:history, groups:read, groups:history, im:read, im:history, mpim:read, mpim:history, users:read, users:read.email, search:read.public, search:read.private`.

### 3. Enable the MCP server

- **Agents** → turn on **Slack Model Context Protocol (MCP) Server**.

### 4. Get credentials

- **Basic Information → App Credentials**: copy **Client ID** (`1234.5678` shape — a 32-char hex string is the *Secret*, which is what caused your `invalid_client_id`) and **Client Secret**.

### 5. Authorize

- Open `https://slack.com/oauth/v2/authorize?client_id=<CLIENT_ID>&user_scope=...&redirect_uri=http://localhost:8080/callback` → **Allow** → copy `code=...` from the address bar (the 404 page is expected).

### 6. Exchange code → token

```sh
curl -s -X POST https://slack.com/api/oauth.v2.access \
  -d "client_id=<CLIENT_ID>" -d "client_secret=<CLIENT_SECRET>" \
  -d "code=<CODE>" -d "redirect_uri=http://localhost:8080/callback"
```

Grab `authed_user.access_token` (`xoxp-...`). `invalid_code` → redo step 5; `invalid_client_id` → you used the Secret as the ID.

### 7. Register with Claude Code

```sh
export SLACK_MCP_TOKEN="xoxp-..."

claude mcp remove slack
claude mcp add --transport http slack https://mcp.slack.com/mcp --header "Authorization: Bearer ${SLACK_MCP_TOKEN}"
```

Persist in `~/.zshrc`, restart terminal, verify with `/mcp`.
