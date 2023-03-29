# Apache JMeter

<!--
https://github.com/Rbillon59/jmeter-docker-compose-starterkit

https://github.com/SantimosoTFM/tfm-loadtesting/tree/master/jmeter

https://www.blazemeter.com/jmeter-load-testing/

https://linkedin.com/learning/jmeter-performance-and-load-testing/testing-with-jmeter
https://linkedin.com/learning/advanced-jmeter/getting-more-out-of-jmeter
https://github.com/marketplace/actions/apache-jmeter
https://grafana.com/grafana/dashboards/1152

https://github.com/nambuntu/reactive-programming-performance/tree/master
-->

## Links

- [Main Website](https://jmeter.apache.org/)

## Guides

- [Dashboard generator](https://jmeter.apache.org/devguide-dashboard.html)
- [Generating Report Dashboard](https://jmeter.apache.org/usermanual/generating-dashboard.html)

## Terms

- Ramp-up Period

## CLI

### Installation

#### Homebrew

```sh
brew install jmeter
```

### Usage

```sh
#
jmeter \
  -n \
  -t './app_performance_test.jmx' \
  -l './my_results.jtl'

#
jmeter \
  -q user.properties \
  -n \
  -t stress_test.jmx \
  -l ./result/vertx/result.csv \
  -e \
  -o ./result/vertx
```

### Tips

#### Plugins Directory

```sh
# Homebrew
open $(brew --prefix jmeter)/libexec/lib/ext/
```

### Uninstall

#### Homebrew

```sh
brew uninstall jmeter
```
