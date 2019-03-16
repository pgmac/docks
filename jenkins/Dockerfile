FROM jenkins/jenkins:latest

USER root
RUN echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" >> /etc/apt/sources.list.d/ansible.list

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 \
 && apt-get -qy update \
 && apt-get -qy upgrade \
 && apt-get -qy install ansible

USER jenkins
