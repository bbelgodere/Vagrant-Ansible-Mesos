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

    config.vm.define "master1" do |master1|
        master1.vm.hostname = "master1"
        master1.vm.network "private_network", ip: "192.0.2.1"
        #master1.vm.provision :shell, path: "launch-amb-master.sh"
    end
    config.vm.define "master2" do |master2|
        master2.vm.hostname = "-master2"
        master2.vm.network "private_network", ip: "192.0.2.2"
        #master2.vm.provision :shell, path: "launch-amb-master.sh"
    end
    config.vm.define "master3" do |master3|
        master3.vm.hostname = "-master3"
        master3.vm.network "private_network", ip: "192.0.2.3"
        #master3.vm.provision :shell, path: "launch-amb-master.sh"
    end
    config.vm.define "slave1" do |slave1|
        slave1.vm.hostname = "-slave1"
        slave1.vm.network "private_network", ip: "192.0.2.51"
        #slave1.vm.provision :shell, path: "launch-amb-master.sh"
    end
    config.vm.define "slave2" do |slave2|
        slave2.vm.hostname = "-slave2"
        slave2.vm.network "private_network", ip: "192.0.2.52"
        #slave2.vm.provision :shell, path: "launch-amb-master.sh"
    end
    config.vm.define "slave3" do |slave3|
        slave3.vm.hostname = "-slave3"
        slave3.vm.network "private_network", ip: "192.0.2.53"
        #slave3.vm.provision :shell, path: "launch-amb-master.sh"

        slave3.vm.provision :ansible do |ansible|
            ansible.groups = {
                "master_nodes" => ["master1", "master2", "master3"],
                "slave_nodes" => ["slave1", "slave2", "slave3"],
                "all_groups:children" => [ "master_nodes", "slave_nodes"]
            }
            ansible.playbook = "ansible/cluster.yml"
            
            ansible.verbose = "v"
            # Disable default limit (required with Vagrant 1.5+)
            ansible.limit = 'all'
        end
    end
end
