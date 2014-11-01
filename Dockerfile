FROM kjunine/ubuntu:latest
MAINTAINER Daniel Ku "kjunine@gmail.com"
ENV REFRESHED_AT 2014-11-01

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
    echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list && \
    apt-get update && \
    apt-get install -y mongodb-org

VOLUME "/data"
WORKDIR /data

EXPOSE 27017

ENTRYPOINT ["mongod", "--dbpath", "/data"]
