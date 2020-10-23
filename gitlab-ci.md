# GitLab CI

##

.gitlab-ci.yml

```yml
stages:
  - build
  - push
  - deploy

build_job:
  stage: build
  variables:
    GIT_SUBMODULE_STRATEGY: recursive
  script:
    - docker-compose -f ./docker-compose.yml build
  only:
    - develop

push_job:
  stage: push
  before_script:
    - echo ${CI_JOB_TOKEN} | docker login -u gitlab-ci-token --password-stdin ${CI_REGISTRY}
  script:
    - docker-compose -f ./docker-compose.yml push
  only:
    - develop
  dependencies:
    - build_job

deploy_job:
  stage: deploy
  script:
    - docker stack deploy -c ./docker-compose.yml evalai
  only:
    - develop
  dependencies:
    - build_job
    - push_job
```
