# Atlassian Jira

<!--
https://github.com/unlogg/unlogg
-->

<!--
To Do
In Progress
In Review
Staging
Ready for Production
Done
-->

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

## Tips

### Create a Field

1. Projects -> Select a Project -> More (3 dots) -> Project settings
2. Sidebar -> Expand Work types -> Select Epic
3. Create a field (Right sidebar) -> Paragraph -> Staging Screenshot -> Add to Description fields
4. Add to all Work types -> Save changes

### Manage Workflow

1. Projects -> Select a Project -> Manage workflow
2. Select a Column -> Add Rule
