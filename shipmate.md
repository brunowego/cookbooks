# Shipmate

## Links

- [Code Repository](https://github.com/dreamiurg/shipmate)

## Installation

```sh
/plugin marketplace add dreamiurg/shipmate
/plugin install shipmate@shipmate-marketplace

/reload-plugins
```

## Configuration

```sh
~/.claude/shipmate.yaml
# or
<project>/.claude/shipmate.yaml
```

```yml
---
# Set default GitHub scope
github_scope: 'all' # or "personal" or "my-org-name"

# Claude Code Session Integration
claude_sessions:
  enabled: true # Enable Claude Code session integration
  time_window_hours: 24 # How far back to look for sessions
  correlation_window_hours: 2 # Time proximity for matching sessions to commits
  min_duration_minutes: 2 # Ignore sessions shorter than this

# Enable integrations
# integrations:
#   notion:
#     enabled: true
#     daily_log_url: "https://www.notion.so/your-workspace/Daily-Log-abc123"
```

## Commands

```text
What skills are available?
```

## Usage

```text
Generate my end-of-day summary
# or
Use the shipmate:eod skill
```

## Uninstall

```sh
claude plugin disable shipmate@shipmate-marketplace --scope local
claude plugin uninstall shipmate@shipmate-marketplace --scope local
```
