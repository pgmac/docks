#!/bin/sh

ACTION=${1:-"run"}
TAG=${2:-$(basename $0 .sh)}
VERSION=${3:-$USER}

WORKDIR=~/Development/docks/jenkins

if [ ${ACTION} = "stop" ]
then
  docker stop ${TAG}
  exit 0
fi

if [ ${ACTION} = "upgrade" ]
then
  docker stop ${TAG}
  ACTION="build"
fi

if [ ${ACTION} = "build" ]
then
  docker rm ${TAG}
  cd ${WORKDIR}
  docker build --pull -f Dockerfile -t ${TAG}:${VERSION} .
fi

echo "Starting ${TAG}"
# Run the Dockerfile one that does more of the things
docker run -d -p 8081:8080 -p 50000:50000 \
       --restart=always \
       -v ${WORKDIR}/volumes/home:/var/jenkins_home \
       -v ${WORKDIR}/config/resolv.conf:/etc/resolv.conf \
       -v /etc/timezone:/etc/timezone \
       -v /etc/localtime:/etc/localtime \
       --name="${TAG}" \
       ${TAG}:${VERSION}
