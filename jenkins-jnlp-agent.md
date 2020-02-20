# Jenkins JNLP Agent

## Docker

### Dependencies

#### Create Node

1. Manage Jenkins
2. Manage Nodes
3. New Node
   - Node name: slave
   - Check: Permanent Agent
   - Ok
4. Node slave
   - Remote root directory: /home/jenkins/agent
   - Launch method: (Select) Launch agent by connecting it to the master
   - Save
5. Click: slave
6. Copy Secret

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h jenkins-jnlp-slave \
  -e JENKINS_URL="http://127.0.0.1:8080" \
  -e JENKINS_SECRET=[secret] \
  -e JENKINS_AGENT_NAME=slave \
  -e JENKINS_AGENT_WORKDIR=/home/jenkins \
  -v $(pwd):/var/jenkins_home \
  -v /etc/localtime:/etc/localtime:ro \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  --name jenkins-jnlp-slave \
  jenkins/jnlp-slave:3.29-1
```

### Remove

```sh
docker rm -f jenkins-jnlp-slave
```
