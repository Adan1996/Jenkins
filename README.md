# How to configure Jenkins in docker

## First step
Build the docker compose
```
docker-compose build
```

Create container
```
docker-compose up -d
```

## Installing more tools

Add code below into Dockerfile
```
FROM jenkins/jenkins:lts
# if we want to install via apt
USER root
RUN apt-get update && apt-get install -y ruby make more-thing-here
...
```

Run this command after adding code above
```
docker-compose build