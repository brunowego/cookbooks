# Miniconda

## Docker

### Running

```sh
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h miniconda \
  --name miniconda \
  docker.io/continuumio/miniconda3:4.6.14 /bin/bash
```

## CLI

### Dependencies

#### YUM

```sh
yum check-update
sudo yum -y install wget
```

### Installation

#### Homebrew

```sh
brew cask install miniconda
```

#### LINUX

```sh
wget -O ./miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && chmod +x ./miniconda.sh
```

```sh
sudo /bin/bash ./miniconda.sh -bp /usr/local/conda
```

```sh
rm ./miniconda.sh
```

### Environment

#### Linux

```sh
sudo tee /etc/profile.d/conda.sh << 'EOF'
export CONDA_HOME='/usr/local/conda'
export PATH="$CONDA_HOME/bin:$PATH"
EOF
```

```sh
sudo su - "$USER"
```

### Commands

```sh
conda -h
```

#### Update

```sh
conda update --all -y
```

#### Shell

```sh
# for bash
eval "$(conda shell.bash hook)"

# for zsh
eval "$(conda shell.zsh hook)"
```

#### Create

```sh
conda create -n [name] -y python=3.6

#
conda activate [name]

#
conda deactivate
```

#### Install

```sh
conda install [package...]
```

##### Channel

```sh
conda install -c conda-forge [package...]
```
