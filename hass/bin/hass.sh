#!/bin/sh

if [ $1 = "upgrade" ]
then
	echo "Building the upgraded version of Hass"
	docker stop home-assistant
	docker rm home-assistant
	docker pull homeassistant/home-assistant:latest
	docker tag homeassistant/home-assistant:latest homeassistant/home-assistant:pgmac
fi

echo "Starting Hass"
docker run -d \
       --restart=always \
       --name="home-assistant" \
       -v ~/Development/home-assistant/config:/config \
       -v /etc/localtime:/etc/localtime.ro \
       --net=host \
       homeassistant/home-assistant:pgmac
