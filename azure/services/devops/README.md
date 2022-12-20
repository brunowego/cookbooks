# Azure DevOps (ADO) (formerly known as Visual Studio Team Services)

<!--
https://app.pluralsight.com/paths/skills/additional-devops-topics-on-microsoft-azure

https://linkedin.com/learning/react-js-building-an-interface-8551484/why-react-is-so-important
https://linkedin.com/learning/learning-azure-devops-10005641/use-azure-devops-to-enhance-application-development
https://linkedin.com/learning/visual-studio-tools-for-azure-devops/use-azure-devops-tools-from-the-visual-studio-ide
https://linkedin.com/learning/continuous-delivery-with-azure-devops/azure-devops-for-software-teams
https://linkedin.com/learning/azure-for-devops-application-infrastructure/the-need-for-agile-infrastructure
https://linkedin.com/learning/azure-devops-continuous-delivery-with-yaml-pipelines/devops-and-yaml-pipelines
https://linkedin.com/learning/azure-for-devops-implementing-development-processes/why-process-matters-in-devops
-->

**Keywords:** Git Service, Continuous Integration, ALM

## Links

- [Projects](https://dev.azure.com)
- [Main Website](https://azure.microsoft.com/en-us/products/devops/)
- [Docs](https://learn.microsoft.com/en-us/cli/azure/devops?view=azure-cli-latest)

## Docs

- [Use predefined variables / System.Debug](https://learn.microsoft.com/en-us/azure/devops/pipelines/build/variables?view=azure-devops&tabs=yaml#systemdebug)

<!--
system.debug: true
-->

## Glossary

- Personal Access Token (PAT)
- System Development Life Cycle (SDLC)

## Services

- [Azure Artifacts](./azure-artifacts.md)
- [Azure Boards](./azure-boards.md)
- [Azure Pipelines](./azure-pipelines/README.md)
- [Azure Repos](./azure-repos.md)

## CLI

### Installation

```sh
az extension add -n azure-devops
```

### Commands

```sh
az devops -h
```

### Configuration

```sh
#
az devops configure \
  --defaults \
    organization='https://dev.azure.com/<organization>'

#
az devops project list

#
az devops configure \
  --defaults \
    project='<project-name>'

#
az devops configure -l
```

### Usage

#### Service Endpoint

```sh
#
az devops service-endpoint list -p '<project-name>'

#
az devops service-endpoint show \
  --id '<service-endpoint-id>' \
  -p '<project-name>'
```

<!--
az devops service-endpoint create

az devops service-endpoint update

az devops service-endpoint delete
-->

#### Team

```sh
#
az devops team list

#
az devops team show \
  --team '<team-id>'

#
az devops team list-member \
  --team '<team-id>'
```

<!--
az devops team create

az devops team delete

az devops team update
-->

### Tips

#### SSH Key Config

```sh
#
cat << EOF >> ~/.ssh/config
Host ssh.dev.azure.com
    IdentitiesOnly yes
    IdentityFile ~/.ssh/id_rsa.<company-name>
EOF
```

#### Disable Repository

1. [Azure DevOps](https://dev.azure.com) -> Sidebar Menu -> Project settings
2. Repos -> Repositories
3. All Repositories -> Select Repository -> Settings Tab
4. Disable Repository -> Turn Off

#### Force Push

1. [Azure DevOps](https://dev.azure.com) -> Sidebar Menu -> Project settings
2. Repos -> Repositories
3. All Repositories -> Select Repository -> Security Tab -> User permissions
4. Add User -> Select `Allow` in `Force push (rewrite history, delete branches and tags)`

#### List Projects from Organization

```sh
#
az devops project list \
  -o tsv \
  --query 'value[].name'
```

#### Clone Repos from a Project

```sh
#
export ADO_PROJECT='<project>'

#
mkdir "$ADO_PROJECT"; cd "$_"

#
az repos list \
  -o json \
  --project "$ADO_PROJECT" | \
    jq -r '.[].remoteUrl' | \
      while read repo; do
        git clone "$repo"
      done
```

## Tips

### Service Connections

<!--
AWS
-->

1. Project settings
2. Pipelines -> Service connections
