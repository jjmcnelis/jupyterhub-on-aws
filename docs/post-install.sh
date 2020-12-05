#!/bin/bash

USERNAME=
PASSWORD=

# Install core deb utilities with apt package manager:
sudo apt update && sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    software-properties-common \
    curl

# Download and add the apt key for docker community edition:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add docker to the apt repository list:
sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

# Update local packages and install docker-ce:
sudo apt update && sudo apt install -y docker-ce

# Pull the repo2docker image from dockerhub public repo:
sudo docker pull jupyter/repo2docker:master

# Download and execute tljh post launch script:
curl -L https://tljh.jupyter.org/bootstrap.py | sudo python3 - \
  --admin admin:!0MemphisMemphis10 \
  --showprogress-page \
  --user-requirements-txt-url https://raw.githubusercontent.com/jjmcnelis/jupyterhub-on-aws/master/docs/requirements.txt \
  --plugin git+https://github.com/kafonek/tljh-shared-directory \
           git+https://github.com/plasmabio/tljh-repo2docker@master
           #git+https://github.com/jjmcnelis/jupyterhub-on-aws@master
