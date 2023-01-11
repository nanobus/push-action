FROM ubuntu:latest
RUN apt-get update && apt-get install -y wget
RUN wget -q https://nanobus.io/install.sh -O - | /bin/bash

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]