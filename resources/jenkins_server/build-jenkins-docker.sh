#!/bin/bash

# Build the image from the Dockerfile
docker build -t myjenkins .

# Start the container using docker
docker run -u 0 --privileged --name jenkins_container -it -d  \
      -p 8080:8080 \
      -p 50000:50000 \
      -v /var/run/docker.sock:/var/run/docker.sock \
      -v $(which minikube):/usr/bin/minikube \
      -v $(which kubectl):/usr/bin/kubectl \
      -v $(which docker):/usr/bin/docker \
      -v jenkins_home:/var/jenkins_home myjenkins:latest
