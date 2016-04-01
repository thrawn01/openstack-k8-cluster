#! /bin/sh
export DOCKER_IP=$(docker-machine ip default)
docker run -d -e "ETCD_HOST=$DOCKER_IP" -p 3306:3306 -p 4444:4444 -p 4567:4567 -p 4568:4568 thrawn01/openstack-mysql
