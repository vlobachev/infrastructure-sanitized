# Unifi Controller Docker Compose 

### file: docker-compose.yml

This docker-compose file will run a Unifi Controller container based on the [image](https://hub.docker.com/r/jacobalberty/unifi/) maintained by **jacobalberty**.  It includes the necessary port exposures for communication, as well as proper setup of the time zone using the environmental variables.  

A more complete [docker-compose file](https://github.com/jacobalberty/unifi-docker) is available from the package author which includes separation of the mongodb instance, but this configuration works well for my home network.



