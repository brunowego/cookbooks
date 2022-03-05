# Renovate

## Alternative

- [Dependabot](/github/dependabot.md)

## Links

- [Code Repository](https://github.com/renovatebot/renovate)
- [Main Website](https://renovatebot.com)
- [Docs](https://docs.renovatebot.com/)

## Configuration

**Refer:** `./renovate.json`

```json
{
  "extends": ["config:base"],
  "automerge": true,
  "dependencyDashboard": true,
  "stabilityDays": 7,
  "automergeType": "branch",
  "packageRules": [
    {
      "packagePatterns": ["eslint"],
      "groupName": "eslint",
      "extends": ["schedule:monthly"]
    }
  ]
}
```
