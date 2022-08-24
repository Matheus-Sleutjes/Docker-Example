# Docker-Example
## Configure

Download a [Docker Desktop](https://docs.docker.com/desktop/) so that you can run the commands below.

## Build

Run `docker build -t name-image .` in same folder included `Dockerfile` for create a image docker.

Run `docker container run -p 5000:80 name-image` for create a container in port 5000.

## Testing

Search in your browser `localhost:5000/Teste`.

## About Project

This project was done in ASPNET 6 and Docker Desktop, in order to learn.

!! For now, only the API part was done, I intend to do a FrontEnd and Database Docker file !!
