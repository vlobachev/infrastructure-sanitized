# Management Suite
## file: common.yml
## file: docker-compose.yml

These files combine to define four separate containers that make up the Gravitee UI/API Management portal

1. Elasticsearch - Gravitee uses ElasticSearch for some of its reporting features.
2. MongoDB - Gravitee uses MongoDB as its main datastore
3. Gravitee Management API - This is the main API for the Gravitee API Management Portal.
4. Gravitee Management UI - This is the main UI for the Gravitee API Management Portal.

To use these out of the box, all you should need to do is replace **your.docker.server** in *management-docker-compose.yml* with the IP/Machine name of the docker server which is running these containers. 
