# Trivy

**Keywords:** Vulnerability Scanner, SBOM

A Simple and Comprehensive Vulnerability Scanner for Containers and other Artifacts, Suitable for CI.

## Links

- [Code Repository](https://github.com/aquasecurity/trivy)
- [Main Website](https://trivy.dev/)

## Glossary

- Software Bill of Materials (SBOM)

## CLI

### Installation

#### Homebrew

```sh
brew tap aquasecurity/trivy
brew install trivy
```

### Commands

```sh
trivy -h
```

### Usage

```sh
#
trivy image docker.io/library/centos:7

#
trivy image \
  --exit-code 1 \
  docker.io/library/centos:7

#
trivy image \
  --exit-code 1 \
  --severity 'CRITICAL' \
  docker.io/library/centos:7
```

### Tips

#### Ignore Policy

```sh
#
trivy image \
  --ignore-policy <(cat << EOP
package trivy

import data.lib.trivy

default ignore = false

ignore_pkgs := {"bash", "bind-license", "rpm", "vim", "vim-minimal"}

ignore_severities := {"LOW", "MEDIUM", "HIGH"}

ignore {
	input.PkgName == ignore_pkgs[_]
}

ignore {
	input.Severity == ignore_severities[_]
}
EOP
) \
  --exit-code 1 \
  docker.io/library/centos:7
```
