# GitHub Funding

## Links

- [Displaying a sponsor button in your repository](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/displaying-a-sponsor-button-in-your-repository)

## Configuration

1. Settings
2. Features -> Check "Sponsorships"

### Custom

```sh
cat << EOF > ./.github/FUNDING.yml
---
custom:
- https://buymeacoffee.com/brunowego
EOF
```
