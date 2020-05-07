# Docker Registry Docker Compose 

### file: docker-compose.yml

This docker-compose file will run a docker registry container with TLS support and basic authentication.  The certificate files are created using the Let's Encrypt certbot on an nginx proxy VM and copied to my docker server.  Additionally, you can create the **htpasswd** file following the instructions for [deploying a registry server](https://docs.docker.com/registry/deploying/#native-basic-auth).

##NOTE
In order for this registry to support both Windows and Linux images, Registry Validation is disabled (see the **REGISTRY_VALIDATION_DISABLED** environmental variable)


