# Tilt

<!--
https://github.com/eniblock/vault
https://github.com/eniblock/keycloak
https://github.com/companieshouse/psc-filing-api/tree/main

https://github.com/tadoku/tadoku
https://github.com/whslabs/tilt-jenkins
https://github.com/hivenetes/bots
https://github.com/francis-jjk/microservices-demo
-->

## Links

- [Code Repository](https://github.com/tilt-dev/tilt)
- [Main Website](https://tilt.dev/)

## Included

- [k3d](/k3d.md)

## CLI

#### Dependencies

- [Docker CE](/docker/ce/README.md)

### Installation

#### Homebrew

```sh
brew install tilt
```

### Commands

```sh
tilt -h
```

### Bootstrap

```sh
#
tilt doctor

#
tilt analytics opt out
```

<!-- ### Configuration -->

<!--
cat ~/.tilt-dev/config
-->

<!-- ```sh
#
cat << EOF > ./tilt_config
{
  "allowed_contexts": [
    "minikube"
  ],
  "default_registry": "",
  "environment": "local",
  "microservices": [
    "bots"
  ],
  "namespace": "bots",
  "port_forwards": [
    "bots:8080"
  ]
}
EOF

#
cat << EOF > ./Tiltfile
#! /usr/bin/env python

# Import required functions from Tilt extensions
load(
    "ext://namespace",
    "namespace_create",
    "namespace_inject"
)

# Import settings from tilt_config.json
if not os.path.exists("./tilt_config.json"):
    fail(
        """
        # ================================================ #
        # Tilt config file not found in current directory! #
        # Please copy a template from tilt-resources dir.  #
        #                                                  #
        # E.g.:                                            #
        #    cp tilt-resources/local/tilt_config.json .    #
        # ================================================ #
        """
    )

config.define_string_list("allowed_contexts")
config.define_string("default_registry")
config.define_string("environment")
config.define_string_list("microservices")
config.define_string("namespace")
config.define_string_list("port_forwards")
cfg = config.parse()

# Compatibilty setting for ARM arch
os.putenv("DOCKER_DEFAULT_PLATFORM", "linux/amd64")

# Allow default K8S context as stated in the tilt_config.json file
allow_k8s_contexts(cfg.get("allowed_contexts"))

# Set default registry as stated in the tilt_config.json file
if cfg.get("default_registry") != "":
    default_registry(cfg.get("default_registry"))

# Build each microservice image as stated in the tilt_config.json file
for microservice in cfg.get("microservices"):
    if "redis" in microservice:
        continue
    docker_build(
        microservice,
        # cartservice is an exception regarding source folder path
        "src/{}/src".format(microservice) if "cartservice" in microservice else "src/{}".format(microservice)
    )

# Create namespace as stated in the tilt_config.json file
namespace_create(cfg.get("namespace"))

# Deploy each microservice as stated in the tilt_config.json file
for microservice in cfg.get("microservices"):
    k8s_yaml(
        namespace_inject(
            read_file("kustomize/base/{}.yaml".format(microservice)),
            cfg.get("namespace")
        )
    )

# Port forwards as stated in the tilt_config.json file
for port_forward in cfg.get("port_forwards"):
    mapping = port_forward.split(":")
    if (len(mapping) != 2):
        fail(
            """
            # =================================================== #
            # Invalid port forward specified in tilt_config.json! #
            # Should be <resource>:<port_number>.                 #
            #                                                     #
            # E.g.: frontend:9090                                 #
            # =================================================== #
            """
        )
    service = mapping[0]
    port = mapping[1]
    k8s_resource(service, port_forwards=port)
EOF
``` -->

### Usage

```sh
#
tilt up

#
tilt down
```

<!--
tilt ci
tilt api-resources
tilt explain cmd
tilt get cmd
tilt describe cmd gendocs:update
tilt get session
tilt dump webview
tilt dump engine
-->

### Tips

#### Visual Studio Code

```sh
#
code --install-extension tilt-dev.Tiltfile

#
jq '."recommendations" += ["tilt-dev.Tiltfile"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

#### Demo

```sh
#
tilt demo
tilt demo --teardown
```

<!--
#
tilt demo --no-cluster
-->
