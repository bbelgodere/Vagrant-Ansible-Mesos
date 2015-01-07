#  Building an HA Mesos Cluster utilizing Vagrant and Ansible
======================================================================

## Description
Originally based on a combination of the Digital Ocean [How To Configure a Production-Ready Mesosphere Cluster on Ubuntu 14.04](https://www.digitalocean.com/community/tutorials/how-to-configure-a-production-ready-mesosphere-cluster-on-ubuntu-14-04) and the Mesosphere [Docker on Mesosphere](http://mesosphere.com/docs/tutorials/launch-docker-container-on-mesosphere/) tuturials.

For an overview on Mesos please see:


## Requirements
You only need Vagrant, Virtual Box(or some other Vagrant provider), and Ansible

How to install Vagrant on your system is described at the [Vagrant documentation](https://docs.vagrantup.com/v2/installation/).

How to install Ansible on your system is described at the [Ansible documentation](http://docs.ansible.com/intro_installation.html).

or if you are on OSX and have homebrew and cask installed.

```shell
brew install ansible && brew cask install vagrant virtualbox
```

## Quickstart
To Start all machines 

```shell
vagrant up 
``` 
After the successful boot-up
Mesos UI will be accessible [192.0.2.11:5050](192.0.2.11:5050) 
###### * if 192.0.2.11 is not currently the zookeeper elected mesos leader, it will automatically redirect you.


## Vagrant Cluster Environment 
The Environment below is established in the vagrant file. After deploying the VM's Vagrant generates a inventory of all the machines which is consumed by Ansible for provisioning. This setup utilizes the default vagrant key in ~/.vagrant.d/insecure_private_key and the vagrant userid

| Hostname | Function     | Static IP Address |
| -------- | ------------ | ----------------- |
| master1  | Mesos master | 192.0.2.11        |
| master2  | Mesos master | 192.0.2.12        |
| master3  | Mesos master | 192.0.2.13        |
| slave1   | Mesos slave  | 192.0.2.51        |
| slave2   | Mesos slave  | 192.0.2.52        |
| slave3   | Mesos slave  | 192.0.2.53        |
###### Currently the ansible playbook requires the Master hostnames to each have a different number between 1-255 which is used to set the zookeeper ID for the machine ie. master1 = zookeeper id 1. 

##Components

The Mesos masters each have zookeeper, mesos, marathon, and chronos installed and the mesos slaves have mesos and docker installed.

[Zookeeper:](https://zookeeper.apache.org/) ZooKeeper is a centralized service for maintaining configuration information, naming, providing distributed synchronization, and providing group services.

[Mesos:](http://mesos.apache.org/) A distributed systems kernel

[Marathon:](http://mesosphere.github.io/marathon/) A cluster-wide init and control system for services in cgroups or Docker containers

[Chronos:](http://nerds.airbnb.com/introducing-chronos/) A distributed and fault-tolerant scheduler replacement for cron

[Docker:](https://www.docker.com/) An open platform for distributed applications for developers and sysadmins. 

##Ansible Groups and Roles
###Mesos Masters
###Mesos Slaves


