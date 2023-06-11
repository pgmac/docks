FROM summerwind/actions-runner-dind-rootless:ubuntu-22.04

USER root
RUN apt-add-repository universe
RUN apt-get update && apt-get -y upgrade && apt-get install -y sshpass

USER runner
