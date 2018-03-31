#!/bin/sh

docker stop ubuntu14_1
docker stop ubuntu14_2
docker stop ubuntu16_1
docker stop ubuntu16_2
docker stop centos6_1
docker stop centos6_2
docker stop centos7_1
docker stop centos7_2

docker network rm ubuntu14_net
docker network rm ubuntu16_net
docker network rm centos6_net
docker network rm centos7_net
