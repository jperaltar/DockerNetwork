#!/bin/sh

docker network create -d bridge --subnet 172.25.30.0/24 ubuntu14_net
docker network create -d bridge --subnet 172.25.40.0/24 ubuntu16_net
docker network create -d bridge --subnet 172.25.10.0/24 centos6_net
docker network create -d bridge --subnet 172.25.20.0/24 centos7_net


docker build -t ubuntu-14.04-image ubuntu14.04
docker run -ti -d --network=ubuntu14_net --ip=172.25.30.2 --name ubuntu14_1 ubuntu-14.04-image
docker run -ti -d --rm --network=ubuntu14_net --ip=172.25.30.3 --name ubuntu14_2 ubuntu-14.04-image

docker build -t ubuntu-16.04-image ubuntu16.04
docker run -ti -d --rm --network=ubuntu16_net --ip=172.25.40.2 --name ubuntu16_1 ubuntu-16.04-image
docker run -ti -d --rm --network=ubuntu16_net --ip=172.25.40.3 --name ubuntu16_2 ubuntu-16.04-image

docker build -t centos6-image centos6
docker run -ti -d --rm --network=centos6_net --ip=172.25.10.2 --name centos6_1 centos6-image
docker run -ti -d --rm --network=centos6_net --ip=172.25.10.3 --name centos6_2 centos6-image

docker build -t centos7-image centos7
docker run -ti -d --rm --network=centos7_net --ip=172.25.20.2 --name centos7_1 centos7-image
docker run -ti -d --rm --network=centos7_net --ip=172.25.20.3 --name centos7_2 centos7-image

#sudo usermod -aG docker <usuario> Para que no tener que usar sudo antes de docker siempre
