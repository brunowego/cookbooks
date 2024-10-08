# Azure Pipelines Agent

<!--
https://www.youtube.com/watch?v=CmamCFSrNzs
-->

**Keywords:** Self-Hosted

## Glossary

- Personal Access Token (PAT)
- Team Foundation Version Control (TFVC)
- Visual Studio Team System (VSTS)

## Links

- [Code Repository](https://github.com/microsoft/azure-pipelines-agent)

## Docs

- [Azure Pipelines agents](https://learn.microsoft.com/en-us/azure/devops/pipelines/agents/agents?view=azure-devops&tabs=browser#install)
- [Microsoft-hosted agents](https://learn.microsoft.com/en-us/azure/devops/pipelines/agents/hosted?view=azure-devops&tabs=yaml)

## Runners

| Virtual Environment                         | YAML Workflow Label                | Default Shell |
| ------------------------------------------- | ---------------------------------- | ------------- |
| macOS X Catalina 10.15                      | `macOS-10.15`                      | Bash          |
| macOS 11 Big Sur                            | `macOS-11`                         | Bash          |
| macOS 12 Monterey                           | `macOS-12`                         | Bash          |
| Ubuntu 18.04                                | `ubuntu-22.04`                     | Bash          |
| Ubuntu 20.04                                | `ubuntu-20.04`                     | Bash          |
| Ubuntu 22.04                                | `ubuntu-22.04`                     | Bash          |
| Windows Server 2019 with Visual Studio 2019 | `windows-2019`                     | PowerShell    |
| Windows Server 2022 with Visual Studio 2022 | `windows-latest` or `windows-2022` | PowerShell    |

<!-- ## Docker

https://hub.docker.com/_/microsoft-azure-pipelines-vsts-agent -->

## CLI

### Installation

#### Darwin

```sh
#
export AZURE_PIPELINE_AGENT_PATH="$HOME/.azure/pipeline/agent"

#
mkdir -p "$AZURE_PIPELINE_AGENT_PATH"

#
curl \
  -L \
  'https://vstsagentpackage.azureedge.net/agent/2.211.1/vsts-agent-osx-x64-2.211.1.tar.gz' | \
    tar -xzC "$HOME"/.azure/pipeline/agent
```

##### Chocolatey

```sh
choco install -y azure-pipelines-agent --params "'/Directory:c:\agent'"
```

### New Pool

1. Project Settings
2. Agent pools -> Add pool
3. Add agent pool
   - Pool to link: New
   - Pool type: Self-hosted
   - Name: Self-hosted
   - Create
4. Self-hosted -> New agent

### Agent Pools

1. [Azure DevOps](https://dev.azure.com)
2. Organization Settings
3. Side-menu -> Pipelines -> Agent pools -> Default
4. New agent

### Configuration

#### Darwin

1. System Preferences -> Security & Privacy
2. Developer Tools -> Check `Terminal.app` and `iTerm.app` (if exists)

```sh
#
spctl developer-mode enable-terminal

#
"$AZURE_PIPELINE_AGENT_PATH"/config.sh --help
"$AZURE_PIPELINE_AGENT_PATH"/run.sh --help

#
export AZURE_ORG_NAME='<organization>'
export AZURE_PAT='<token>'

#
"$AZURE_PIPELINE_AGENT_PATH"/config.sh \
  --url "https://dev.azure.com/${AZURE_ORG_NAME}" \
  --auth 'pat' \
  --token "$AZURE_PAT" \
  --pool 'Self-hosted' \
  --agent 'Local-Darwin-Agent' \
  --replace \
  --work '_work' \
  --acceptTeeEula

#
"$AZURE_PIPELINE_AGENT_PATH"/run.sh --once
```

<!--
"$AZURE_PIPELINE_AGENT_PATH"/config.sh remove
-->
