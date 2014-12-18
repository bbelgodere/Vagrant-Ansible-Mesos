# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
    config.vm.box = "ubuntu/trusty64"
    config.vm.box_check_update = false

    config.vm.provider "virtualbox" do |vb|
        vb.customize ["modifyvm", :id, "--memory", "512"]
        vb.customize ["modifyvm", :id, "--cpus", "1"]
    end

    config.vm.define "mesosmaster1" do |mesosmaster1|
        mesosmaster1.vm.hostname = "mesos-master1"
        mesosmaster1.vm.network "private_network", ip: "192.168.10.1"
        #amb0.vm.provision :shell, path: "launch-amb-master.sh"
    end
    config.vm.define "mesosmaster2" do |mesosmaster2|
        mesosmaster2.vm.hostname = "mesos-master2"
        mesosmaster2.vm.network "private_network", ip: "192.168.10.2"
        #amb0.vm.provision :shell, path: "launch-amb-master.sh"
    end
    config.vm.define "mesosmaster3" do |mesosmaster3|
        mesosmaster3.vm.hostname = "mesos-master3"
        mesosmaster3.vm.network "private_network", ip: "192.168.10.3"
        #amb0.vm.provision :shell, path: "launch-amb-master.sh"
    end
    config.vm.define "mesosslave1" do |mesosslave1|
        mesosslave1.vm.hostname = "mesos-slave1"
        mesosslave1.vm.network "private_network", ip: "192.168.20.1"
        #amb0.vm.provision :shell, path: "launch-amb-master.sh"
    end
    config.vm.define "mesosslave2" do |mesosslave2|
        mesosslave2.vm.hostname = "mesos-slave2"
        mesosslave2.vm.network "private_network", ip: "192.168.20.2"
        #amb0.vm.provision :shell, path: "launch-amb-master.sh"
    end
    config.vm.define "mesosslave3" do |mesosslave3|
        mesosslave3.vm.hostname = "mesos-slave3"
        mesosslave3.vm.network "private_network", ip: "192.168.20.3"
        #amb0.vm.provision :shell, path: "launch-amb-master.sh"

        mesosslave3.vm.provision :ansible do |ansible|
            ansible.groups = {
                "master_nodes" => ["mesosmaster1", "mesosmaster2", "mesosmaster3"],
                "slave_nodes" => ["mesosslave1", "mesosslave2", "mesosslave3"],
                "all_groups:children" => [ "master_nodes", "slave_nodes"]
            }
            ansible.playbook = "ansible/cluster.yml"
            
            ansible.verbose = "v"
            # Disable default limit (required with Vagrant 1.5+)
            ansible.limit = 'all'
        end
    end
end
