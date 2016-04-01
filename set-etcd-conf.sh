#! /bin/sh
export DOCKER_IP=$(docker-machine ip default)
export ETCD="http://$DOCKER_IP:2379"

etcdctl -C $ETCD member list

etcdctl -C $ETCD set /openstack/database/credentials/repUser myRepUser
etcdctl -C $ETCD set /openstack/database/credentials/repPass myRepPass

etcdctl -C $ETCD set /openstack/database/credentials/adminUser myAdminUser
etcdctl -C $ETCD set /openstack/database/credentials/adminPass myAdminPass

etcdctl -C $ETCD ls /openstack/database/credentials/ --recursive

