# ChaosToolkit

## Alternatives

- Simian Army
- Gremlin
- Chaos Kong
- [kube-monkey](/kube-monkey.md)

## Links

- [Main Website](http://chaostoolkit.org)

## CLI

### Dependencies

- [Python3](/python/python3.md)
- [Virtualenv](/virtualenv.md)

### Installation

```sh
#
python3 -m venv ~/.venvs/chaostk

#
source  ~/.venvs/chaostk/bin/activate

#
pip install -U chaostoolkit
```

### Commands

```sh
chaos --help
```

### Usage

```sh
#
chaos run

#
chaos discover

#
chaos info

#
chaos init

#
chaos run ./experiment.json

#
chaos settings

#
chaos validate
```
