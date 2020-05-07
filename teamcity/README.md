# Teamcity Server Docker Compose 

### file: docker-compose.yml

This docker-compose file will run a teamcity server container.  The default image uses port 8111 for the UI, which I mapped to port 1979 on the host.  Additionally, two volumes are mounted for the TeamCity data directory (which houses build artifacts) and TeamCity server logs


