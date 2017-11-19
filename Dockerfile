FROM jenkins/jenkins:lts
USER root

# Used to control Docker and Docker Compose versions installed
ARG DOCKER_ENGINE_VERSION=17.09.0
ARG DOCKER_COMPOSE_VERSION=1.17.1

RUN mkdir -p /tmp/download && \
 curl -L https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_ENGINE_VERSION}-ce.tgz | tar -xz -C /tmp/download && \
 curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-Linux-x86_64 -o /usr/local/bin/docker-compose && \
 rm -rf /tmp/download/docker/dockerd && \
 mv /tmp/download/docker/docker* /usr/local/bin/ && \
 chmod +x /usr/local/bin/docker-compose && \
 rm -rf /tmp/download && \
 groupadd -g 999 docker && \
 usermod -aG staff,docker jenkins

user jenkins
