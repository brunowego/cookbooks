# SonarQube CE CNES Report Plugin

## Links

- [Code Repository](https://github.com/cnescatlab/sonar-cnes-report)

## Helm

### Dependencies

- [SonarQube Community Edition (CE)](/sonarsource/sonarqube/sonarqube-ce/README.md#helm)

### Install

```sh
#
export SONARQUBE_HELM_CHART_VERSION='5.0.6+370'

#
helm upgrade sonarqube sonarqube/sonarqube \
  -n sonarqube-system \
  --version "$SONARQUBE_HELM_CHART_VERSION" \
  -f <(yq eval-all 'select(fileIndex == 0) * select(fileIndex == 1)' <(helm get values sonarqube -o yaml -n sonarqube-system) <(cat << \EOF
plugins:
  install:
  - https://github.com/cnescatlab/sonar-cnes-report/releases/download/4.1.3/sonar-cnes-report-4.1.3.jar
EOF
))
```
