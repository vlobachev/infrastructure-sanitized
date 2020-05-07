## API Gateway 
### file: docker-compose.yml

Used to stand up an instance of the api gateway on a remote machine.
**hostname** is the name of the container's host, which will show up in your Gravitee.io Management UI.
The **MONGODB_URI** and **ELASTICSEARCH_ENDPOINTS_0** environmental variables point to the endpoints for these services on the host that is running the Management UI/API.  See the Management compose files for more information. 

To use this file out of the box, replace **your.docker.server** in *gateway-docker-compose.yml* with the IP/Machine name of the docker server which is running the [Management Suite.](https://github.com/spyder007/infrastructure/tree/master/gravitee/management-suite)

## NOTE
The Elasticsearch and MongoDB containers are configured without security.  If your docker server is fully open to the internet, it would be wise to add additional security.  Alternatively, if you are running the gateway and management suite on the same docker container, you can always remove the port publishing for those containers and use the internal network addresses.   The samples provided by [Gravitee.io](https://github.com/gravitee-io/graviteeio-access-management) use this configurations.
