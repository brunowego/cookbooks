# R Project

<!--
https://github.com/mlr-org/mlr
https://github.com/topepo/caret
https://github.com/sol-eng/tensorflow-w-r
https://app.pluralsight.com/library/courses/extracting-data-from-html-with-r/table-of-contents
https://app.pluralsight.com/library/courses/scraping-your-first-web-page-with-r/table-of-contents
https://app.pluralsight.com/library/courses/web-crawling-and-scraping-using-rcrawler/table-of-contents
https://app.pluralsight.com/library/courses/advanced-web-scraping-tactics-r-playbook/table-of-contents
https://app.pluralsight.com/library/courses/scraping-media-web-r/table-of-contents
https://www.youtube.com/watch?v=ZYdXI1GteDE
http://theautomatic.net/2018/08/24/getting-data-from-pdfs-the-easy-way-with-r/
https://linkedin.com/learning/r-for-data-science-lunchbreak-lessons/par-margins
-->

## Links

- [Main Website](https://www.r-project.org/)

## References

- [Awesome List](https://github.com/qinwf/awesome-R)
- [Machine Learning Pipelines for R](https://cran.r-project.org/web/packages/pipeliner/README.html)

## Docker

### Running

```sh
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h r-project \
  --name r-project \
  docker.io/rocker/r-ver:3.6.1 /bin/bash
```

## CLI

### Installation

#### Homebrew

```sh
brew install r
```

### APT

```sh
sudo apt update
sudo DEBIAN_FRONTEND=noninteractive apt -y install r-base
```

### YUM

```sh
yum check-update

# Repo: EPEL
sudo yum -y install R
```

## Commands

```sh
R -h
```

### Usage

```sh
#
Rscript [filename].R
```
