FROM debian:8.8

MAINTAINER thinlt <mrthinlt@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV COMPOSE_VERSION 1.14.0

RUN apt-get update -q \
	&& apt-get install -y -q --no-install-recommends curl ca-certificates \
	&& curl -o /usr/local/bin/docker-compose -L \
		"https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m`" \
	&& chmod +x /usr/local/bin/docker-compose

RUN apt-get install -y -q apt-transport-https gnupg2 software-properties-common \
    	&& curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - \
	&& apt-key fingerprint 0EBFCD88

RUN apt-get install -y iptables libapparmor1 libltdl7 \
	&& curl -o docker-ce -L "https://apt.dockerproject.org/repo/pool/testing/d/docker-engine/docker-engine_17.05.0~ce~rc3-0~debian-jessie_amd64.deb" \
	&& dpkg -i docker-ce && docker --version

# copy source to /app
COPY entrypoint.sh /app/entrypoint.sh

# This container is a chrooted docker-compose
WORKDIR /app

VOLUME ["/app"]

EXPOSE 80 443

ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["version"]

