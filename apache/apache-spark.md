# Apache Spark

<!--
https://linkedin.com/learning/paths/advance-your-skills-as-an-apache-spark-specialist

https://medium.com/beeranddiapers/installing-apache-spark-on-mac-os-ce416007d79f

https://linkedin.com/learning/apache-spark-essential-training-big-data-engineering/welcome
https://linkedin.com/learning/apache-spark-essential-training/where-spark-shines

https://app.pluralsight.com/library/courses/apache-spark-2-structured-streaming/table-of-contents

http://shop.oreilly.com/product/0636920047568.do
https://www.jowanza.com/blog/time-series-missing-data-imputation-in-apache
https://www.jowanza.com/blog/a-gentle-intro-to-udafs-in-apache-spark
https://www.jowanza.com/blog/the-how-and-why-of-spark-and-couchbase
-->

## CLI

### Installation

#### Homebrew

```sh
brew install apache-spark
```

<!-- ### Environment

```sh
export SPARK_HOME=/usr/local/Cellar/apache-spark/2.0.1/libexec
export PYTHONPATH=/usr/local/Cellar/apache-spark/2.0.1/libexec/python/:$PYTHONP$
``` -->

### Commands

```sh
spark-beeline --help
spark-class -h
spark-shell -h
spark-sql --help
spark-submit -h
pyspark -h
sparkR -h
```

### Usage

```sh
#
spark-submit \
  --master local \
  [/path/to/script]

#
spark-shell \
  --master local[*]

#
pyspark \
  --executor-memory 16G \
  --conf spark.drive.memory=16G
```

### Tips

#### Visual Studio Code

```sh
code --install-extension mshdinsight.azure-hdinsight
```

```sh
jq '."hdinsight.disableOpenSurveyLink" |= true' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
```

```sh
# Darwin
osascript -e 'quit app "Visual Studio Code"'

code --disable-extension mshdinsight.azure-hdinsight
```

## Helm

### Install

```sh
kubectl create ns spark
```

```sh
helm install spark stable/spark \
  --namespace spark \
  --set Master.ServiceType=ClusterIP \
  --set Zeppelin.Ingress.Enabled=true \
  --set Zeppelin.ServiceType=ClusterIP \
  --set Zeppelin.Ingress.Hosts={zeppelin.${DOMAIN}} \
  --set Zeppelin.Persistence.Config.Enabled=true \
  --set Zeppelin.Persistence.Config.StorageClass=$(kubectl get storageclass -o jsonpath='{.items[0].metadata.name}') \
  --set Zeppelin.Persistence.Notebook.Enabled=true \
  --set Zeppelin.Persistence.Notebook.StorageClass=$(kubectl get storageclass -o jsonpath='{.items[0].metadata.name}')
```

### Delete

```sh
helm uninstall spark -n spark
kubectl delete ns spark --grace-period=0 --force
```

## Docker

TODO

<!--
https://hadoopandspark.wordpress.com/2018/04/11/pyspark-an-error-occurred-while-calling-none-org-apache-spark-api-java-javasparkcontext/
-->

<!--
https://kontext.tech/column/spark/287/debug-pyspark-code-in-visual-studio-code
-->
