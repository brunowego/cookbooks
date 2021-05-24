# Quarkus Structure

##

```sh
export PROJECT_GROUP_ID='org.acme.app'
export PROJECT_ARTIFACT_ID='user'
export PROJECT_PATH="./src/main/java/$(echo $PROJECT_GROUP_ID | sed -e 's|\.|/|g')/${PROJECT_ARTIFACT_ID}"
```

##

```sh
#
mkdir -p "${PROJECT_PATH}/domain/model/entities"
mkdir -p "${PROJECT_PATH}/domain/types"
mkdir -p "${PROJECT_PATH}/domain/dtos"
mkdir -p "${PROJECT_PATH}/domain/mappers"
mkdir -p "${PROJECT_PATH}/infrastructure/repositories/impl"
mkdir -p "${PROJECT_PATH}/infrastructure/services/impl"
mkdir -p "${PROJECT_PATH}/interfaces/rest"
```
