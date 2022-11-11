# Azure Pipelines Self-hosted Agents

<!--
https://www.youtube.com/watch?v=CmamCFSrNzs
-->

## Glossary

- Personal Access Token (PAT)
- Team Foundation Version Control (TFVC)
- Visual Studio Team System (VSTS)

## Links

- [Code Repository](https://github.com/microsoft/azure-pipelines-agent)

## Docs

- [Azure Pipelines agents](https://learn.microsoft.com/en-us/azure/devops/pipelines/agents/agents?view=azure-devops&tabs=browser#install)

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

### Agent Pools

1. [Azure DevOps](https://dev.azure.com/)
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
"$AZURE_PIPELINE_AGENT_PATH"/config.sh \
  --url 'https://dev.azure.com/<organization>' \
  --auth 'PAT' \
  --token '<token>' \
  --unattended \
  --pool 'Default' \
  --agent 'Local-Linux-Agent' \
  --replace \
  --work '_work' \
  --acceptTeeEula
```
