# Repositories

## Links

- [Docs](https://docs.sonarqube.org/9.6/devops-platform-integration/github-integration/)

## From GitHub

### Create App

1. Organization > Settings > Developer settings > GitHub Apps > New GitHub App

   | Parameter       | Value                       |
   | --------------- | --------------------------- |
   | GitHub App name | `Quality Gate (SonarQube)`  |
   | Homepage URL    | `https://sonarqube.org`     |
   | Callback URL    | `https://sonarqube.xyz.tld` |
   | Webhook URL     | `https://sonarqube.xyz.tld` |

2. Create GitHub App
3. Sidebar > Permissions & events
   - Repository permissions
     - Checks > Read and write
     - Commit statuses > Read-only
     - Contents > Read-only
     - Pull requests > Read and write

### Parameters

| Parameter          | Value                    |
| ------------------ | ------------------------ |
| Configuration name | `GitHub`                 |
| GitHub API URL     | `https://api.github.com` |
| GitHub App ID      | `000000`                 |
| Client ID          | `Iv1.xxxxxxxxxxxxxxxx`   |
| Client Secret      |                          |
| Private Key        |                          |
