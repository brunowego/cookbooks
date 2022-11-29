# Jupyter Notebook

## References

- [Working with the Python Interactive window](https://code.visualstudio.com/docs/python/jupyter-support-py)

## Tools

- Code Ocean
- Gigantum
- Kubeflow
- Polyaxon
- Renku
- Valohai

<!-- https://github.com/SwissDataScienceCenter/r10e-ds-py/blob/master/notebooks/02-Tools.ipynb -->

## Docker

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h jupyter \
  -v jupyter-data:/home/jovyan/work \
  -p 8888:8888 \
  --name jupyter \
  jupyter/scipy-notebook:d4cbf2f80a2a jupyter notebook \
    --NotebookApp.token='' \
    --NotebookApp.password=''
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8888'
```

### Remove

```sh
docker rm -f jupyter
docker volume rm jupyter-data
```

## CLI

### Installation

#### pip

```sh
pip3 install -U notebook
```

### Commands

```sh
jupyter -h
```

#### Running

```sh
nohup jupyter notebook &
```

#### List

```sh
jupyter notebook list
```

#### Stop

```sh
jupyter notebook stop
```

### Tips

#### Visual Studio Code

```sh
#
code --install-extension colinfang.my-nbpreviewer

#
jq '."recommendations" += ["colinfang.my-nbpreviewer"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

#### Global Kernel

```sh
pip3 install -U ipython ipykernel
```

```sh
ipython kernel install \
  --user \
  --name .venv
```

```sh
jupyter kernelspec list
```

##### Remove

```sh
# Darwin
rm -r ${HOME}/Library/Jupyter/kernels/.venv

# Linux
rm -rf /usr/local/share/jupyter/kernels/.venv
```

#### Kernel with Virtualenv

```sh
source ./.venv/bin/activate
```

```sh
ipython kernel install \
  --name .venv \
  --sys-prefix
```

```sh
jupyter kernelspec list
```

##### Importing from Python code

```py
from os import system

system('source ./.venv/bin/activate')
```
