# Branching Workflow

**Keywords:** Git Workflow

## Strategies

- [Git-flow](/git-flow.md)
- [GitHub Flow](/github/flow.md)
- [GitLab Flow](/gitlab/flow.md)
- [One Flow](/one-flow.md)
- [Trunk-Based Development (TBD)](/trunk-based-development.md)

<!--
Centralized workflow
Feature branch workflow
Forking workflow

Scaled Trunk Based Development
-->

## Articles

- [4 branching workflows for Git](https://medium.com/@patrickporto/4-branching-workflows-for-git-30d0aaee7bf)
- [Git Branching - Branching Workflows](https://git-scm.com/book/en/v2/Git-Branching-Branching-Workflows)
- [What Are the Best Git Branching Strategies](https://flagship.io/git-branching-strategies)

## Configuration

```sh
# Git-flow
git config --global init.defaultBranch 'develop'

# GitHub Flow
git config --global init.defaultBranch 'main'

# Trunk-Based Development (TBD)
git config --global init.defaultBranch 'trunk' # or, main
```
