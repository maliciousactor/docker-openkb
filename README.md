# Docker Image for openKB

[![GitHub](http://img.shields.io/badge/github-maliciousactor/docker--openkb-blue.svg?style=plastic)](https://github.com/maliciousactor/docker-openkb/)
[![Build Status](https://img.shields.io/travis/com/maliciousactor/docker-openkb?style=plastic)](https://travis-ci.com/maliciousactor/docker-openkb) [![Docker Pulls](https://img.shields.io/docker/pulls/maliciousactor/openkb?style=plastic)](https://hub.docker.com/r/maliciousactor/openkb)

A [Docker](https://www.docker.com/) image for [openKB](https://github.com/mrvautin/openKB).

### Supported Tags and Respective `Dockerfile` Links

* `latest` ([*/Dockerfile*](https://github.com/maliciousactor/docker-openkb/blob/master/Dockerfile))

---

#### What is openKB?

[openKB](https://github.com/mrvautin/openKB) is a Markdown Knowledge base application (FAQ) built with [Nodejs](https://nodejs.org/) and [ExpressJS](http://expressjs.com/). The application uses an embedded database ([nedb](https://github.com/louischatriot/nedb)) by default but can also use a MongoDB server by changing the config (see below). The application is designed to be easy to use and install and based around search rather than nested categories. Simply search for what you want and select from the results.

---

#### How to Use This Image

##### Pull Docker Image

    $ docker pull maliciousactor/openkb

##### Create Database Directory

    $ mkdir -p ~/docker/openkb/data

##### Run openKB

    $ docker run \
        --name openkb
        --publish 4444:4444 \
        --volume "~/docker/openkb/data:/var/openKB/data" \
      maliciousactor/openkb

##### Use openKB

openKB is accessible at [http://127.0.0.1:4444/](http://127.0.0.1:4444/).

---

#### Running in Production

openKB DOES NOT leverage SSL.

As such, it is strongly recommended to place this behind a proxy, such as nginx, for production use.

#### Exposed Ports

* `4444`: openKB Web Application HTTP Port

---

#### Build from Source

Build the Docker image from source instead of pulling it from Docker Hub:

    $ git clone https://github.com/maliciousactor/docker-openkb docker-openkb
    $ cd openkb
    $ docker build -t maliciousactor/openkb .
