# GitHub App Auto Assign

## Links

- [Code Repository](https://github.com/kentaro-m/auto-assign/)
- [Main Page](https://github.com/apps/auto-assign)

## Installation

1. Click Button Install
2. Select Organization
3. All Repositories
   - Install

## Configuration

```sh
cat << EOF > ./.github/auto_assign.yml
---
# yamllint disable-line rule:quoted-strings
addAssignees: "author"

addReviewers: true

reviewers:
  - <org>/<team>
  - <username>

numberOfReviewers: 1

skipKeywords:
  - wip
EOF
```
