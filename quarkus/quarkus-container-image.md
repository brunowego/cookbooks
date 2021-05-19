# Quarkus Container Image

<!--
https://www.udemy.com/course/des-web-quarkus/learn/lecture/22836635#overview
-->

## References

- [S2I](https://github.com/openshift/source-to-image)
- [Jib](https://github.com/GoogleContainerTools/jib)

## S2I

```sh
mvn quarkus:add-extension \
  -Dextensions='container-image-s2i'
```


## Jib

```sh
mvn quarkus:add-extension \
  -Dextensions='container-image-jib'
```
