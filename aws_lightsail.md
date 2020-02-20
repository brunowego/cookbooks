# Amazon Lightsail

## CLI

### Dependencies

- [AWS Command Line Interface (awscli)](/awscli.md)

### Commands

```sh
aws lightsail help
```

### Examples

#### Get

```sh
# Get BlueprintsGet Blueprints
aws lightsail get-blueprints \
  --query 'blueprints[*].[blueprintId,type,platform,name,version]' \
  --output table

# Get Bundles
aws lightsail get-bundles \
  --query 'bundles[*].[bundleId,price,cpuCount,ramSizeInGb,diskSizeInGb]' \
  --output table

# Get Regions
aws lightsail get-regions --include-availability-zones \
  --query 'regions[*].[availabilityZones[*][zoneName,state]]'

# Get Key Pairs
aws lightsail get-key-pairs
```

#### Create Key Pair

```sh
sudo mkdir -p /etc/ssl/certs/example
```

```sh
aws lightsail create-key-pair \
  --key-pair-name 'example-lightsail-keypair' \
  --query 'privateKeyBase64' \
  --output text | \
  sudo tee /etc/ssl/certs/example/lightsail-keypair.pem
```

#### Create Instance

```sh
aws lightsail create-instances \
  --instance-names 'lightsail-example-vm' \
  --availability-zone 'us-east-1a' \
  --blueprint-id 'ubuntu_18_04' \
  --bundle-id 'medium_2_0' \
  --key-pair-name 'example-lightsail-keypair' \
  --tags 'key=Environment, value=Dev' \
  --user-data "$(cat << \EOF
sudo apt update
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt -y install docker-ce
sudo usermod -aG docker "$USER" && sudo su - "$USER"
EOF
)"
```

#### Get Instances

```sh
aws lightsail get-instances \
  --query 'instances[*][name,blueprintName,hardware.cpuCount,hardware.ramSizeInGb,state.name]' \
  --output table
```

##### Public IP Address

```sh
aws lightsail get-instance \
  --instance-name 'lightsail-example-vm' | \
    jq -r '.instance.publicIpAddress'
```

#### get Instance Access Details

```sh
aws lightsail get-instance-access-details --instance-name 'lightsail-example-vm'
```

#### Get Active Names

```sh
aws lightsail get-active-names
```

#### Static IP

```sh
aws lightsail allocate-static-ip --static-ip-name 'lightsail-example-ip'

aws lightsail attach-static-ip \
  --instance-name 'lightsail-example-vm' \
  --static-ip-name 'lightsail-example-ip'

aws lightsail get-static-ip --static-ip-name 'lightsail-example-ip'
```

#### Access

```sh
ssh -i /etc/ssl/certs/example/lightsail-keypair.pem ubuntu@[IP]
```

#### Open Instance Public Port

```sh
aws lightsail open-instance-public-ports \
  --instance-name 'lightsail-example-vm' \
  --port-info fromPort=[port],toPort=[port],protocol=tcp
```

#### Delete

```sh
aws lightsail detach-static-ip --static-ip-name 'lightsail-example-ip'

aws lightsail delete-instance --instance-name 'lightsail-example-vm'

aws lightsail delete-key-pair --key-pair-name 'example-lightsail-keypair'
```
