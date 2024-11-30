# Atlassian Jira

## Links

- [Main Website](https://atlassian.com/software/jira)
- [Dashboard](https://start.atlassian.com)

<!--
[ISSUE-KEY] <message>
ISSUE-KEY: <message>
-->

## CLI

### Installation

```sh
# Using Homebrew
brew tap ankitpokhrel/jira-cli
brew install jira-cli
```

### Commands

```sh
jira -h
```

### Configuration

<!--
https://id.atlassian.com/manage-profile/security/api-tokens
-->

```sh
#
export JIRA_API_TOKEN='<api-token>'

#
jira init

# ? Installation type: Cloud
# ? Link to Jira server: https://<org-name>.atlassian.net
# ? Login email: <org-email>

#
cat ~/.config/.jira/.config.yml
```

### Usage

```sh
#
jira issue list
jira issue list -w
jira issue list -a$(jira me)
jira issue list --created -7d
jira issue list -s"To Do"
jira issue list --order-by rank --reverse


#
jira epic list
jira epic <epic-key> --plain
```

<!--
jira completion -h
-->
