ansible master_nodes -a 'sudo service mesos-master restart'
ansible master_nodes -a 'sudo service marathon restart'
ansible master_nodes -a 'sudo service chronos restart'
