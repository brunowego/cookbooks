# Claude Code

<!--
https://conductor.build

https://github.com/jhlee0409/claude-code-history-viewer
-->

## Links

- [Main Website](https://anthropic.com/claude-code)
- [Product](https://claude.com/product/claude-code)
- [Usage](https://claude.ai/settings/usage)

## Learn

- [Day One with Claude Code (Start Here)](https://youtube.com/watch?v=4igv72pQG5M)

## CLI

### Installation

```sh
# Using NPM
npm install @anthropic-ai/claude-code -g

# Using Homebrew
brew install --cask claude-code
```

### Initialize

```sh
claude /init # CLAUDE.md
```

<!-- ### Configuration -->

<!--
~/.claude/settings.json

{
  "cleanupPeriodDays": 30
}
-->

### Usage

```sh
#
cd ./path/to/your/project

# Enable all debug output
claude --verbose --debug

# For MCP-related issues
claude --verbose --mcp-debug

# Save debug output to file
claude --verbose --debug > debug.log 2>&1

# System health check
claude doctor

# Check current status
claude /status

# MCP server status
claude mcp list

# View session costs
claude /cost

```

<!--
/compact
/compact preserve the implementation plan for [feature]

/clear
Read the plan at ~/.claude/plans/<plan-name>.md and begin implementation

/model

ls ~/.claude/plans
-->

<!--
model Sonnet (1m)

Plan mode

Agent mode (understand better)
context7
-->

### Tips

### Viewing Logs

**Raw JSONL format:**

```sh
# View latest log file
tail -f ~/.claude/projects/*/$(ls -t ~/.claude/projects/*/ | head -1)
```

**Filter specific events:**

```sh
# Show only API requests
cat ~/.claude/projects/*/*.jsonl | jq 'select(.type == "api_request")'

# Show only errors
cat ~/.claude/projects/*/*.jsonl | jq 'select(.level == "error")'

# Show tool calls
cat ~/.claude/projects/*/*.jsonl | jq 'select(.type == "tool_call")'
```

#### Log Rotation and Cleanup

Logs can accumulate over time. To manage space:

```sh
# Check log directory size
du -sh ~/.claude/

# Remove logs older than 30 days
find ~/.claude/projects -name "*.jsonl" -mtime +30 -delete

# Keep only last 10 sessions per project (Manual cleanup - review before deleting)
ls -t ~/.claude/projects/*/session*.jsonl | tail -n +11 | xargs rm
```

<!-- #### TBD

```sh
#
~/.claude/projects
```
