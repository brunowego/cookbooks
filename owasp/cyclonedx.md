# OWASP CycloneDX

<!--
https://www.youtube.com/watch?v=bBF2QVdP6UE&t=45s
-->

**Keywords:** SBOM, SCA

## Links

- [Main Website](https://cyclonedx.org)

## Glossary

- Bill of Vulnerabilities (BOV)
- Hardware Bill of Materials (HBOM)
- Manufacturing Bill of Materials (MBOM)
- Operations Bill of Materials (OBOM)
- Software Bill of Materials (SBOM)
- Software-as-a-Service Bill of Materials (SaaSBOM)
- Vulnerability Disclosure Report (VDR)
- Vulnerability Exploitability eXchange (VEX)

## CLI

### Links

- [Code Repository](https://github.com/CycloneDX/cyclonedx-cli)

### Installation

#### Homebrew

```sh
brew tap cyclonedx/cyclonedx
brew install cyclonedx-cli
```

### Commands

```sh
cyclonedx -h
```

### Usage

```sh
#
cyclonedx keygen

#
cyclonedx add files \
  --no-input \
  --output-file ./sbom.json \
  --output-format json \
  --base-path ./ \
  --include ./**/* \
  --exclude ./.git/**

#
cyclonedx analyze \
  --input-file ./sbom.json

#
cyclonedx convert \
  --input-file ./sbom.xml \
  --output-file ./sbom.json

#
cyclonedx diff ./sbom.xml ./sbom.json
```

<!--
cyclonedx merge

cyclonedx sign

cyclonedx validate \
  --input-file ./sbom.json \
  --input-format json

cyclonedx verify file ./sbom.json
-->
