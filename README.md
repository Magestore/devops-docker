# Docker image

This is docker in docker to run

## Usage

### Build

```
docker build -t thinlt/docker .
```

### Push to hub.docker.com

```
docker push thinlt/docker
```

### Pull from hub.docker.com

```
docker pull thinlt/docker
```

### Run docker-compose inside docker

```
docker run -it -d --privileged -p 80:80 -p 443:443 --name my_lamp_docker -v "`pwd`:/app" thinlt/docker up -d
```

example run docker lamp in docker

```
git clone https://github.com/Magestore/devops-docker-lamp.git
cd devops-docker-lamp \
   && docker run -it -d --privileged -p 80:80 -p 443:443 --name my_lamp_docker -v "`pwd`:/app" thinlt/docker up -d
```

see version of thinlt/docker

```
docker run -it --rm thinlt/docker
```
