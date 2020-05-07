# Teamcity MSBuild Build Agent Docker Image and Docker-Compose

### Dockerfile
This Dockerfile will build an image which has build tools installed for both Visual Studio 2017 and .Net Core 2.2.  Additionally, it will execute the **install-script.ps1** powershell script to install NodeJS, Git, Gulp, and Bower

### docker-compose.yml

This docker compose definition will create a build agent container pointing to the indicated TeamCity Server and maps the configuration location (c:/BuildAgent/conf) to a location on the Docker host.


